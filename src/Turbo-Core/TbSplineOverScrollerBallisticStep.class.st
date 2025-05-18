Class {
	#name : 'TbSplineOverScrollerBallisticStep',
	#superclass : 'TbSplineOverScrollerStep',
	#category : 'Turbo-Core-Utilities - Scrolling Helpers',
	#package : 'Turbo-Core',
	#tag : 'Utilities - Scrolling Helpers'
}

{ #category : 'hooks' }
TbSplineOverScrollerBallisticStep >> onFinished: aSplineOverScroller [
	"Scroller being in ballistic state should spring back, so we continue"
	<return: #Boolean>
	| aNewStartTime |
	
	aNewStartTime := aSplineOverScroller startTime + aSplineOverScroller duration.
	aSplineOverScroller startTime: aNewStartTime.

	"yes, we need to invert positions to spring back"
	aSplineOverScroller
		startSpringbackFor: 0
		start: aSplineOverScroller finalPosition
		end: aSplineOverScroller startPosition.

	^ true
]
