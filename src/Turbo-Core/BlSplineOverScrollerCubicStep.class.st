Class {
	#name : #BlSplineOverScrollerCubicStep,
	#superclass : #BlSplineOverScrollerStep,
	#category : #'Turbo-Core-Utilities - Scrolling Helpers'
}

{ #category : #hooks }
BlSplineOverScrollerCubicStep >> onFinished: aSplineOverScroller [
	"Cubic means no spring back, simply finish"
	<return: #Boolean>
	
	^ false
]
