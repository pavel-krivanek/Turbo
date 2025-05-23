Class {
	#name : 'TbScrollFlinger',
	#superclass : 'TbTask',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'interpolator',
		'scroller',
		'lastFlingX',
		'lastFlingY',
		'step',
		'eatRunOnAnimationRequest',
		'reSchedulePostAnimationCallback',
		'scrollable'
	],
	#category : 'Turbo-Core-Utilities - Scrolling',
	#package : 'Turbo-Core',
	#tag : 'Utilities - Scrolling'
}

{ #category : 'instance creation' }
TbScrollFlinger class >> on: aTBlScrollable [

	^ self basicNew
		initializeWith: aTBlScrollable;
		initialize;
		yourself
]

{ #category : 'private - state' }
TbScrollFlinger >> beIdle [
	self scrollable scrollState: #idle
]

{ #category : 'private - state' }
TbScrollFlinger >> beSettling [
	self scrollable scrollState: #settling
]

{ #category : 'private - physics' }
TbScrollFlinger >> computeScrollDurationFor: aVelocityPoint distance: aDeltaPoint [
	<return: #Duration>

	| anAbsDx anAbsDy isHorizontal aVelocity aDelta aContainerSize aHalfContainerSize aDistanceRatio aDistance aDuration |
 
	anAbsDx := aDeltaPoint x abs.
	anAbsDy := aDeltaPoint y abs.
	isHorizontal := anAbsDx > anAbsDy.
	aVelocity := aVelocityPoint r. "sqrt(x*x + y*y)"
	aDelta := aDeltaPoint r. "sqrt(x*x + y*y)"
	aContainerSize := isHorizontal
		ifTrue: [ self scrollable width ]
		ifFalse: [ self scrollable height ].
	aHalfContainerSize := aContainerSize / 2.0.
	aDistanceRatio := (aDelta / aContainerSize) min: 1.0.
	aDistance := aHalfContainerSize + (aHalfContainerSize * (self distanceInfluenceForSnapDuration: aDistanceRatio)).
	
	aDuration := (aVelocity > 0)
		ifTrue: [ 4 * (1000.0 * (aDistance / aVelocity) abs) rounded ]
		ifFalse: [ 
			| anAbsDelta |
			anAbsDelta := isHorizontal
				ifTrue: [ anAbsDx ]
				ifFalse: [ anAbsDy ].
			(((anAbsDelta / aContainerSize) + 1) * 300) asInteger ].
	
	^ aDuration milliSeconds min: self maxScrollDuration
]

{ #category : 'initialization' }
TbScrollFlinger >> createScrollerFor: anInterpolator [
	^ TbOvershootingScroller interpolator: interpolator
]

{ #category : 'initialization' }
TbScrollFlinger >> createState [
	^ TbScrollFlingerState new
]

{ #category : 'initialization' }
TbScrollFlinger >> defaultInterpolator [
	^ TbQuinticInterpolator default
]

{ #category : 'private - scheduling' }
TbScrollFlinger >> disableRunOnAnimationRequests [
	
	reSchedulePostAnimationCallback := false.
	eatRunOnAnimationRequest := true
]

{ #category : 'private - physics' }
TbScrollFlinger >> distanceInfluenceForSnapDuration: aFactorNumber [
	<return: #Number>
	| f |

	f := aFactorNumber - 0.5. "center the values about 0"
	f := f * 0.3 * Float pi / 2.0.
	^ f sin
]

{ #category : 'private - scheduling' }
TbScrollFlinger >> enableRunOnAnimationRequests [

	eatRunOnAnimationRequest := false.
	reSchedulePostAnimationCallback
		ifTrue: [ self postOnAnimation ]
]

{ #category : 'api - scrolling' }
TbScrollFlinger >> flingBy: aVelocityPoint [
	"Positive velocity means that the finger/cursor is moving down the screen, which means we want to scroll towards the top.
	Initial velocity is given in points/second"

	self beSettling.

	lastFlingX := self scrollable scrollPosition x.
	lastFlingY := self scrollable scrollPosition y.
	scroller
		fling: self scrollable scrollPosition
		velocity: aVelocityPoint
		min: self scrollable scrollMinimum
		max: self scrollable scrollMaximum
		overshot: self scrollable scrollOvershot.

	self postOnAnimation
]

{ #category : 'initialization' }
TbScrollFlinger >> initialize [
	super initialize.
	
	lastFlingX := 0.
	lastFlingY := 0.
	interpolator := self defaultInterpolator.
	scroller := self createScrollerFor: interpolator.
	eatRunOnAnimationRequest := false.
	reSchedulePostAnimationCallback := false
]

{ #category : 'initialization' }
TbScrollFlinger >> initializeWith: aTBlScrollable [

	self
		assert: [ aTBlScrollable isNotNil ]
		description: [ 'Scrollable must not be nil' ].

	self
		assert: [ scrollable isNil ]
		description: [ 'I can be initialized only once!' ].

	scrollable := aTBlScrollable
]

{ #category : 'accessing' }
TbScrollFlinger >> interpolator [
	<return: #BlInterpolator>
	
	^ interpolator
]

{ #category : 'api - testing' }
TbScrollFlinger >> isIdle [
	<return: #Boolean>

	^ self scrollable scrollState = #idle
]

{ #category : 'accessing' }
TbScrollFlinger >> lastFlingPosition [
	<return: #Point>
	
	^ lastFlingX @ lastFlingY
]

{ #category : 'initialization' }
TbScrollFlinger >> maxScrollDuration [
	<return: #Duration>

	^ 2 seconds
]

{ #category : 'hooks' }
TbScrollFlinger >> onEnqueued: aBlSpace [
	super onEnqueued: aBlSpace.
	
	self scroller time: aBlSpace time
]

{ #category : 'hooks' }
TbScrollFlinger >> onFinished [
]

{ #category : 'hooks' }
TbScrollFlinger >> onInitialized [
]

{ #category : 'hooks' }
TbScrollFlinger >> onLayoutScrolled [
]

{ #category : 'hooks' }
TbScrollFlinger >> onNotFinished [
]

{ #category : 'hooks' }
TbScrollFlinger >> onPrepareToRun [
]

{ #category : 'hooks' }
TbScrollFlinger >> onSmoothScrolled [
]

{ #category : 'scheduling' }
TbScrollFlinger >> postOnAnimation [

	self
		assert: [ scrollable isNotNil ]
		description: [ 'Can not post on animation if I am not attached to a scrollable' ].

	eatRunOnAnimationRequest
		ifTrue: [ reSchedulePostAnimationCallback := true ]
		ifFalse: [
			self scrollable dequeueTask: self.	
			self scrollable enqueueTask: self ]
]

{ #category : 'running' }
TbScrollFlinger >> pulse [
	"To work with animation manager"

	self run
]

{ #category : 'running' }
TbScrollFlinger >> run [
	| aScroller aSmoothScroller |
		
	self disableRunOnAnimationRequests.
	
	self onPrepareToRun.

	"keep a local reference so that if it is changed during onScrollBy: method,
	it won't cause unexpected behaviors"
	aScroller := scroller.
	aSmoothScroller := self scrollable smoothScroller.

	aScroller run
		ifTrue: [ 
			| aState |
			aState := self runInitOn: aScroller.
			self onInitialized.

			self runLayoutScrollWith: aState.
			self onLayoutScrolled.
			
			self runSmoothOn: aSmoothScroller with: aState.
			self onSmoothScrolled.

			self runOverscrollOn: aScroller with: aState.
			
			aState didScroll
				ifTrue: [ scrollable dispatchOnScrolled: aState hResult @ aState vResult ].
			
			scrollable awakenScrollBars
				ifFalse: [ scrollable invalidate ].
				
			self runFinalizeOn: aScroller with: aState ].
	
	aSmoothScroller ifNotNil: [ 
		aSmoothScroller isPendingInitialRun
			ifTrue: [ aSmoothScroller onScrollBy: 0@0 ].
		"stop if it does not trigger any scroll"
		reSchedulePostAnimationCallback
			ifFalse: [ aSmoothScroller stop ] ].
		
	self enableRunOnAnimationRequests
]

{ #category : 'private' }
TbScrollFlinger >> runFinalizeOn: anOverScroller with: aState [
	| fullyConsumedHorizontal fullyConsumedVertical fullyConsumedAny |
	
	fullyConsumedHorizontal := aState dX isZero not and: [
		self scrollable canScrollHorizontally
			and: [ aState hResult = aState dX ] ].
		
	fullyConsumedVertical := aState dY isZero not and: [
		self scrollable canScrollVertically
			and: [ aState vResult = aState dY ] ].
		
	fullyConsumedAny := aState dX isZero and: [
		aState dY isZero and: [
			fullyConsumedHorizontal or: [ fullyConsumedVertical ] ] ].
	
	(anOverScroller isFinished or: [ fullyConsumedHorizontal and: [ fullyConsumedVertical ] ])
		ifTrue: [
			self beIdle.
			self onFinished ]
		ifFalse: [
			self postOnAnimation.
			self onNotFinished ]
]

{ #category : 'private' }
TbScrollFlinger >> runInitOn: anOverScroller [
	<return: #TbScrollFlingerState>
	| aState |

	aState := self createState.
	aState
		x: anOverScroller currentX;
		y: anOverScroller currentY;
		dX: aState x - lastFlingX;
		dY: aState y - lastFlingY;
		hResult: 0;
		vResult: 0;
		overscrollX: 0;
		overscrollY: 0.
	
	lastFlingX := aState x.
	lastFlingY := aState y.
	
	^ aState
]

{ #category : 'private' }
TbScrollFlinger >> runLayoutScrollWith: aState [
	"A state is an instance of TbScrollFlingerState"

	aState dX isZero
		ifFalse: [ 
			aState hResult: (scrollable scrollHorizontallyBy: aState dX).
			aState overscrollX: aState dX - aState hResult ].
	
	aState dY isZero
		ifFalse: [ 
			aState vResult: (scrollable scrollVerticallyBy: aState dY).
			aState overscrollY: aState dY - aState vResult ]
]

{ #category : 'private' }
TbScrollFlinger >> runOverscrollOn: anOverScroller with: aState [
	| aVelocity aVelocityX aVelocityY |
	
	self scrollable overScrollMode ~= TbOverScrollMode never
		ifTrue: [ self scrollable considerReleasingGlowsOnScroll: aState dX @ aState dY ].
	
	"Should not overscroll if distances in both directions are zero"
	(aState overscrollX isZero and: [
		aState overscrollY isZero ])
			ifTrue: [ ^ self ].
			
	aVelocity := anOverScroller velocity.
	
	aVelocityX := 0.
	(aState overscrollX ~= aState x)
		ifTrue: [
			aVelocityX := (aState overscrollX < 0)
				ifTrue: [ aVelocity x negated ]
				ifFalse: [ (aState overscrollX > 0)
					ifTrue: [ aVelocity x ]
					ifFalse: [ 0 ] ] ].
		
	aVelocityY := 0.
	(aState overscrollY ~= aState y)
		ifTrue: [
			aVelocityY := (aState overscrollY < 0)
				ifTrue: [ aVelocity y negated ]
				ifFalse: [ (aState overscrollY > 0)
					ifTrue: [ aVelocity y ]
					ifFalse: [ 0 ] ] ].
	
	"Overscroll happened, make sure glows are notified"
	(self scrollable overScrollMode ~= TbOverScrollMode never)
		ifTrue: [ self scrollable absorbGlows: aVelocityX @ aVelocityY ].
	
	"Check if we need to finish scrolling"
	((aVelocityX isZero not or: [
		aState overscrollX = aState x or: [ 
			anOverScroller finalX isZero ] ])
		and: [ aVelocityY isZero not or: [
					aState overscrollY = aState y or: [ 
						anOverScroller finalY isZero ] ] ])
			ifTrue: [ anOverScroller finish ]
]

{ #category : 'private' }
TbScrollFlinger >> runSmoothOn: aSmoothScroller with: aState [
	| aDeltaPoint |

	"Can not scroll smoothly using nil scroller
	(which means that smooth scroll was not requested)"
	aSmoothScroller
		ifNil: [ ^ self ].
	
	"Can not scroll if smooth scroller is not yet initialized or not running"
	(aSmoothScroller isPendingInitialRun or: [
		aSmoothScroller isRunning not ])
			ifTrue: [ ^ self ].

	aDeltaPoint := (aState dX - aState overscrollX) @ (aState dY - aState overscrollY).	

	aSmoothScroller scrollBy: aDeltaPoint
]

{ #category : 'accessing' }
TbScrollFlinger >> scrollable [
	<return: #TBlScrollable>

	^ scrollable
]

{ #category : 'accessing' }
TbScrollFlinger >> scroller [
	<return: #BlOvershootingScroller>
	
	^ scroller
]

{ #category : 'api - scrolling' }
TbScrollFlinger >> smoothScrollBy: aDeltaPoint [

	self
		smoothScrollBy: aDeltaPoint
		velocity: 0@0
]

{ #category : 'api - scrolling' }
TbScrollFlinger >> smoothScrollBy: aDeltaPoint during: aDuration [

	self
		smoothScrollBy: aDeltaPoint
		during: aDuration
		with: self defaultInterpolator
]

{ #category : 'api - scrolling' }
TbScrollFlinger >> smoothScrollBy: aDeltaPoint during: aDuration with: anInterpolator [

	interpolator ~~ anInterpolator
		"Interpolator changes, need to re-create a scroller"
		ifTrue: [ 
			interpolator := anInterpolator.
			scroller := self createScrollerFor: interpolator ].
	
	self beSettling.
	lastFlingX := 0.
	lastFlingY := 0.
	scroller startScrollAt: 0@0 by: aDeltaPoint during: aDuration.
	self postOnAnimation
]

{ #category : 'api - scrolling' }
TbScrollFlinger >> smoothScrollBy: aDeltaPoint velocity: aVelocityPoint [

	self
		smoothScrollBy: aDeltaPoint
		during: (self computeScrollDurationFor: aVelocityPoint distance: aDeltaPoint)
]

{ #category : 'api - scrolling' }
TbScrollFlinger >> stop [
	scroller finish
]

{ #category : 'running' }
TbScrollFlinger >> value [
	"To support defer:"
	self run
]
