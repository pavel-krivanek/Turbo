Class {
	#name : #TbGridPackedMap,
	#superclass : #Object,
	#instVars : [
		'values',
		'indices',
		'keys'
	],
	#category : #'Turbo-Layout-Grid-Utilities'
}

{ #category : #'instance creation' }
TbGridPackedMap class >> fromAssociations: anArrayOfAssociations [
	^ self new values: (anArrayOfAssociations collect: #value) keys: (anArrayOfAssociations collect: #key)
]

{ #category : #accessing }
TbGridPackedMap >> at: index [
	^ values at: (indices at: index)
]

{ #category : #private }
TbGridPackedMap >> compact: anArray indices: theIndices [
	|size result|
	size := anArray size.
	result := Array new: (theIndices ifEmpty: [ 0 ] ifNotEmpty: #max).
	
	1 to: size do: [ :index | result at: (theIndices at: index) put: (anArray at: index) ].
	^ result
]

{ #category : #private }
TbGridPackedMap >> createIndex: theKeys [
	| size result keyToIndex |
	size := theKeys size.
	result := Array new: size withAll: 0.
	keyToIndex := Dictionary new.
	
	1 to: size do: [ :i |
		| key index |
		key := theKeys at: i.
		index := keyToIndex at: key ifAbsentPut: [ keyToIndex size + 1 ].
		result at: i put: index ].
	^ result
]

{ #category : #accessing }
TbGridPackedMap >> keys [
	^ keys
]

{ #category : #accessing }
TbGridPackedMap >> keysAndValuesDo: aBlock [

	1 to: self keys size do: [ :i | aBlock value: (self keys at: i) value: (self values at: i) ]
]

{ #category : #accessing }
TbGridPackedMap >> keysDo: aBlock [
	self keys do: aBlock
]

{ #category : #accessing }
TbGridPackedMap >> values [
	^ values
]

{ #category : #accessing }
TbGridPackedMap >> values: theValues keys: theKeys [
	indices := self createIndex: theKeys.
	keys := self compact: theKeys indices: indices.
	values := self compact: theValues indices: indices
]

{ #category : #accessing }
TbGridPackedMap >> valuesDo: aBlock [
	self values do: aBlock
]
