"
I am a holder that uses a ${class:LinkedList}$ to store children of bloc elements.

Internally I maintain one single ${class:LinkedList}$ instance. When children are added or removed I add or remove them from the wrapped list. 

!!Examples
Examples are provided by the class ${class:BlChildrenLinkedListExamples}$
"
Class {
	#name : 'TbChildrenLinkedList',
	#superclass : 'TbChildrenCollection',
	#instVars : [
		'list'
	],
	#category : 'Turbo-Core-Basic-Children',
	#package : 'Turbo-Core',
	#tag : 'Basic-Children'
}

{ #category : 'children - adding' }
TbChildrenLinkedList >> add: aChild at: anIndex [
	"Adds aChild at a given index moving existing children to the right"
	| aLinkAt |
	
	anIndex = 1
		ifTrue: [
			list addFirst: aChild.
			^ self ].
	
	aLinkAt := list linkAt: anIndex - 1.
	list add: aChild afterLink: aLinkAt
]

{ #category : 'children - adding' }
TbChildrenLinkedList >> addAll: aSequenceableCollection [
	list addAll: aSequenceableCollection
]

{ #category : 'children - accessing' }
TbChildrenLinkedList >> at: anIndex [
	"Return an element at a given index"
	<return: #BlElement>

	^ list at: anIndex
]

{ #category : 'children - enumerating' }
TbChildrenLinkedList >> do: aBlock [
	list do: aBlock
]

{ #category : 'initialization' }
TbChildrenLinkedList >> initialize [
	super initialize.
	
	list := LinkedList new
]

{ #category : 'accessing' }
TbChildrenLinkedList >> name [
	^ 'Children linked list'
]

{ #category : 'children - removing' }
TbChildrenLinkedList >> removeAll: aCollectionOfBlElement [
	list removeAll: aCollectionOfBlElement
]

{ #category : 'children - removing' }
TbChildrenLinkedList >> removeAt: anIndex [
	| aLinkAt |

	aLinkAt := list linkAt: anIndex.
	list removeLink: aLinkAt
]

{ #category : 'children - accessing' }
TbChildrenLinkedList >> size [
	<return: #Number>

	^ list size
]
