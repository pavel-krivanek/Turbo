Class {
	#name : 'TbGridLayoutBaselineBounds',
	#superclass : 'TbGridLayoutBounds',
	#instVars : [
		'size'
	],
	#category : 'Turbo-Layout-Grid-Utilities',
	#package : 'Turbo-Layout',
	#tag : 'Grid-Utilities'
}

{ #category : 'accessing' }
TbGridLayoutBaselineBounds >> includeBefore: newBefore after: newAfter [
	super includeBefore: newBefore after: newAfter.
	size := size max: (newBefore + newAfter).
]

{ #category : 'accessing' }
TbGridLayoutBaselineBounds >> offset: anElement alignment: anAlignment size: aSize [
	^ (super offset: anElement alignment: anAlignment size: aSize) max: 0
]

{ #category : 'initialization' }
TbGridLayoutBaselineBounds >> reset [
	super reset.
	size := UNDEFINED
]

{ #category : 'accessing' }
TbGridLayoutBaselineBounds >> size: min [
	^ (super size: min) max: size
]
