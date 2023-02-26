"
I represent a concrete implementation of ""exact"" measurement mode.
For more information see class comment of BlMeasurementMode
"
Class {
	#name : #TbMeasurementExactMode,
	#superclass : #TbMeasurementMode,
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #testing }
TbMeasurementExactMode >> isExact [
	^ true
]

{ #category : #geometry }
TbMeasurementExactMode >> measurement: aResizing with: aNumber [
	<return: #BlMeasurementSpec>
	
	^ aResizing measurementExactlyWith: aNumber
]

{ #category : #printing }
TbMeasurementExactMode >> printOn: aStream [
	aStream nextPutAll: 'Exact'
]

{ #category : #printing }
TbMeasurementExactMode >> printOn: aStream size: aNumber [

	self printOn: aStream.	
	aStream nextPutAll: ' '.
	aStream nextPutAll: aNumber asString
]

{ #category : #geometry }
TbMeasurementExactMode >> size: aNumber with: aSpecSize [
	<return: #Number>
	
	^ aSpecSize
]
