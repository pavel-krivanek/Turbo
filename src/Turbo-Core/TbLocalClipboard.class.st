Class {
	#name : #TbLocalClipboard,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'clipData'
	],
	#classVars : [
		'Default'
	],
	#category : #'Turbo-Core-Universe'
}

{ #category : #'as yet unclassified' }
TbLocalClipboard class >> clear [
	Default := nil
]

{ #category : #'as yet unclassified' }
TbLocalClipboard class >> clipData [
	^ self default clipData
]

{ #category : #'as yet unclassified' }
TbLocalClipboard class >> clipData: anObject [
	self default clipData: anObject
]

{ #category : #'as yet unclassified' }
TbLocalClipboard class >> default [
	^ Default ifNil: [ Default := self new ]
]

{ #category : #accessing }
TbLocalClipboard >> clipData [
	^ clipData
]

{ #category : #accessing }
TbLocalClipboard >> clipData: anObject [
	clipData := anObject
]
