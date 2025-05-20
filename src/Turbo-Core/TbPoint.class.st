Class {
	#name : 'TbPoint',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#category : 'Turbo-Core-Basic-Math',
	#package : 'Turbo-Core',
	#tag : 'Basic-Math'
}

{ #category : 'comparing' }
TbPoint >> < aPoint [
	"Answer whether the receiver is above and to the left of aPoint."
	<return: #Boolean>
	
	^ self subclassResponsibility
]

{ #category : 'converting' }
TbPoint >> asPoint2D [
	"Return a projected version of this point on 2D plane"
	<return: #BlPoint2D>
	
	^ self subclassResponsibility
]

{ #category : 'testing' }
TbPoint >> isPoint [
	^ true
]

{ #category : 'comparing' }
TbPoint >> max: aBlPoint [
	<return: #TbPoint>

	^ self subclassResponsibility
]

{ #category : 'comparing' }
TbPoint >> min: aBlPoint [
	<return: #TbPoint>

	^ self subclassResponsibility
]

{ #category : 'matrix - transforming points' }
TbPoint >> transformedOn: aBlMatrix [
	<return: #TbPoint>
	
	^ self subclassResponsibility
]
