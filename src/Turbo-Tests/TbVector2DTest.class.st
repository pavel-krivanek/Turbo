Class {
	#name : 'TbVector2DTest',
	#superclass : 'TestCase',
	#category : 'Turbo-Tests',
	#package : 'Turbo-Tests'
}

{ #category : 'tests' }
TbVector2DTest >> testAdd3D [
    | v2 v3 r |
    v2 := TbVector2D x: 1 y: 2.
    v3 := TbVector3D x: 3 y: 4 z: 5.
    r := v2 add3D: v3.
    self assert: r x equals: 4.
    self assert: r y equals: 6.
]

{ #category : 'tests' }
TbVector2DTest >> testAddition [
    | v1 v2 r |
    v1 := TbVector2D x: 1 y: 2.
    v2 := TbVector2D x: 3 y: 4.
    r := v1 + v2.
    self assert: r x equals: 4.
    self assert: r y equals: 6.
]

{ #category : 'tests' }
TbVector2DTest >> testAsPoint [
    | v p |
    v := TbVector2D x: 7 y: 8.
    p := v asPoint.
    self assert: p equals: (7@8).
]

{ #category : 'tests' }
TbVector2DTest >> testAsScale3D [
    | v s3 |
    v := TbVector2D x: 2 y: 3.
    s3 := v asScale3D.
    self assert: s3 x equals: 2.
    self assert: s3 y equals: 3.
    self assert: s3 z equals: 1.
]

{ #category : 'tests' }
TbVector2DTest >> testAsTranslate3D [
    | v t3 |
    v := TbVector2D x: 5 y: 6.
    t3 := v asTranslate3D.
    self assert: t3 x equals: 5.
    self assert: t3 y equals: 6.
    self assert: t3 z equals: 0.
]

{ #category : 'tests' }
TbVector2DTest >> testCloseTo [
    | v1 v2 |
    v1 := TbVector2D x: 1.0 y: 2.0.
    v2 := TbVector2D x: 1.000000001 y: 2.000000001.
    self assert: (v1 closeTo: v2).
]

{ #category : 'tests' }
TbVector2DTest >> testDivision [
    | v1 v2 r |
    v1 := TbVector2D x: 6 y: 8.
    v2 := TbVector2D x: 2 y: 4.
    r := v1 / v2.
    self assert: r x equals: 3.
    self assert: r y equals: 2.
]

{ #category : 'tests' }
TbVector2DTest >> testDotProduct [
    | v1 v2 |
    v1 := TbVector2D x: 6 y: 7.
    v2 := TbVector2D x: 8 y: 9.
    self assert: (v1 dotProduct: v2) equals: (v2 dotProduct2D: v1).
]

{ #category : 'tests' }
TbVector2DTest >> testDotProduct2D [
    | v1 v2 |
    v1 := TbVector2D x: 2 y: 3.
    v2 := TbVector2D x: 4 y: 5.
    self assert: (v1 dotProduct2D: v2) equals: 23.
]

{ #category : 'tests' }
TbVector2DTest >> testEquality [
    | v1 v2 v3 |
    v1 := TbVector2D x: 3 y: 4.
    v2 := TbVector2D x: 3 y: 4.
    v3 := TbVector2D x: 4 y: 3.
    self assert: (v1 = v2).
    self deny: (v1 = v3).

]

{ #category : 'tests' }
TbVector2DTest >> testHash [
    | v1 v2 v3 |
    v1 := TbVector2D x: 3 y: 4.
    v2 := TbVector2D x: 3 y: 4.
    v3 := TbVector2D x: 4 y: 5.
    self assert: v1 hash equals: v2 hash.
    self deny: v1 hash equals: v3 hash.
]

{ #category : 'tests' }
TbVector2DTest >> testLength [
    | v |
    v := TbVector2D x: 3 y: 4.
    self assert: v length equals: 5.
]

{ #category : 'tests' }
TbVector2DTest >> testNegated [
    | v r |
    v := TbVector2D x: 2 y: -3.
    r := v negated.
    self assert: r x equals: -2.
    self assert: r y equals: 3.
]

{ #category : 'tests' }
TbVector2DTest >> testNormalized [
    | v r |
    v := TbVector2D x: 3 y: 4.
    r := v normalized.
    self assert: r x equals: 3/5.
    self assert: r y equals: 4/5.
]

{ #category : 'tests' }
TbVector2DTest >> testPrintOn [
    | v stream |
    v := TbVector2D x: 1 y: -2.
    stream := WriteStream on: String new.
    v printOn: stream.
    self assert: stream contents equals: '(1, -2)'.
]

{ #category : 'tests' }
TbVector2DTest >> testRotateByZero [
    | v r |
    v := TbVector2D x: 3 y: 4.
    r := v rotateBy: 0 about: (0@0).
    self assert: r x equals: 3.
    self assert: r y rounded equals: 4.
]

{ #category : 'tests' }
TbVector2DTest >> testScalarMultiplicate2D [
    | v1 v2 r |
    v1 := TbVector2D x: 2 y: 3.
    v2 := TbVector2D x: 4 y: 5.
    r := v1 scalarMultiplicate2D: v2.
    self assert: r x equals: 8.
    self assert: r y equals: 15.
]

{ #category : 'tests' }
TbVector2DTest >> testScalarMultiplication [
    | v r |
    v := TbVector2D x: 2 y: 3.
    r := v * 4.
    self assert: r x equals: 8.
    self assert: r y equals: 12.
]

{ #category : 'tests' }
TbVector2DTest >> testSign [
    | v r |
    v := TbVector2D x: -5 y: 0.
    r := v sign.
    self assert: r x equals: -1.
    self assert: r y equals: 0.
]

{ #category : 'tests' }
TbVector2DTest >> testSubtract3D [
    | v2 v3 r |
    v2 := TbVector2D x: 1 y: 2.
    v3 := TbVector3D x: 5 y: 6 z: 7.
    r := v2 subtract3D: v3.
    self assert: r x equals: 4.
    self assert: r y equals: 4.
]

{ #category : 'tests' }
TbVector2DTest >> testSubtraction [
    | v1 v2 r |
    v1 := TbVector2D x: 5 y: 7.
    v2 := TbVector2D x: 2 y: 3.
    r := v1 - v2.
    self assert: r x equals: 3.
    self assert: r y equals: 4.
]
