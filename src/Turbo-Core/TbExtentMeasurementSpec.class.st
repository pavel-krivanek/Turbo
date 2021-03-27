"
I represent a measurement specification of element's width and height.

I am used by Layouts
"
Class {
	#name : #TbExtentMeasurementSpec,
	#superclass : #Object,
	#instVars : [
		'widthSpec',
		'heightSpec'
	],
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #'instance creation' }
TbExtentMeasurementSpec class >> exact: anExtent [
	^ self new
		widthSpec: (BlMeasurementSpec exact: anExtent x);
		heightSpec: (BlMeasurementSpec exact: anExtent y)
]

{ #category : #'instance creation' }
TbExtentMeasurementSpec class >> unspecified [
	^ self new
		widthSpec: BlMeasurementSpec unspecified;
		heightSpec: BlMeasurementSpec unspecified
]

{ #category : #comparing }
TbExtentMeasurementSpec >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].
	
	^ anotherObject widthSpec = widthSpec
		and: [ anotherObject heightSpec = heightSpec ]
]

{ #category : #comparing }
TbExtentMeasurementSpec >> hash [
	^ heightSpec hash bitXor: widthSpec hash
]

{ #category : #accessing }
TbExtentMeasurementSpec >> heightSpec [
	^ heightSpec
]

{ #category : #accessing }
TbExtentMeasurementSpec >> heightSpec: anObject [
	heightSpec := anObject
]

{ #category : #testing }
TbExtentMeasurementSpec >> isExact [
	^ self widthSpec isExact and: [ self heightSpec isExact ]
]

{ #category : #printing }
TbExtentMeasurementSpec >> printOn: aStream [
	aStream nextPutAll: 'width: ('.
	aStream nextPutAll: (self widthSpec asString).
	aStream nextPutAll: ') height: ('.
	aStream nextPutAll: (self heightSpec asString).
	aStream nextPutAll: ')'.
]

{ #category : #geometry }
TbExtentMeasurementSpec >> sizeFor: anExtent [
	|width height|
	width := self widthSpec sizeFor: anExtent x.
	height := self heightSpec sizeFor: anExtent y.
	^ width@height
]

{ #category : #accessing }
TbExtentMeasurementSpec >> widthSpec [
	<return: #BlMeasurementSpec>
	^ widthSpec
]

{ #category : #accessing }
TbExtentMeasurementSpec >> widthSpec: anObject [
	widthSpec := anObject
]
