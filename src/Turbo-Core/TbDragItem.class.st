"
I represent a model object and embody a drag preview and item provider
"
Class {
	#name : #TbDragItem,
	#superclass : #Object,
	#instVars : [
		'sourceElement',
		'previewElement'
	],
	#category : #'Turbo-Core-Utilities - Drag&Drop'
}

{ #category : #'instace creation' }
TbDragItem >> createPreview [
	<return: #BlElement>
	
	^ TbElement new
		size: 20@20;
		background: Color blue
]

{ #category : #accessing }
TbDragItem >> previewElement [
	^ previewElement ifNil: [ previewElement := self createPreview ]
]

{ #category : #accessing }
TbDragItem >> previewElement: anObject [
	previewElement := anObject
]

{ #category : #accessing }
TbDragItem >> sourceElement [
	^ sourceElement
]

{ #category : #accessing }
TbDragItem >> sourceElement: anObject [
	sourceElement := anObject
]
