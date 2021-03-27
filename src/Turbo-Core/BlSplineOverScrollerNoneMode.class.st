Class {
	#name : #BlSplineOverScrollerNoneMode,
	#superclass : #BlSplineOverScrollerMode,
	#category : #'Turbo-Core-Utilities - Scrolling Helpers'
}

{ #category : #updating }
BlSplineOverScrollerNoneMode >> continueOn: aSplineOverScroller [
	<return: #Boolean>
	
	^ false
]

{ #category : #updating }
BlSplineOverScrollerNoneMode >> finishOn: aSplineOverScroller [
]

{ #category : #initialization }
BlSplineOverScrollerNoneMode >> initializeOn: aSplineOverScroller [
]

{ #category : #updating }
BlSplineOverScrollerNoneMode >> updateOn: aSplineOverScroller [
	<return: #Boolean>

	^ false
]
