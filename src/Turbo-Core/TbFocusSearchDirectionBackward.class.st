Class {
	#name : 'TbFocusSearchDirectionBackward',
	#superclass : 'TbFocusSearchDirectionRelative',
	#category : 'Turbo-Core-Utilities - Focus',
	#package : 'Turbo-Core',
	#tag : 'Utilities - Focus'
}

{ #category : 'focus' }
TbFocusSearchDirectionBackward >> initFocusedBounds: aFocusedBounds root: aFocusRootElement [

	aFocusRootElement layout isRightToLeft
		ifTrue: [ 
			aFocusedBounds
				left: 0
				top: 0
				right: 0
				bottom: 0 ]
		ifFalse: [
			aFocusedBounds
				left: aFocusRootElement width
				top: aFocusRootElement height
				right: aFocusRootElement width
				bottom: aFocusRootElement height ]
]
