Class {
	#name : 'TbPoint3DTest',
	#superclass : 'TestCase',
	#category : 'Turbo-Tests-Math',
	#package : 'Turbo-Tests',
	#tag : 'Math'
}

{ #category : 'tests' }
TbPoint3DTest >> testAccessors [
    | point |
    point := TbPoint3D new.
    point x: 1.1 y: -2.2 z: 3.3.
    self assert: point x equals: 1.1.
    self assert: point y equals: -2.2.
    self assert: point z equals: 3.3.
]

{ #category : 'tests' }
TbPoint3DTest >> testClassCreation [
    | point |
    point := TbPoint3D x: 5 y: 10 z: 20.
    self assert: point class equals: TbPoint3D.
    self assert: point x equals: 5.
    self assert: point y equals: 10.
    self assert: point z equals: 20.
]

{ #category : 'tests' }
TbPoint3DTest >> testCompositionTo4D [
    | p result |
    p := TbPoint3D x: 2 y: 4 z: 6.
    result := p @ 8.
    self assert: result class equals: TbPoint4D.
    self assert: result x equals: 2.
    self assert: result y equals: 4.
    self assert: result z equals: 6.
    self assert: result w equals: 8.
]

{ #category : 'tests' }
TbPoint3DTest >> testInitializeDefault [
    | point |
    point := TbPoint3D new.
    self assert: point x equals: 0.0.
    self assert: point y equals: 0.0.
    self assert: point z equals: 0.0.
]

{ #category : 'tests' }
TbPoint3DTest >> testIsPoint [
    | p |
    p := TbPoint3D new.
    self assert: p isPoint.
]

{ #category : 'tests' }
TbPoint3DTest >> testIsPoint2D [
    | p |
    p := TbPoint3D new.
    self deny: p isPoint2D.
]

{ #category : 'tests' }
TbPoint3DTest >> testIsPoint3D [
    | p |
    p := TbPoint3D new.
    self assert: p isPoint3D.
]

{ #category : 'tests' }
TbPoint3DTest >> testIsZeroFalse [
    | p |
    p := TbPoint3D x: 1 y: 0 z: 0.
    self deny: p isZero.
]

{ #category : 'tests' }
TbPoint3DTest >> testIsZeroTrue [
    | p |
    p := TbPoint3D new.
    self assert: p isZero.
]

{ #category : 'tests' }
TbPoint3DTest >> testPrintOn [
    | p stream |
    p := TbPoint3D x: -1 y: 2 z: -3.
    stream := WriteStream on: String new.
    p printOn: stream.
    self assert: stream contents equals: '(-1@2@ -3)'.
]

{ #category : 'tests' }
TbPoint3DTest >> testStoreOn [
    | p stream |
    p := TbPoint3D x: 1 y: 2 z: 3.
    stream := WriteStream on: String new.
    p storeOn: stream.
    self assert: stream contents equals: '((1@2@3))'.
]

{ #category : 'tests' }
TbPoint3DTest >> testTransformedOn [
    | p matrix result |
    p := TbPoint3D x: 3 y: 4 z: 5.
    matrix := TbMatrix3D new translateBy: (TbVector3D x: 5 y: 6 z: 7).
    result := p transformedOn: matrix.
    self assert: result x equals: 8.
    self assert: result y equals: 10.
	 self assert: result z equals: 12.
]
