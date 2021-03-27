Class {
	#name : #TbLayoutExactResizer,
	#superclass : #TbLayoutResizer,
	#instVars : [
		'size'
	],
	#classInstVars : [
		'zero',
		'fifty',
		'hundred'
	],
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #cleanup }
TbLayoutExactResizer class >> cleanUp [
	super cleanUp.
	
	zero := nil.
	fifty := nil.
	hundred := nil
]

{ #category : #accessing }
TbLayoutExactResizer class >> fifty [
	^ fifty ifNil: [ fifty := self new size: 50 ]
]

{ #category : #accessing }
TbLayoutExactResizer class >> hundred [
	^ hundred ifNil: [ hundred := self new size: 100 ]
]

{ #category : #accessing }
TbLayoutExactResizer class >> size: aNumber [
	aNumber isZero
		ifTrue: [ ^ self zero ].
		
	aNumber = 50
		ifTrue: [ ^ self fifty ].
		
	aNumber = 100
		ifTrue: [ ^ self hundred ].

	^ self new
		size: aNumber;
		yourself 
]

{ #category : #accessing }
TbLayoutExactResizer class >> zero [
	^ zero ifNil: [ zero := self new size: 0 ]
]

{ #category : #comparing }
TbLayoutExactResizer >> = anObject [
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ self size = anObject size
]

{ #category : #comparing }
TbLayoutExactResizer >> hash [
	^ super hash bitXor: self size hash
]

{ #category : #controlling }
TbLayoutExactResizer >> ifExact: aBlock [
	^ aBlock cull: self
]

{ #category : #testing }
TbLayoutExactResizer >> isExact [
	^ true
]

{ #category : #'double dispatching' }
TbLayoutExactResizer >> measurementAtMostWith: aNumber [
	"Parent has imposed a maximum size on us. Child wants a specific size... so be it"
	<return: #BlMeasurementSpec>

	^ BlMeasurementSpec exact: self size
]

{ #category : #'double dispatching' }
TbLayoutExactResizer >> measurementExactlyWith: aNumber [
	"Parent has imposed an exact size on us"
	<return: #BlMeasurementSpec>
	
	^ BlMeasurementSpec exact: self size
]

{ #category : #'double dispatching' }
TbLayoutExactResizer >> measurementUnspecifiedWith: aNumber [
	"Child wants a specific size... let it have it"
	<return: #BlMeasurementSpec>

	^ BlMeasurementSpec exact: self size
]

{ #category : #printing }
TbLayoutExactResizer >> printOn: aStream [
	aStream
		nextPutAll: 'Exact ';
		nextPutAll: self size asString
]

{ #category : #accessing }
TbLayoutExactResizer >> size [
	^ size
]

{ #category : #accessing }
TbLayoutExactResizer >> size: aNumber [
	self
		assert: [ size isNil ]
		description: [ 'Size can not be changed once set (immutability)' ].
		
	size := aNumber
]
