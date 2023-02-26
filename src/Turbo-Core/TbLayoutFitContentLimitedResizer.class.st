Class {
	#name : #TbLayoutFitContentLimitedResizer,
	#superclass : #TbLayoutResizer,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #cleanup }
TbLayoutFitContentLimitedResizer class >> cleanUp [
	super cleanUp.
	
	uniqueInstance := nil
]

{ #category : #accessing }
TbLayoutFitContentLimitedResizer class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #controlling }
TbLayoutFitContentLimitedResizer >> ifFitContent: aBlock [
	^ aBlock cull: self
]

{ #category : #testing }
TbLayoutFitContentLimitedResizer >> isFitContent [
	^ true
]

{ #category : #'double dispatching' }
TbLayoutFitContentLimitedResizer >> measurementAtMostWith: aNumber [
	"Child wants to determine its own size. It can't be bigger than us."
	<return: #BlMeasurementSpec>

	^ TbMeasurementSpec new beAtMost: aNumber
]

{ #category : #'double dispatching' }
TbLayoutFitContentLimitedResizer >> measurementExactlyWith: aNumber [
	"Child wants to determine its own size. It can't be bigger than us."
	<return: #BlMeasurementSpec>

   ^ TbMeasurementSpec new beAtMost: aNumber
]

{ #category : #'double dispatching' }
TbLayoutFitContentLimitedResizer >> measurementUnspecifiedWith: aNumber [
	^ TbMeasurementSpec unspecified
]

{ #category : #printing }
TbLayoutFitContentLimitedResizer >> printOn: aStream [
	aStream nextPutAll: 'Fit content limited'
]
