"
I represent the cursor used in my world.
"
Class {
	#name : #TbCursor,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#category : #'Turbo-Core-Space'
}

{ #category : #'as yet unclassified' }
TbCursor class >> default [
	^ TbStaticCursor new image: Cursor normal
]

{ #category : #constants }
TbCursor class >> overEditableText [ 
	^ TbStaticCursor new image: Cursor overEditableText 
]

{ #category : #'as yet unclassified' }
TbCursor class >> resizeBottom [
	^ TbStaticCursor new image: Cursor resizeBottom
]

{ #category : #'as yet unclassified' }
TbCursor class >> resizeBottomLeft [
	^ TbStaticCursor new image: Cursor resizeBottomLeft
]

{ #category : #'as yet unclassified' }
TbCursor class >> resizeBottomRight [
	^ TbStaticCursor new image: Cursor resizeBottomRight
]

{ #category : #'as yet unclassified' }
TbCursor class >> resizeLeft [
	^ TbStaticCursor new image: Cursor resizeLeft
]

{ #category : #'as yet unclassified' }
TbCursor class >> resizeRight [
	^ TbStaticCursor new image: Cursor resizeRight
]

{ #category : #'as yet unclassified' }
TbCursor class >> resizeTop [
	^ TbStaticCursor new image: Cursor resizeTop
]

{ #category : #'as yet unclassified' }
TbCursor class >> resizeTopLeft [
	^ TbStaticCursor new image: Cursor resizeTopLeft
]

{ #category : #'as yet unclassified' }
TbCursor class >> resizeTopRight [
	^ TbStaticCursor new image: Cursor resizeTopRight
]

{ #category : #'as yet unclassified' }
TbCursor class >> wait [
	^ TbStaticCursor new image: Cursor wait
]

{ #category : #'as yet unclassified' }
TbCursor >> activateOn: aSpace [
	
]

{ #category : #'as yet unclassified' }
TbCursor >> deactivateOn: aSpace [
	
]
