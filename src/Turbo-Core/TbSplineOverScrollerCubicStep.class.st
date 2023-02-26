Class {
	#name : #TbSplineOverScrollerCubicStep,
	#superclass : #TbSplineOverScrollerStep,
	#category : #'Turbo-Core-Utilities - Scrolling Helpers'
}

{ #category : #hooks }
TbSplineOverScrollerCubicStep >> onFinished: aSplineOverScroller [
	"Cubic means no spring back, simply finish"
	<return: #Boolean>
	
	^ false
]
