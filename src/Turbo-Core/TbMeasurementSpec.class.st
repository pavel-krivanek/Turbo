Class {
	#name : #TbMeasurementSpec,
	#superclass : #Object,
	#instVars : [
		'size',
		'mode'
	],
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #'instance creation' }
TbMeasurementSpec class >> atMost: aNumber [
	^ self new beAtMost: aNumber
]

{ #category : #'instance creation' }
TbMeasurementSpec class >> exact: aNumber [
	^ self new beExact: aNumber
]

{ #category : #'instance creation' }
TbMeasurementSpec class >> size: aSize mode: aMode [
	^ self new
		size: aSize;
		mode: aMode;
		yourself
]

{ #category : #'instance creation' }
TbMeasurementSpec class >> unspecified [
	^ self unspecified: 0
]

{ #category : #'instance creation' }
TbMeasurementSpec class >> unspecified: aNumber [
	^ self new beUnspecified: aNumber
]

{ #category : #comparing }
TbMeasurementSpec >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].
	
	^ anotherObject size = size
		and: [ anotherObject mode = mode ]
]

{ #category : #composition }
TbMeasurementSpec >> @ heightMeasurementSpec [
	^ BlExtentMeasurementSpec new
		widthSpec: self;
		heightSpec: heightMeasurementSpec
]

{ #category : #converting }
TbMeasurementSpec >> beAtMost: aNumber [
	self
		size: aNumber;
		mode: BlMeasurementMode atMost
]

{ #category : #converting }
TbMeasurementSpec >> beExact: aNumber [
	self
		size: aNumber;
		mode: BlMeasurementMode exact
]

{ #category : #converting }
TbMeasurementSpec >> beUnspecified [
	self beUnspecified: 0
]

{ #category : #converting }
TbMeasurementSpec >> beUnspecified: aNumber [
	self
		size: aNumber;
		mode: BlMeasurementMode unspecified
]

{ #category : #comparing }
TbMeasurementSpec >> hash [
	^ size hash bitXor: mode hash
]

{ #category : #testing }
TbMeasurementSpec >> isAtMost [
	^ self mode isAtMost
]

{ #category : #testing }
TbMeasurementSpec >> isExact [
	^ self mode isExact
]

{ #category : #testing }
TbMeasurementSpec >> isUnspecified [
	^ self mode isUnspecified
]

{ #category : #accessing }
TbMeasurementSpec >> mode [
	^ mode
]

{ #category : #accessing }
TbMeasurementSpec >> mode: aMeasurementSpec [
	mode := aMeasurementSpec
]

{ #category : #printing }
TbMeasurementSpec >> printOn: aStream [
	self mode printOn: aStream size: self size
]

{ #category : #accessing }
TbMeasurementSpec >> size [
	^ size
]

{ #category : #accessing }
TbMeasurementSpec >> size: aNumber [
	size := aNumber
]

{ #category : #geometry }
TbMeasurementSpec >> sizeFor: aNumber [
	^ self mode size: aNumber with: size
]
