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
	^ BlStaticCursor new image: Cursor normal
]

{ #category : #constants }
TbCursor class >> overEditableText [ 
	^ BlStaticCursor new image: Cursor overEditableText 
]

{ #category : #'as yet unclassified' }
TbCursor class >> resizeBottom [
	^ BlStaticCursor new image: Cursor resizeBottom
]

{ #category : #'as yet unclassified' }
TbCursor class >> resizeBottomLeft [
	^ BlStaticCursor new image: Cursor resizeBottomLeft
]

{ #category : #'as yet unclassified' }
TbCursor class >> resizeBottomRight [
	^ BlStaticCursor new image: Cursor resizeBottomRight
]

{ #category : #'as yet unclassified' }
TbCursor class >> resizeLeft [
	^ BlStaticCursor new image: Cursor resizeLeft
]

{ #category : #'as yet unclassified' }
TbCursor class >> resizeRight [
	^ BlStaticCursor new image: Cursor resizeRight
]

{ #category : #'as yet unclassified' }
TbCursor class >> resizeTop [
	^ BlStaticCursor new image: Cursor resizeTop
]

{ #category : #'as yet unclassified' }
TbCursor class >> resizeTopLeft [
	^ BlStaticCursor new image: Cursor resizeTopLeft
]

{ #category : #'as yet unclassified' }
TbCursor class >> resizeTopRight [
	^ BlStaticCursor new image: Cursor resizeTopRight
]

{ #category : #'as yet unclassified' }
TbCursor class >> wait [
	^ BlStaticCursor new image: Cursor wait
]

{ #category : #'as yet unclassified' }
TbCursor >> activateOn: aSpace [
	
]

{ #category : #'as yet unclassified' }
TbCursor >> deactivateOn: aSpace [
	
]
