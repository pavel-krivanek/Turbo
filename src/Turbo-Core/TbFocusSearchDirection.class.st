"
I represent an abstract direction in which the next focusable element should be searched
"
Class {
	#name : 'TbFocusSearchDirection',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#category : 'Turbo-Core-Utilities - Focus',
	#package : 'Turbo-Core',
	#tag : 'Utilities - Focus'
}

{ #category : 'focus' }
TbFocusSearchDirection >> initFocusedBounds: aFocusedBounds root: aFocusRootElement [
	self subclassResponsibility
]

{ #category : 'focus' }
TbFocusSearchDirection >> nextFocus: aFocusedElement in: aCollectionOfElements within: aFocusRootElement from: aFocusedBounds finder: aFocusFinder [
	<return: #BlElement>
	
	^ self subclassResponsibility
]
