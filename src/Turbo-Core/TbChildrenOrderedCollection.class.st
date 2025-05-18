"
I am a holder that uses an ${class:OrderedCollection}$ to store children of bloc elements.

Internally I maintain one single ${class:OrderedCollection}$ instance. When children are added or removed I add or remove them from the wrapped collection. 

!!Examples
Examples are provided by the class ${class:BlChildrenOrderedCollectionExamples}$
"
Class {
	#name : 'TbChildrenOrderedCollection',
	#superclass : 'TbChildrenCollection',
	#instVars : [
		'collection'
	],
	#category : 'Turbo-Core-Basic-Children',
	#package : 'Turbo-Core',
	#tag : 'Basic-Children'
}

{ #category : 'children - adding' }
TbChildrenOrderedCollection >> add: aChild at: anIndex [
	"Adds aChild at a given index moving existing children to the right"
		
	collection add: aChild beforeIndex: anIndex
]

{ #category : 'children - adding' }
TbChildrenOrderedCollection >> addAll: aSequenceableCollection [
	collection addAll: aSequenceableCollection
]

{ #category : 'children - accessing' }
TbChildrenOrderedCollection >> at: anIndex [
	"Return an element at a given index"
	<return: #BlElement>

	^ collection at: anIndex
]

{ #category : 'children - enumerating' }
TbChildrenOrderedCollection >> do: aBlock [
	collection do: aBlock
]

{ #category : 'initialization' }
TbChildrenOrderedCollection >> initialize [
	super initialize.
	
	collection := OrderedCollection new
]

{ #category : 'accessing' }
TbChildrenOrderedCollection >> name [
	^ 'Children ordered collection'
]

{ #category : 'removing' }
TbChildrenOrderedCollection >> removeAll: aCollectionOfBlElement [
	collection removeAll: aCollectionOfBlElement
]

{ #category : 'children - removing' }
TbChildrenOrderedCollection >> removeAt: anIndex [
	collection removeAt: anIndex
]

{ #category : 'children - accessing' }
TbChildrenOrderedCollection >> size [
	<return: #Number>

	^ collection size
]
