Class {
	#name : 'TbPoint4DTest',
	#superclass : 'TestCase',
	#category : 'Turbo-Tests-Math',
	#package : 'Turbo-Tests',
	#tag : 'Math'
}

{ #category : 'tests' }
TbPoint4DTest >> testAccessors [
    | point |
    point := TbPoint4D new.
    point x: 5.5 y: -6.6 z: 7.7 w: -8.8.
    self assert: point x equals: 5.5.
    self assert: point y equals: -6.6.
    self assert: point z equals: 7.7.
    self assert: point w equals: -8.8.
]

{ #category : 'tests' }
TbPoint4DTest >> testAsPoint2D [
    | point result |
    point := TbPoint4D x: 4 y: 8 z: 12 w: 2.
    result := point asPoint2D.
    self assert: result class equals: TbPoint2D.
    self assert: result x equals: 2.
    self assert: result y equals: 4.
]

{ #category : 'tests' }
TbPoint4DTest >> testClassCreation [
    | point |
    point := TbPoint4D x: 1 y: 2 z: 3 w: 4.
    self assert: point class equals: TbPoint4D.
    self assert: point x equals: 1.
    self assert: point y equals: 2.
    self assert: point z equals: 3.
    self assert: point w equals: 4.
]

{ #category : 'tests' }
TbPoint4DTest >> testInitializeDefault [
    | point |
    point := TbPoint4D new.
    self assert: point x equals: 0.0.
    self assert: point y equals: 0.0.
    self assert: point z equals: 0.0.
    self assert: point w equals: 0.0.
]
