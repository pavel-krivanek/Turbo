"
I identify a mouse button being pressed or released by the user.

I am used by BlMouseEvent
"
Class {
	#name : #TbMouseButton,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#category : #'Turbo-Core-Events'
}

{ #category : #accessing }
TbMouseButton class >> code: aNumber [
	^ BlMouseOtherButton code: aNumber
]

{ #category : #accessing }
TbMouseButton class >> middle [
	^ BlMouseMiddleButton uniqueInstance
]

{ #category : #accessing }
TbMouseButton class >> primary [
	^ BlMousePrimaryButton uniqueInstance
]

{ #category : #accessing }
TbMouseButton class >> secondary [
	^ BlMouseSecondaryButton uniqueInstance
]
