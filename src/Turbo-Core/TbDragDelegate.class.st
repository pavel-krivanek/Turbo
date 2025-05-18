"
Drag delegate provides drag items when a visual element lifts.
Drag gesture fails if there are no drag items
"
Class {
	#name : 'TbDragDelegate',
	#superclass : 'Object',
	#instVars : [
		'items'
	],
	#category : 'Turbo-Core-Utilities - Drag&Drop',
	#package : 'Turbo-Core',
	#tag : 'Utilities - Drag&Drop'
}

{ #category : 'drag and drop' }
TbDragDelegate >> cancel: aPoint [
	"Cancel drag and animate previews"	
	| aCancelAnimation |

	aCancelAnimation := TbParallelAnimation with: (self items collect: [ :aDragItem |
		| aPreviewBounds aSourceBounds aPreviewElement |
		aPreviewElement := aDragItem previewElement.
		
		aPreviewBounds := aPreviewElement bounds inSpace.
		aSourceBounds := aDragItem sourceElement bounds inSpace.
		
		TbNumberTransition new
			from: (aPreviewBounds position);
			to: (aSourceBounds center - (aPreviewBounds extent / 2.0));
			easing: (TbDecelerateInterpolator factor: 2);
			duration: 500 milliSeconds;
			onStepDo: [ :aPosition | aPreviewElement relocate: aPosition ];
			onFinishedDo: [ aPreviewElement removeFromParent ].
	]).

	aCancelAnimation start
]

{ #category : 'drag and drop' }
TbDragDelegate >> drag: aPoint [
	"Drag all previews to a given point in parent coordinates of previews"
	
	self items do: [ :aDragItem | aDragItem previewElement relocate: aPoint ]
]

{ #category : 'initialization' }
TbDragDelegate >> initialize [
	super initialize.

	items := { }
]

{ #category : 'accessing' }
TbDragDelegate >> items [
	"Drag gesture fails if there are no drag items"
	<return: #SequenceableCollection of: #BlDragItem>

	^ items
]

{ #category : 'accessing' }
TbDragDelegate >> items: aCollectionOfDragItems [
	items := aCollectionOfDragItems
]

{ #category : 'drag and drop' }
TbDragDelegate >> lift: aPoint in: anElement [
	"Lift previews at a given point in space coordinates"

	anElement addChildren: (self items collect: [ :aDragItem |
		aDragItem previewElement relocate: aPoint
	])
]
