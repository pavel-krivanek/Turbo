"
I am a holder that uses an immutable array to store children of bloc elements.

Every time a child is added or removed I create a new internal array to store children. 
I optimize the method ${method:BlChildrenArray>>#asArray}$ to directly return the internal array instead of creating a new one. In combination with other iterators that use this method (like ${class:BlChildrenReversed}$) it can reduce the number of arrays created during layout operations, expecially for graph layouts.

!!Examples
Examples are provided by the class ${class:BlChildrenArrayExamples}$
"
Class {
	#name : 'TbChildrenArray',
	#superclass : 'TbChildrenCollection',
	#instVars : [
		'array'
	],
	#category : 'Turbo-Core-Basic-Children',
	#package : 'Turbo-Core',
	#tag : 'Basic-Children'
}

{ #category : 'instance creation' }
TbChildrenArray class >> from: anArrayOfChildren [
	^ self new initializeFrom: anArrayOfChildren
]

{ #category : 'children - adding' }
TbChildrenArray >> add: aChild at: anIndex [
	"Adds aChild at a given index moving existing children to the right"

	array := array copyReplaceFrom: anIndex to: anIndex - 1 with: { aChild }
]

{ #category : 'children - adding' }
TbChildrenArray >> addAll: aSequenceableCollection [
	"Add all the elements from the given collection to the children array.
	If the user passed an array and our current array is empty, we just replace 
	it directly - no need to waste time making a copy of array. Callers should 
	no longer modify the given array."
	array := (array isEmpty and: [ aSequenceableCollection isArray ])
		ifTrue: [ aSequenceableCollection ]
		ifFalse: [ array, aSequenceableCollection ]
]

{ #category : 'converting' }
TbChildrenArray >> asArray [
	"Directly return the internal array used to store children.
	This avoids creating an extra array, as this operation can be called many times.
	Callers should create a copy of the array if they need to modify it,
	as adding or removing elements will create a new array used internally."
	^ array
]

{ #category : 'children - accessing' }
TbChildrenArray >> at: anIndex [
	"Return an element at a given index"
	<return: #BlElement>

	^ array at: anIndex
]

{ #category : 'children - enumerating' }
TbChildrenArray >> do: aBlock [
	array do: aBlock
]

{ #category : 'initialization' }
TbChildrenArray >> initialize [
	super initialize.
	
	array := #()
]

{ #category : 'initialization' }
TbChildrenArray >> initializeFrom: anArrayOfChildren [
	array := anArrayOfChildren asArray
]

{ #category : 'accessing' }
TbChildrenArray >> name [
	^ 'Children array'
]

{ #category : 'children - removing' }
TbChildrenArray >> removeAll: aCollectionOfBlElement [
	array := array copyWithoutAll: aCollectionOfBlElement
]

{ #category : 'children - removing' }
TbChildrenArray >> removeAt: anIndex [
	array := array copyReplaceFrom: anIndex to: anIndex with: #()
]

{ #category : 'children - accessing' }
TbChildrenArray >> size [
	<return: #Number>

	^ array size
]
