"
I am a holder that uses an ${class:BlCollectionRope}$ to store children of bloc elements.

Internally I maintain one single ${class:BlCollectionRope}$ intance. When children are added or removed I add or remove them from the wrapped rope. 

!!Examples
Examples are provided by the class ${class:BlChildrenRopeExamples}$
"
Class {
	#name : 'TbChildrenRope',
	#superclass : 'TbChildrenCollection',
	#instVars : [
		'rope'
	],
	#category : 'Turbo-Core-Basic-Children',
	#package : 'Turbo-Core',
	#tag : 'Basic-Children'
}

{ #category : 'children - adding' }
TbChildrenRope >> add: aChild at: anIndex [
	"Adds aChild at a given index moving existing children to the right"

	rope := rope insertItems: { aChild } at: anIndex - 1
]

{ #category : 'children - adding' }
TbChildrenRope >> addAll: aSequenceableCollection [
	rope := rope insertItems: aSequenceableCollection at: rope size
]

{ #category : 'children - accessing' }
TbChildrenRope >> at: anIndex [
	"Return an element at a given index"
	<return: #BlElement>

	^ rope at: anIndex
]

{ #category : 'children - enumerating' }
TbChildrenRope >> do: aBlock [
	rope do: aBlock
]

{ #category : 'initialization' }
TbChildrenRope >> initialize [
	super initialize.
	
	rope := TbCollectionRope collection: #() 
]

{ #category : 'accessing' }
TbChildrenRope >> name [
	^ 'Children rope'
]

{ #category : 'children - removing' }
TbChildrenRope >> removeAll: aCollectionOfBlElement [
	aCollectionOfBlElement do: [ :aChild | self remove: aChild ]
]

{ #category : 'children - removing' }
TbChildrenRope >> removeAt: anIndex [
	rope := rope delete: anIndex to: anIndex
]

{ #category : 'children - accessing' }
TbChildrenRope >> size [
	<return: #Number>

	^ rope size
]
