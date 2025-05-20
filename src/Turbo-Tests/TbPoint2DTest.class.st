Class {
	#name : 'TbPoint2DTest',
	#superclass : 'TestCase',
	#category : 'Turbo-Tests',
	#package : 'Turbo-Tests'
}

{ #category : 'tests' }
TbPoint2DTest >> estMax [
    | p1 p2 result |
    p1 := TbPoint2D x: 1 y: 5.
    p2 := TbPoint2D x: 3 y: 2.
    result := p1 max: p2.
    self assert: result x equals: 3.
    self assert: result y equals: 5.
]

{ #category : 'tests' }
TbPoint2DTest >> testAccessors [
    | point |
    point := TbPoint2D new.
    point x: 5.5.
    point y: -2.2.
    self assert: point x equals: 5.5.
    self assert: point y equals: -2.2.
]

{ #category : 'tests' }
TbPoint2DTest >> testAsPoint2D [
    | p |
    p := TbPoint2D x: 7 y: 8.
    self assert: p asPoint2D equals: p.
]

{ #category : 'tests' }
TbPoint2DTest >> testClassCreation [
    | point |
    point := TbPoint2D x: 3 y: 4.
    self assert: point class equals: TbPoint2D.
    self assert: point x equals: 3.
    self assert: point y equals: 4.
]

{ #category : 'tests' }
TbPoint2DTest >> testInitializeDefault [
    | point |
    point := TbPoint2D new.
    self assert: point x equals: 0.0.
    self assert: point y equals: 0.0.
]

{ #category : 'tests' }
TbPoint2DTest >> testLessThanFalse [
    | p1 p2 |
    p1 := TbPoint2D x: 5 y: 6.
    p2 := TbPoint2D x: 3 y: 4.
    self deny: (p1 < p2).
]

{ #category : 'tests' }
TbPoint2DTest >> testLessThanTrue [
    | p1 p2 |
    p1 := TbPoint2D x: 1 y: 2.
    p2 := TbPoint2D x: 3 y: 4.
    self assert: (p1 < p2).
]

{ #category : 'tests' }
TbPoint2DTest >> testMin [
    | p1 p2 result |
    p1 := TbPoint2D x: 1 y: 5.
    p2 := TbPoint2D x: 3 y: 2.
    result := p1 min: p2.
    self assert: result x equals: 1.
    self assert: result y equals: 2.
]

{ #category : 'tests' }
TbPoint2DTest >> testTransformedOn [
    | p matrix result |
    p := TbPoint2D x: 3 y: 4.
    matrix := TbMatrix2D new translateBy: 5@6.
    result := p transformedOn: matrix.
    self assert: result x equals: 8.
    self assert: result y equals: 10.
]
