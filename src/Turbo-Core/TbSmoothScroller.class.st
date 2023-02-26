Class {
	#name : #TbSmoothScroller,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'isRunning',
		'pendingInitialRun'
	],
	#category : #'Turbo-Core-Utilities - Scrolling'
}

{ #category : #'api - testing' }
TbSmoothScroller >> isPendingInitialRun [
	^ pendingInitialRun
]

{ #category : #'api - testing' }
TbSmoothScroller >> isRunning [
	^ isRunning
]

{ #category : #'api - scrolling' }
TbSmoothScroller >> scrollBy: aPoint [
	self subclassResponsibility
]
