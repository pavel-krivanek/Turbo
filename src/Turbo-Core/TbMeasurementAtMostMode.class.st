"
I represent a concrete implementation of ""at most"" measurement mode.
For more information see class comment of BlMeasurementMode
"
Class {
	#name : #TbMeasurementAtMostMode,
	#superclass : #TbMeasurementMode,
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #testing }
TbMeasurementAtMostMode >> isAtMost [
	^ true
]

{ #category : #geometry }
TbMeasurementAtMostMode >> measurement: aResizing with: aNumber [
	<return: #BlMeasurementSpec>
	
	^ aResizing measurementAtMostWith: aNumber
]

{ #category : #printing }
TbMeasurementAtMostMode >> printOn: aStream [
	aStream nextPutAll: 'At most'
]

{ #category : #printing }
TbMeasurementAtMostMode >> printOn: aStream size: aNumber [

	self printOn: aStream.	
	aStream nextPutAll: ' '.
	aStream nextPutAll: aNumber asString
]

{ #category : #geometry }
TbMeasurementAtMostMode >> size: aNumber with: aSpecSize [
	<return: #Number>
	
	^ aNumber min: aSpecSize
]
