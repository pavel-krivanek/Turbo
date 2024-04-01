"
I represent a concrete implementation of ""unspecified"" measurement mode.
For more information see class comment of BlMeasurementMode
"
Class {
	#name : #TbMeasurementUnspecifiedMode,
	#superclass : #TbMeasurementMode,
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #testing }
TbMeasurementUnspecifiedMode >> isUnspecified [
	^ true
]

{ #category : #geometry }
TbMeasurementUnspecifiedMode >> measurement: aResizing with: aNumber [
	<return: #BlMeasurementSpec>
	
	^ aResizing measurementUnspecifiedWith: aNumber
]

{ #category : #printing }
TbMeasurementUnspecifiedMode >> printOn: aStream [
	aStream nextPutAll: 'Unspecified'
]

{ #category : #printing }
TbMeasurementUnspecifiedMode >> printOn: aStream size: aNumber [

	self printOn: aStream
]

{ #category : #geometry }
TbMeasurementUnspecifiedMode >> size: aNumber with: aSpecSize [
	<return: #Number>
	
	^ aNumber
]
