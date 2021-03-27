"
I manage the dragged values that can be exported in clipboard.

I am not really used for the moment.
"
Class {
	#name : #TbDragboard,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'space',
		'clipData',
		'dragView',
		'transferMode'
	],
	#category : #'Turbo-Core-Space-Support'
}

{ #category : #'as yet unclassified' }
TbDragboard class >> space: aSpace [
	^ self new space: aSpace
]

{ #category : #'as yet unclassified' }
TbDragboard >> clear [
	dragView ifNotNil: [ :dv | dv removeFromParent ].
	clipData := nil
]

{ #category : #accessing }
TbDragboard >> clipData [
	"data insert in the system clipboard"

	^ clipData
]

{ #category : #accessing }
TbDragboard >> clipData: aString [
	clipData := aString.
	"Clipboard clipboardText: aString"
]

{ #category : #accessing }
TbDragboard >> dragView [
	^ dragView 
]

{ #category : #accessing }
TbDragboard >> hasClipData [
	^ self clipData isNotNil
]

{ #category : #accessing }
TbDragboard >> hasLocalData [
	^ self localData isNotNil
]

{ #category : #'as yet unclassified' }
TbDragboard >> initialize [
	super initialize.
	space := TbWeakRef new.
]

{ #category : #accessing }
TbDragboard >> localData [
	"data shared between multiple spaces"

	^ TbLocalClipboard clipData
]

{ #category : #accessing }
TbDragboard >> localData: anObject [
	TbLocalClipboard clipData: anObject
]

{ #category : #accessing }
TbDragboard >> space [
	^ space value
]

{ #category : #accessing }
TbDragboard >> space: anObject [
	space value: anObject
]

{ #category : #accessing }
TbDragboard >> transferMode [
	^ transferMode
]

{ #category : #accessing }
TbDragboard >> transferMode: anObject [
	transferMode := anObject
]
