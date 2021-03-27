Class {
	#name : #TbSplineOverScrollerScrollMode,
	#superclass : #TbSplineOverScrollerMode,
	#instVars : [
		'interpolator',
		'startPosition',
		'distance',
		'duration'
	],
	#category : #'Turbo-Core-Utilities - Scrolling Helpers'
}

{ #category : #updating }
TbSplineOverScrollerScrollMode >> continueOn: aSplineOverScroller [
	"Simple scroll mode does not need to continue, animation can be finished"
	<return: #Boolean>

	^ false
]

{ #category : #accessing }
TbSplineOverScrollerScrollMode >> distance [
	^ distance
]

{ #category : #accessing }
TbSplineOverScrollerScrollMode >> distance: anObject [
	distance := anObject
]

{ #category : #accessing }
TbSplineOverScrollerScrollMode >> duration [
	<return: #Duration>

	^ duration
]

{ #category : #accessing }
TbSplineOverScrollerScrollMode >> duration: aDuration [

	self
		assert: [ aDuration isNumber not ]
		description: [ 'Duration must not be a typeless number' ].

	duration := aDuration
]

{ #category : #initialization }
TbSplineOverScrollerScrollMode >> initializeOn: aSplineOverScroller [
	aSplineOverScroller isFinished: false.
	
	aSplineOverScroller startPosition: self startPosition.
	aSplineOverScroller currentPosition: self startPosition.
	aSplineOverScroller finalPosition: self startPosition + self distance.
	
	aSplineOverScroller updateTime
		ifNil: [ aSplineOverScroller startTime: aSplineOverScroller time now ]
		ifNotNil: [ aSplineOverScroller startTime: aSplineOverScroller updateTime ].

	aSplineOverScroller duration: self duration.
	
	aSplineOverScroller deceleration: 0.0.
	aSplineOverScroller startVelocity: 0
]

{ #category : #accessing }
TbSplineOverScrollerScrollMode >> interpolator [
	^ interpolator
]

{ #category : #accessing }
TbSplineOverScrollerScrollMode >> interpolator: anObject [
	interpolator := anObject
]

{ #category : #accessing }
TbSplineOverScrollerScrollMode >> startPosition [
	^ startPosition
]

{ #category : #accessing }
TbSplineOverScrollerScrollMode >> startPosition: anObject [
	startPosition := anObject
]

{ #category : #updating }
TbSplineOverScrollerScrollMode >> updateOn: aSplineOverScroller [
	<return: #Boolean>
	| aCurrentTime anElapsedTime aDuration |

	aCurrentTime := aSplineOverScroller time now.

	anElapsedTime := aCurrentTime - aSplineOverScroller startTime.
	aDuration := aSplineOverScroller duration.

	anElapsedTime < aDuration
		ifTrue: [ 
			| anInterpolatedTime anInterpolatedTranslation aNewPosition |
			
			anInterpolatedTime := self interpolator interpolate: (anElapsedTime / aDuration) asFloat.			
			anInterpolatedTranslation := anInterpolatedTime * (aSplineOverScroller finalPosition - aSplineOverScroller startPosition).
			aNewPosition := aSplineOverScroller startPosition + anInterpolatedTranslation.
			
			aSplineOverScroller currentPosition: aNewPosition ].
		
	^ anElapsedTime < aDuration
]
