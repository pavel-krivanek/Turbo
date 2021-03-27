Class {
	#name : #TbSplineOverScrollerStep,
	#superclass : #Object,
	#classInstVars : [
		'spline',
		'cubic',
		'ballistic'
	],
	#category : #'Turbo-Core-Utilities - Scrolling Helpers'
}

{ #category : #accessing }
TbSplineOverScrollerStep class >> ballistic [
	^ ballistic ifNil: [ ballistic := BlSplineOverScrollerBallisticStep new ]
]

{ #category : #cleanup }
TbSplineOverScrollerStep class >> cleanUp [
	super cleanUp.
	
	ballistic := nil.
	cubic := nil.
	spline := nil
]

{ #category : #accessing }
TbSplineOverScrollerStep class >> cubic [
	^ cubic ifNil: [ cubic := BlSplineOverScrollerCubicStep new ]
]

{ #category : #accessing }
TbSplineOverScrollerStep class >> spline [
	^ spline ifNil: [ spline := BlSplineOverScrollerSplineStep new ]
]

{ #category : #comparing }
TbSplineOverScrollerStep >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	^ self class = anObject class
]

{ #category : #comparing }
TbSplineOverScrollerStep >> hash [
	^ self class hash
]

{ #category : #hooks }
TbSplineOverScrollerStep >> onFinished: aSplineOverScroller [
	"Is sent after animation duration is reached. It does not necessarily mean that scrolling should stop,
	for example if we overshoot the target we should to bounce back.
	Return true if animation should continue, false otherwise"
	<return: #Boolean>
	
	^ self subclassResponsibility
]
