Class {
	#name : 'TbLayoutFitContentResizer',
	#superclass : 'TbLayoutResizer',
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Turbo-Core-Layouts-Support',
	#package : 'Turbo-Core',
	#tag : 'Layouts-Support'
}

{ #category : 'cleanup' }
TbLayoutFitContentResizer class >> cleanUp [
	super cleanUp.
	
	uniqueInstance := nil
]

{ #category : 'accessing' }
TbLayoutFitContentResizer class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : 'controlling' }
TbLayoutFitContentResizer >> ifFitContent: aBlock [
	^ aBlock cull: self
]

{ #category : 'testing' }
TbLayoutFitContentResizer >> isFitContent [
	^ true
]

{ #category : 'double dispatching' }
TbLayoutFitContentResizer >> measurementAtMostWith: aNumber [
	"Child wants to determine its own size. It may be bigger than us."
	<return: #BlMeasurementSpec>

	^ TbMeasurementSpec unspecified
]

{ #category : 'double dispatching' }
TbLayoutFitContentResizer >> measurementExactlyWith: aNumber [
	"Child wants to determine its own size. It may be bigger than us."
	<return: #BlMeasurementSpec>

	^ TbMeasurementSpec unspecified
]

{ #category : 'double dispatching' }
TbLayoutFitContentResizer >> measurementUnspecifiedWith: aNumber [
	"Child wants to determine its own size.... find out how big it should be"
	<return: #BlMeasurementSpec>

	^ TbMeasurementSpec unspecified: aNumber
]

{ #category : 'printing' }
TbLayoutFitContentResizer >> printOn: aStream [
	aStream nextPutAll: 'Fit content'
]
