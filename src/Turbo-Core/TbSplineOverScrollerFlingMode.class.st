Class {
	#name : 'TbSplineOverScrollerFlingMode',
	#superclass : 'TbSplineOverScrollerMode',
	#instVars : [
		'velocity',
		'startPosition',
		'minPosition',
		'maxPosition',
		'overshotDistance'
	],
	#category : 'Turbo-Core-Utilities - Scrolling Helpers',
	#package : 'Turbo-Core',
	#tag : 'Utilities - Scrolling Helpers'
}

{ #category : 'updating' }
TbSplineOverScrollerFlingMode >> continueOn: aSplineOverScroller [
	| aResult |
	
	aResult := aSplineOverScroller currentStep onFinished: aSplineOverScroller.
	aResult
		ifFalse: [ ^ false ].

	^ true
]

{ #category : 'initialization' }
TbSplineOverScrollerFlingMode >> initializeOn: aSplineOverScroller [
	| aTotalDistance |
		
	aSplineOverScroller overshotDistance: self overshotDistance.
	aSplineOverScroller isFinished: false.

	aSplineOverScroller startPosition: self startPosition.
	aSplineOverScroller startVelocity: self velocity.
	
	
	
	aSplineOverScroller updateTime
		ifNil: [ aSplineOverScroller startTime: aSplineOverScroller time now ]
		ifNotNil: [ aSplineOverScroller startTime: aSplineOverScroller updateTime ].
	
	"aSplineOverScroller startTime = aSplineOverScroller updateTime
		ifFalse: [ aSplineOverScroller startTime: aSplineOverScroller time now ]."
		
	"self velocity isZero ifFalse: [
		{
		#start -> aSplineOverScroller startTime.
		#update -> aSplineOverScroller updateTime.
		#now -> aSplineOverScroller time now } asDictionary logCr ]."

	aSplineOverScroller currentPosition: self startPosition.
	aSplineOverScroller currentVelocity: self velocity.
	
	aSplineOverScroller duration: 0 milliSeconds.
	aSplineOverScroller splineDuration: 0 milliSeconds.
	
	(self startPosition > self maxPosition or: [ self startPosition < self minPosition ])
		ifTrue: [
			^ aSplineOverScroller
				startAfterEdgeFor: self velocity
				start: self startPosition
				min: self minPosition
				max: self maxPosition ].

	aSplineOverScroller switchToSpline.
	aTotalDistance := 0.
	
	"almost zero"
	(self velocity abs < 0.001)
		ifFalse: [ 
			| aSplineDuration |
			
			aSplineDuration := aSplineOverScroller splineFlingDurationFor: self velocity.

			aSplineOverScroller duration: aSplineDuration.
			aSplineOverScroller splineDuration: aSplineDuration.
			
			aTotalDistance := aSplineOverScroller splineFlingDistanceFor: self velocity ].
	
	"spline distance must be a truncated integer to prevent fractional movements"
	aSplineOverScroller splineDistance: (aSplineOverScroller truncated: (aTotalDistance * self velocity sign)).
	aSplineOverScroller finalPosition: self startPosition + aSplineOverScroller splineDistance.

	"Clamp to a valid final position"
	aSplineOverScroller finalPosition < self minPosition
		ifTrue: [ 
			aSplineOverScroller duration: (aSplineOverScroller
				adjustDuration: aSplineOverScroller duration
				start: self startPosition final: self minPosition
				previousFinal: aSplineOverScroller finalPosition).
			aSplineOverScroller finalPosition: self minPosition ].
	
	aSplineOverScroller finalPosition > self maxPosition
		ifTrue: [ 
			aSplineOverScroller duration: (aSplineOverScroller
				adjustDuration: aSplineOverScroller duration
				start: self startPosition final: self maxPosition
				previousFinal: aSplineOverScroller finalPosition).
			aSplineOverScroller finalPosition: self maxPosition ]
]

{ #category : 'accessing' }
TbSplineOverScrollerFlingMode >> maxPosition [
	^ maxPosition
]

{ #category : 'accessing' }
TbSplineOverScrollerFlingMode >> maxPosition: anObject [
	maxPosition := anObject
]

{ #category : 'accessing' }
TbSplineOverScrollerFlingMode >> minPosition [
	^ minPosition
]

{ #category : 'accessing' }
TbSplineOverScrollerFlingMode >> minPosition: anObject [
	minPosition := anObject
]

{ #category : 'accessing' }
TbSplineOverScrollerFlingMode >> overshotDistance [
	^ overshotDistance
]

{ #category : 'accessing' }
TbSplineOverScrollerFlingMode >> overshotDistance: anObject [
	overshotDistance := anObject
]

{ #category : 'accessing' }
TbSplineOverScrollerFlingMode >> startPosition [
	^ startPosition
]

{ #category : 'accessing' }
TbSplineOverScrollerFlingMode >> startPosition: anObject [
	startPosition := anObject
]

{ #category : 'updating' }
TbSplineOverScrollerFlingMode >> updateOn: aSplineOverScroller [
	"Update the current position and velocity for current time.
	Returns true if update has been done and false if animation duration has been reached."
	<return: #Boolean>
	| aCurrentTime aDeltaTime aDistance|

	aCurrentTime := aSplineOverScroller time now.

	aDeltaTime := (aCurrentTime - aSplineOverScroller startTime).

	(aDeltaTime isZero)
		"Skip work but report that we're still going if we have a nonzero duration."
		ifTrue: [ ^ aSplineOverScroller duration isZero not ].

	aDeltaTime > aSplineOverScroller duration
		ifTrue: [ ^ false ].

	aDistance := 0.0.
	
	aSplineOverScroller currentStep = TbSplineOverScrollerStep spline
		ifTrue: [ aDistance := aSplineOverScroller updateSpline: aDeltaTime ].
	aSplineOverScroller currentStep = TbSplineOverScrollerStep ballistic
		ifTrue: [ aDistance := aSplineOverScroller updateBallistic: aDeltaTime ].
	aSplineOverScroller currentStep = TbSplineOverScrollerStep cubic
		ifTrue: [ aDistance := aSplineOverScroller updateCubic: aDeltaTime ].
	
	"Distance must be rounded and position converted to integer to prevent fractional locations"
	aSplineOverScroller currentPosition: (aSplineOverScroller startPosition + (aSplineOverScroller rounded: aDistance)).

	^ true
]

{ #category : 'accessing' }
TbSplineOverScrollerFlingMode >> velocity [
	^ velocity
]

{ #category : 'accessing' }
TbSplineOverScrollerFlingMode >> velocity: anObject [
	velocity := anObject
]
