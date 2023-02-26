"
A mutable Integer - used to avoid heap allocation during the layout operation
"
Class {
	#name : #TbGridMutableInteger,
	#superclass : #Object,
	#instVars : [
		'value'
	],
	#pools : [
		'TbGridLayoutConstants'
	],
	#category : #'Turbo-Layout-Grid-Utilities'
}

{ #category : #'instance creation' }
TbGridMutableInteger class >> value: aNumber [
	^ self new value: aNumber
]

{ #category : #initialization }
TbGridMutableInteger >> initialize [
	super initialize.
	
	self reset
]

{ #category : #printing }
TbGridMutableInteger >> printOn: aStream [
	aStream nextPutAll: self value asString
]

{ #category : #accessing }
TbGridMutableInteger >> reset [
	value := UNDEFINED
]

{ #category : #accessing }
TbGridMutableInteger >> value [
	^ 	value
]

{ #category : #accessing }
TbGridMutableInteger >> value: aNumber [
	value := aNumber
]
