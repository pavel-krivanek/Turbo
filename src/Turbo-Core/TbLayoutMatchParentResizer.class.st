Class {
	#name : #TbLayoutMatchParentResizer,
	#superclass : #TbLayoutResizer,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #cleanup }
TbLayoutMatchParentResizer class >> cleanUp [
	super cleanUp.
	
	uniqueInstance := nil
]

{ #category : #accessing }
TbLayoutMatchParentResizer class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #controlling }
TbLayoutMatchParentResizer >> ifMatchParent: aBlock [
	^ aBlock cull: self
]

{ #category : #testing }
TbLayoutMatchParentResizer >> isMatchParent [
	^ true
]

{ #category : #'double dispatching' }
TbLayoutMatchParentResizer >> measurementAtMostWith: aNumber [
	"Child wants to be our size, but our size is not fixed. Constrain child to not be bigger than us."
	<return: #BlMeasurementSpec>

	^ BlMeasurementSpec new beAtMost: aNumber
]

{ #category : #'double dispatching' }
TbLayoutMatchParentResizer >> measurementExactlyWith: aNumber [
	"Parent has imposed an exact size on us, child wants to be our size. So be it."
	<return: #BlMeasurementSpec>

	^ BlMeasurementSpec new beExact: aNumber
]

{ #category : #'double dispatching' }
TbLayoutMatchParentResizer >> measurementUnspecifiedWith: aNumber [
	"Child wants to be our size... find out how big it should be"
	<return: #BlMeasurementSpec>

	^ BlMeasurementSpec unspecified: aNumber
]

{ #category : #printing }
TbLayoutMatchParentResizer >> printOn: aStream [
	aStream nextPutAll: 'Match parent'
]
