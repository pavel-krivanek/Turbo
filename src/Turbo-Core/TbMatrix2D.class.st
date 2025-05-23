"
I represent a matrix used for 2D affine transformations.
https://en.wikipedia.org/wiki/Matrix_(mathematics)

My components are named according to mathematical convention:

 |  a11  a12  |                 |   sx     shy  |
 |  a21  a22  |       =>        |  shx      sy  |
 |  a31  a32  |                 |    x       y  |
"
Class {
	#name : 'TbMatrix2D',
	#superclass : 'TbMatrix',
	#instVars : [
		'x',
		'y',
		'shx',
		'shy',
		'sx',
		'sy'
	],
	#category : 'Turbo-Core-Basic-Math',
	#package : 'Turbo-Core',
	#tag : 'Basic-Math'
}

{ #category : 'instance creation' }
TbMatrix2D class >> reflection: aDiagonalVector [
	"Return a matrix which corresponds to a reflection transformation with a given diagonal"
	<return: #BlMatrix2D>

	^ self new reflection: aDiagonalVector
]

{ #category : 'instance creation' }
TbMatrix2D class >> rotation: anAngle [
	"Return a matrix which corresponds to a rotation transformation by given angle"
	<return: #BlMatrix2D>

	^ self new rotation: anAngle
]

{ #category : 'comparing' }
TbMatrix2D >> = anObject [
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
		
		
	^ self sx = anObject sx
		and: [ self shy = anObject shy
			and: [ self shx = anObject shx
				and: [ self sy = anObject sy
					and: [ self x = anObject x
						and: [ self y = anObject y ] ] ] ] ]
]

{ #category : 'converting' }
TbMatrix2D >> asMatrixCollection [
	^ Array2D rows: 3 columns: 3 contents: {
		sx . shx . x.
		shy . sy . y.
		0 . 0. 1
	}
]

{ #category : 'matrix - mathematical functions' }
TbMatrix2D >> decomposition [
	"Decompose this 2D Matrix into components and return a resulting decomposition.
	Based on https://drafts.csswg.org/css-transforms/#decomposing-a-2d-matrix"
	<return: #BlMatrixDecomposition2D>
	
	| row0x row0y row1x row1y scaleX scaleY translate determinant angle matrix |
	
	row0x := self sx.
	row0y := self shy.
	row1x := self shx.
	row1y := self sy.
	
	translate := TbVector x: self x y: self y.
	scaleX := ((row0x * row0x) + (row0y * row0y)) sqrt.
	scaleY := ((row1x * row1x) + (row1y * row1y)) sqrt.
	
	determinant := (row0x * row1y) - (row0y * row1x).
	"If determinant is negative, one axis was flipped."
	determinant < 0
		ifTrue: [ 
			row0x < row1y
				ifTrue: [ scaleX := scaleX negated ]
				ifFalse: [ scaleY := scaleY negated ] ].
	
	"Renormalize matrix to remove scale."
	scaleX isZero
		ifFalse: [
			row0x := row0x * (1.0 / scaleX).
			row0y := row0y * (1.0 / scaleX) ].
	scaleY isZero
		ifFalse: [
			row1x := row1x * (1.0 / scaleY).
			row1y := row1y * (1.0 / scaleY) ].
	
	"Compute rotation and renormalize matrix."
	angle := row0y arcTan: row0x.
	angle isZero
		ifFalse: [ 
			| sn cs m11 m12 m21 m22 |
			sn := row0y negated.
			cs := row0x.
			m11 := row0x.
			m12 := row0y.
			m21 := row1x.
			m22 := row1y.
			row0x := (cs * m11) + (sn * m21).
			row0y := (cs * m12) + (sn * m22).
			row1x := (sn negated * m11) + (cs * m21).
			row1y := (sn negated * m12) + (cs * m22) ].
	
	matrix := Array2D
		rows: 2
		columns: 2
		contents: { row0x . row0y . row1x . row1y }.
		
	"Convert into degrees because our rotation functions expect it."
	angle := angle radiansToDegrees.
	
	^ TbMatrixDecomposition2D new
		translation: translate;
		scale: (TbVector x: scaleX y: scaleY);
		angle: angle;
		matrix: matrix
]

{ #category : 'matrix - mathematical functions' }
TbMatrix2D >> determinant [
	"Compute and return my determinant"
	<return: #Number>
	
	^ (sx * sy) - (shy * shx)
]

{ #category : 'comparing' }
TbMatrix2D >> hash [
	^ ((((self sx hash bitXor: self shy hash)
		bitXor: self shx hash)
			bitXor: self sy hash)
				bitXor: self x hash)
					bitXor: self y hash
]

{ #category : 'initialization' }
TbMatrix2D >> initialize [
	super initialize.
	
	sx := 1.0.
	shy := 0.0.
	shx := 0.0.
	sy := 1.0.
	x := 0.0.
	y := 0.0
]

{ #category : 'matrix - mathematical functions' }
TbMatrix2D >> inverse [
	"In-place inverse me.
	Throw BlSingularMatrixError if matrix is singular (non-invertible or degenerate)"
	| a b c d e f determinant inverseDeterminant |
	
	a := sy.
	b := shx negated.
	c := (shx * y) - (sy * x).
	d := shy negated.
	e := sx.
	f := (x * shy) - (sx * y).
	
	determinant := self determinant.
	determinant isZero
		ifTrue: [ TbSingularMatrixError signal: 'Matrix is singular and can not be inverted!' ].
		
	inverseDeterminant := 1.0 / determinant.
	
	sx := inverseDeterminant * a.
	shy := inverseDeterminant * d.
	shx := inverseDeterminant * b.
	sy := inverseDeterminant * e.
	x := inverseDeterminant * c.
	y := inverseDeterminant * f
]

{ #category : 'matrix - mathematical functions' }
TbMatrix2D >> inverted [
	"Return a new instance of matrix which is an inverse of me.
	Throw BlSingularMatrixError if matrix is singular (non-invertible or degenerate)"
	<return: #BlMatrix2D>
	
	^ self copy inverse
]

{ #category : 'testing' }
TbMatrix2D >> is2D [
	"Return true if matrix is 2D, false otherwise"
	<return: #Boolean>
	
	^ true
]

{ #category : 'matrix - testing' }
TbMatrix2D >> isIdentity [
	"Return true if I represent an identity transformation, false otherwise"
	<return: #Boolean>

	^ sx = 1.0 and: [
		shy = 0.0 and: [
			shx = 0.0 and: [
				sy = 1.0 and: [
					x = 0.0 and: [
						y = 0.0 ] ] ] ] ]
]

{ #category : 'initialization' }
TbMatrix2D >> matrix: aMatrix [
	"Copy matrix values"
	
	sx := aMatrix sx.
	shy := aMatrix shy.
	shx := aMatrix shx.
	sy := aMatrix sy.
	x := aMatrix x.
	y := aMatrix y
]

{ #category : 'matrix - transformations' }
TbMatrix2D >> multiplyBy: aMatrix2D [
	"Perform a right multiplication by a given 2D matrix"
	| r11 r12 r21 r22 r31 r32 |
	
	r11 := (sx * aMatrix2D sx) + (shy * aMatrix2D shx).
	r12 := (sx * aMatrix2D shy) + (shy * aMatrix2D sy).
	r21 := (shx * aMatrix2D sx) + (sy * aMatrix2D shx).
	r22 := (shx * aMatrix2D shy) + (sy * aMatrix2D sy).
	r31 := (x * aMatrix2D sx) + (y * aMatrix2D shx) + aMatrix2D x.
	r32 := (x * aMatrix2D shy) + (y * aMatrix2D sy) + aMatrix2D y.

	sx := r11.
	shy := r12.
	shx := r21.
	sy := r22.
	x := r31.
	y := r32
]

{ #category : 'matrix - transformations' }
TbMatrix2D >> perspective: aDepth [
	"2D matrix does not have a perspective components"
]

{ #category : 'matrix - transformations' }
TbMatrix2D >> reflectBy: aDiagonalVector [
	"Apply a reflection transformation given by a diagonal vector"
		
	"Apply the reflection AFTER my existing transformation."
	self multiplyBy: (self class reflection: aDiagonalVector)
]

{ #category : 'initialization' }
TbMatrix2D >> reflection: aDiagonalVector [
	"Set me to be a 2D matrix representing a reflection defined by a given diagonal"

	x := 0.0.
	y := 0.0.
	sx := aDiagonalVector x.
	sy := aDiagonalVector y.
	shx := 0.
	shy := 0
]

{ #category : 'matrix - transformations' }
TbMatrix2D >> rotateByRadians: anAngle around: aBlVector [
	"Apply a rotation transformation by a given amount of radians around a provided axis vector"
	self
		assert: [ aBlVector = TbVector zAxis ]
		description: [ '2D Matrix is incompatible with 3D transformation' ].
		
	"Apply the rotation AFTER my existing transformation.
	Any vector that is multiplied by the resulting matrix
	will first be transformed by the original transform,
	then be rotated by given angle in radians"
	
	self multiplyBy: (self class rotation: anAngle)
]

{ #category : 'initialization' }
TbMatrix2D >> rotation: anAngle [
	"Set me to be a 2D matrix representing a rotation by a given angle in radians"
	| aSin aCos |

	aSin := anAngle sin reduce asFloat.
	aCos := anAngle cos reduce asFloat.
	
	x := 0.0.
	y := 0.0.
	sx := aCos.
	sy := aCos.
	shx := aSin negated.
	shy := aSin
]

{ #category : 'matrix - transformations' }
TbMatrix2D >> scaleBy: aBlVector [
	| aScale3D |
	"Apply a scaling defined by a given vector"
	
	aScale3D := aBlVector asScale3D.

	self
		assert: [ aScale3D z closeTo: 1 ]
		description: [ '2D Matrix is incompatible with 3D transformation' ].
		
	"Apply the scale AFTER my existing transformation.
	Any vector that is multiplied by the resulting matrix
	will first be transformed by the original transform,
	then be scaled by given scale factor"

	sx := sx * aScale3D x.
	shy := shy * aScale3D y.
	shx := shx * aScale3D x.
	sy := sy * aScale3D y.
	x := x * aScale3D x.
	y := y * aScale3D y
]

{ #category : 'matrix - accessing' }
TbMatrix2D >> shx [
	"Returns the X coordinate shearing element of the affine transformation matrix"
	<return: #Number>

	^ shx
]

{ #category : 'matrix - accessing' }
TbMatrix2D >> shx: anObject [
	shx := anObject
]

{ #category : 'matrix - accessing' }
TbMatrix2D >> shy [
	"Returns the Y coordinate shearing element of the affine transformation matrix"
	<return: #Number>
	
	^ shy
]

{ #category : 'matrix - accessing' }
TbMatrix2D >> shy: anObject [
	shy := anObject
]

{ #category : 'matrix - accessing' }
TbMatrix2D >> sx [
	"Returns the X coordinate scaling element of the affine transformation matrix"
	<return: #Number>

	^ sx
]

{ #category : 'matrix - accessing' }
TbMatrix2D >> sx: anObject [
	sx := anObject
]

{ #category : 'matrix - accessing' }
TbMatrix2D >> sy [
	"Returns the Y coordinate scaling element of the affine transformation matrix"
	<return: #Number>

	^ sy
]

{ #category : 'matrix - accessing' }
TbMatrix2D >> sy: anObject [
	sy := anObject
]

{ #category : 'matrix - transforming points' }
TbMatrix2D >> transformBounds: aBlBounds [
	"In-place transform given BlBounds according to my transformation.
	(local to global transformation)"
	<return: #BlBounds>
	| newLeft newTop newRight newBottom quadTopLeft quadTopRight quadBottomLeft quadBottomRight |

	self isIdentity
		ifTrue: [ ^ aBlBounds ].

	quadTopLeft := self transformX: aBlBounds left Y: aBlBounds top.
	quadTopRight := self transformX: aBlBounds right Y: aBlBounds top.
	quadBottomLeft := self transformX: aBlBounds left Y: aBlBounds bottom.
	quadBottomRight := self transformX: aBlBounds right Y: aBlBounds bottom.

	newLeft := ((quadTopLeft x
		min: quadTopRight x)
			min: quadBottomLeft x)
				min: quadBottomRight x.
	newRight := ((quadTopLeft x
		max: quadTopRight x)
			max: quadBottomLeft x)
				max: quadBottomRight x.

	newTop := ((quadTopLeft y
		min: quadTopRight y)
			min: quadBottomLeft y)
				min: quadBottomRight y.
				
	newBottom := ((quadTopLeft y
		max: quadTopRight y)
			max: quadBottomLeft y)
				max: quadBottomRight y.
	
	aBlBounds
		left: newLeft
		top: newTop
		right: newRight
		bottom: newBottom.
		
	^ aBlBounds
]

{ #category : 'matrix - transforming points' }
TbMatrix2D >> transformPoint2D: aPoint2D [
	
	^ self transformX: aPoint2D x Y: aPoint2D y
]

{ #category : 'matrix - transforming points' }
TbMatrix2D >> transformX: aX Y: aY [
	| newX newY |
	
	newX := (aX * sx) + (aY * shx) + x.
	newY := (aX * shy) + (aY * sy) + y.

	^ newX @ newY
]

{ #category : 'matrix - transforming points' }
TbMatrix2D >> transformX: aX withY: aY [

	^ (aX * sx) + (aY * shx) + x
]

{ #category : 'matrix - transforming points' }
TbMatrix2D >> transformY: aY withX: aX [

	^ (aX * shy) + (aY * sy) + y
]

{ #category : 'matrix - transformations' }
TbMatrix2D >> translateBy: aBlVector [
	"Apply a translation by a given vector"
	| aTranslate3D |
	
	aTranslate3D := aBlVector asTranslate3D.
	
	self
		assert: [ aTranslate3D z isZero ]
		description: [ '2D Matrix is incompatible with 3D transformation' ].
		
	"Apply the translation AFTER my existing transformation.
	Any vector that is multiplied by the resulting matrix
	will first be transformed by the original transform,
	then be translated by given translation"
	x := x + aTranslate3D x.
	y := y + aTranslate3D y.
]

{ #category : 'matrix - accessing' }
TbMatrix2D >> x [
	"Returns the X coordinate of the translation element of the affine transformation matrix"
	<return: #Number>
	
	^ x
]

{ #category : 'matrix - accessing' }
TbMatrix2D >> x: anObject [
	x := anObject
]

{ #category : 'matrix - accessing' }
TbMatrix2D >> y [
	"Returns the Y coordinate of the translation element of the affine transformation matrix"
	<return: #Number>

	^ y
]

{ #category : 'matrix - accessing' }
TbMatrix2D >> y: anObject [
	y := anObject
]
