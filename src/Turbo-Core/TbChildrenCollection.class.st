"
I am an abstract collection of bloc elements that can be mutated. I am used by a ${class:BlElement}$ to store its children.

I provide a data structure independent API for adding and removing children. I assume an index-based way of working with children. My subclasses wrap concrete data structures for storing the actual children. Bloc elements work with children only in terms of the API that I provide. Hence, I only provide a minimum API needed to work with children, instead of the full collection API.

I allow elements to optimize working with children for different scenarious. For example, an array for storing children optimises for accessing fast accesses at any position. A linked list optimize for fast adding and removing. A rope uses a balanced binary tree to support fast adding, removing and accessing, with the disadvantage of taking more memory.

!!API

The following subclasses can be used to store children: 
- ${class:BlChildrenArray}$: stores children using an ${class:Array}$ 
- ${class:BlChildrenLinkedList}$: stores children using a ${class:LinkedList}$  
- ${class:BlChildrenOrderedCollection}$: stores children using a ${class:OrderedCollection}$
- ${class:BlChildrenRope}$: stores children using a ${class:BlCollectionRope}$

Subclasses need to provide the implementation for methods adding and removing children.
"
Class {
	#name : #TbChildrenCollection,
	#superclass : #TbChildren,
	#category : #'Turbo-Core-Basic-Children'
}

{ #category : #'children - adding' }
TbChildrenCollection >> add: anElement [
	"Adds aChild as a last one in a collection"

	self add: anElement at: self size + 1
]

{ #category : #'children - adding' }
TbChildrenCollection >> add: anElement at: anIndex [
	"Adds anElement at a given index moving existing children to the right"

	self subclassResponsibility
]

{ #category : #'children - adding' }
TbChildrenCollection >> addAll: aCollectionOfBlElement [
	"Add all elements from a given collection appending them to the end"

	self subclassResponsibility
]

{ #category : #'children - adding' }
TbChildrenCollection >> addFirst: anElement [
	"Add a given element as a first item moving all existing children to the right"

	self add: anElement at: 1
]

{ #category : #'children - removing' }
TbChildrenCollection >> remove: anElement [
	| anIndex |

	anIndex := self indexOf: anElement.
	anIndex isZero
		ifTrue: [ self errorNotFound: anElement ].
		
	self removeAt: anIndex
]

{ #category : #'children - removing' }
TbChildrenCollection >> removeAll: aCollectionOfBlElement [
	self subclassResponsibility
]

{ #category : #'children - removing' }
TbChildrenCollection >> removeAt: anIndex [
	self subclassResponsibility
]
