"
I identify a mouse button being pressed or released by the user.

I am used by BlMouseEvent
"
Class {
	#name : 'TbMouseButton',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'accessing' }
TbMouseButton class >> code: aNumber [
	^ TbMouseOtherButton code: aNumber
]

{ #category : 'accessing' }
TbMouseButton class >> middle [
	^ TbMouseMiddleButton uniqueInstance
]

{ #category : 'accessing' }
TbMouseButton class >> primary [
	^ TbMousePrimaryButton uniqueInstance
]

{ #category : 'accessing' }
TbMouseButton class >> secondary [
	^ TbMouseSecondaryButton uniqueInstance
]
