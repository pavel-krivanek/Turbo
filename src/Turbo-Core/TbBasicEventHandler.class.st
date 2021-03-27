Class {
	#name : #TbBasicEventHandler,
	#superclass : #Object,
	#traits : 'TTbEventHandler + TTbDebug',
	#classTraits : 'TTbEventHandler classTrait + TTbDebug classTrait',
	#category : #'Turbo-Core-Events-Handling'
}

{ #category : #'api - event managing' }
TbBasicEventHandler >> handleEvent: anEvent [
]

{ #category : #'api - hooks' }
TbBasicEventHandler >> onInstalledIn: anObject [
]

{ #category : #'api - hooks' }
TbBasicEventHandler >> onUninstalledIn: anObject [
]

{ #category : #'api - event managing' }
TbBasicEventHandler >> wantsEvent: anEvent [
	^ true
]
