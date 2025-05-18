Class {
	#name : 'TbMatrix2DTest',
	#superclass : 'TestCase',
	#category : 'Turbo-Tests',
	#package : 'Turbo-Tests'
}

{ #category : 'tests' }
TbMatrix2DTest >> testDecompositionIdentity [
"
m = identity

decomposition:
  translation = (0,0)
  scale       = (1,1)
  angle       = 0°
  matrix      = [1 0; 0 1]
"

    | dec |
    dec := TbMatrix2D new decomposition.
    self assert: dec translation equals: (TbVector x: 0 y: 0).
    self assert: dec scale       equals: (TbVector x: 1 y: 1).
    self assert: dec angle equals: 0.
    self assert: (dec matrix at: 1 at: 1) equals: 1.
]

{ #category : 'tests' }
TbMatrix2DTest >> testDecompositionRotationOnly [
"
m = rotation 45°

decompose:
  angle = 45°
  scale = (1,1)
  translation = (0,0)
"
    | m dec |
    m := TbMatrix2D rotation: (45 degreesToRadians).
    dec := m decomposition.
    self assert: dec scale equals: (TbVector x: 1 y: 1).
    self assert: dec angle equals: 45.
]

{ #category : 'tests' }
TbMatrix2DTest >> testDecompositionScaleOnly [
"
m = scale(2,3)

decompose:
  scale = (2,3)
  angle = 0°
  translation = (0,0)
"
    | m dec |
    m := TbMatrix2D new.
    m scaleBy: (TbVector x: 2 y: 3).
    dec := m decomposition.
    self assert: dec scale equals: (TbVector x: 2 y: 3).
    self assert: dec angle equals: 0.
]

{ #category : 'tests' }
TbMatrix2DTest >> testDeterminant [
"
| a  b |
| c  d |

det = a.d – b.c

Here: a=sx=3, d=sy=4, b=shy=1, c=shx=2
det = 3*4 – 1*2 = 12 – 2 = 10
"
    | m |
    m := TbMatrix2D new.
    m sx: 3; sy: 4; shy: 1; shx: 2.
    "det = sx*sy - shy*shx = 3*4 - 1*2 = 12 - 2 = 10"
    self assert: m determinant equals: 10.
]

{ #category : 'tests' }
TbMatrix2DTest >> testEqualityAndHash [
"
M1: [ 1.5  0.3  … ]
      …      …

M2: copy of M1

M1 == M2   ⇒  true  
hash(M1) = hash(M2)
"
    | m1 m2 |
    m1 := TbMatrix2D new.
    m2 := TbMatrix2D new.
    m1 sx: 1.5; shy: 0.2; shx: 0.3; sy: 2.5; x: 5; y: 7.
    m2 matrix: m1.
    self assert: m1 equals: m2.
    self assert: m1 hash equals: m2 hash.
]

{ #category : 'tests' }
TbMatrix2DTest >> testInitializeIsIdentity [
"
┌           ┐
│ 1   0   0 │
│ 0   1   0 │
│ 0   0   1 │
└           ┘
"

    | m |
    m := TbMatrix2D new.
    self assert: m isIdentity.
    self assert: m is2D.
]

{ #category : 'tests' }
TbMatrix2DTest >> testInverseAndInverted [
"
Translation-only: x=3, y=4

m inverted ⇒     [ 1  0  −3 ]
                 [ 0  1  −4 ]
                 [ 0  0   1 ]

m inverse (in-place) does same to original.
Original copy remains unchanged until inverse called.
"

    | m inv copy |
    m := TbMatrix2D new.
    m x: 3; y: 4.
    copy := m copy.
    inv := m inverted.
    "inverted returns new, original unchanged"
    self assert: (m x = 3 and: [ m y = 4 ]).
    self assert: (inv x = -3 and: [ inv y = -4 ]).
    "in-place inverse"
    copy inverse.
    self assert: (copy x = -3 and: [ copy y = -4 ]).
]

{ #category : 'tests' }
TbMatrix2DTest >> testInverseSingularSignalError [
    | m |
    m := TbMatrix2D new.
    m scaleBy: (TbVector x: 0 y: 5).
    self should: [ m inverse ] raise: TbSingularMatrixError.
    self should: [ m inverted ] raise: TbSingularMatrixError.
]

{ #category : 'tests' }
TbMatrix2DTest >> testMatrixSetterCopiesAllComponents [
    | m1 m2 |
    m1 := TbMatrix2D new.
    m1 sx: 4; shy: 1; shx: 2; sy: 3; x: 8; y: 9.
    m2 := TbMatrix2D new matrix: m1.
    self assert: m2 sx equals: 4.
    self assert: m2 shy equals: 1.
    self assert: m2 shx equals: 2.
    self assert: m2 sy equals: 3.
    self assert: m2 x  equals: 8.
    self assert: m2 y  equals: 9.
]

{ #category : 'tests' }
TbMatrix2DTest >> testMultiplyBy [
"
M1 = [2 0 0]
     [0 3 0]
     [0 0 1]

M2 = [4 0 0]
     [0 5 0]
     [0 0 1]

M1 * M2 = [8  0  0]
          [0 15  0]
          [0  0  1]
"
    | m1 m2 |
    m1 := TbMatrix2D new.
    m1 sx: 2; sy: 3.
    m2 := TbMatrix2D new.
    m2 sx: 4; sy: 5.
    m1 multiplyBy: m2.
    "new sx = 2*4 + 0*0 = 8, new sy = 0*0 + 3*5 = 15"
    self assert: m1 sx equals: 8.
    self assert: m1 sy equals: 15.
]

{ #category : 'tests' }
TbMatrix2DTest >> testPerspectiveIsNoOp [
    | m |
    m := TbMatrix2D new.
    m perspective: 10.
    self assert: m isIdentity.
]

{ #category : 'tests' }
TbMatrix2DTest >> testReflectBy [
"
Reflect diagonal vector (−1,1):

point (2,3)
   ↔ reflect over X → 
becomes (−2,3)
"

    | m p |
    m := TbMatrix2D new.
    m reflectBy: (TbVector x: -1 y: 1).
    p := m transformPoint2D: (2 @ 3).
    self assert: p equals: ((-2) @ 3).
]

{ #category : 'tests' }
TbMatrix2DTest >> testRotateByRadiansAndDegrees [
"
Rotate +90° about Z:

point (1,0)
   ↻ 90° 
becomes (0,1)
"

    | m p |
    m := TbMatrix2D new.
    "rotate +90° about z"
    m rotateBy: 90.
    p := m transformPoint2D: (1 @ 0).
    self assert: (p x rounded = 0 and: [ p y rounded = 1 ]).
]

{ #category : 'tests' }
TbMatrix2DTest >> testScaleBy [
"
Scale by (2,3):

point (1,2)
   ↓ × (2,3)
becomes (2,6)
"
    | m p |
    m := TbMatrix2D new.
    m scaleBy: (TbVector x: 2 y: 3).
    p := m transformPoint2D: (1 @ 2).
    self assert: p equals: (2 @ 6).
]

{ #category : 'tests' }
TbMatrix2DTest >> testTransformBounds [
"
Bounds: left=0, top=0, right=3, bottom=4
m = translate(2,1)

Each corner moves by (2,1):
  (0,0)→(2,1), (3,0)→(5,1), (0,4)→(2,5), (3,4)→(5,5)

New bounds = left:2, top:1, right:5, bottom:5
"

    | m b |
    m := TbMatrix2D new.
    m translateBy: (TbVector x: 2 y: 1).
    b := TbBounds left: 0 top: 0 right: 3 bottom: 4.
    m transformBounds: b.
    self assert: b left   equals: 2.
    self assert: b top    equals: 1.
    self assert: b right  equals: 5.
    self assert: b bottom equals: 5.
]

{ #category : 'tests' }
TbMatrix2DTest >> testTransformPoint2D [
"
m = translate(5,6)

src = (3,4)
   → +(5,6)
dst = (8,10)
"

    | m src dst |
    m := TbMatrix2D new.
    m translateBy: (TbVector x: 5 y: 6).
    src := 3 @ 4.
    dst := m transformPoint2D: src.
    self assert: dst equals: (8 @ 10).
]

{ #category : 'tests' }
TbMatrix2DTest >> testTransformPointDoubleDispatch [
    | m point |
    m := TbMatrix2D new.
    point := TbPoint2D x: 7 y: 8.
    "transformPoint: should forward to transformPoint2D:"
    self assert: (m transformPoint: point) equals: (7 @ 8).
]

{ #category : 'tests' }
TbMatrix2DTest >> testTranslateBy [
"
Translate by (3,4):

point (1,2)
   ↓ + (3,4)
becomes (4,6)
"
    | m p |
    m := TbMatrix2D new.
    m translateBy: (TbVector x: 3 y: 4).
    p := m transformPoint2D: (1 @ 2).
    self assert: p equals: (4 @ 6).
]
