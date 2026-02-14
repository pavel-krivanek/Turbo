"
I am mutable implementation of Rectangle which stores coordinates as Numbers and not Points.
I am very usefull for chainable bounds transformations and may be transformed in-place by BlMatrix2D and BlMatrix3D
"
Class {
	#name : 'TbBounds',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'left',
		'top',
		'right',
		'bottom',
		'DefaultPrecision'
	],
	#category : 'Turbo-Core-Basic-Bounds',
	#package : 'Turbo-Core',
	#tag : 'Basic-Bounds'
}

{ #category : 'accessing' }
TbBounds class >> defaultPrecision [
	"Return the default precision for closeTo: comparisons"
	<return: #Number>
	
	^ 5e-5
]

{ #category : 'instance creation' }
TbBounds class >> fromRectangle: aRectangle [
	^ self new
		rectangle: aRectangle;
		yourself
]

{ #category : 'instance creation' }
TbBounds class >> left: aLeft top: aTop right: aRight bottom: aBottom [
	<return: #BlBounds>

	^ self new left: aLeft top: aTop right: aRight bottom: aBottom
]

{ #category : 'instance creation' }
TbBounds class >> origin: anOrigin corner: aCorner [

	^ self new origin: anOrigin corner: aCorner
]

{ #category : 'instance creation' }
TbBounds class >> origin: anOrigin extent: anExtent [

	self
		assert: [ anExtent x >= 0 and: [ anExtent y >= 0 ] ]
		description: [ 'Extent must be positive!' ].

	^ self new
		left: anOrigin x
		top: anOrigin y
		right: anOrigin x + anExtent x
		bottom: anOrigin y + anExtent y;
		yourself
]

{ #category : 'comparing' }
TbBounds >> = aRectangle [
	"Answer true if the receiver's species, origin and corner match aRectangle's."

	^ (self species = aRectangle species or: [ aRectangle isRectangle ])
		and: [ top = aRectangle top
			and: [ right = aRectangle right
				and: [ bottom = aRectangle bottom
					and: [ left = aRectangle left ] ] ] ]
]

{ #category : 'converting' }
TbBounds >> asRectangle [
	"Convert me to immutable Rectangle.
	Note, that using left:right:top:bottom: is the fastest way to create
	a rectangle from set of numbers (faster than Point#>>corner:)"
	<return: #Rectangle>

	^ Rectangle left: left right: right top: top bottom: bottom
]

{ #category : 'debug - asserting' }
TbBounds >> assertFinite [
	self
		assert: [ left < Float infinity and: [ left > Float negativeInfinity ] ]
		description: [ 'Left must not be infinity' ].
	
	self
		assert: [ right < Float infinity and: [ right > Float negativeInfinity ] ]
		description: [ 'Right must not be infinity' ].

	self
		assert: [ top < Float infinity and: [ top > Float negativeInfinity ] ]
		description: [ 'Top must not be infinity' ].

	self
		assert: [ bottom < Float infinity and: [ bottom > Float negativeInfinity ] ]
		description: [ 'Bottom must not be infinity' ].
]

{ #category : 'accessing' }
TbBounds >> atRandom [
	"Return a random integer point within this bounds"
	<return: #Point>
	
	^ (self topLeft + (self width atRandom @ self height atRandom)) asIntegerPoint
]

{ #category : 'accessing' }
TbBounds >> bottom [
	^ bottom
]

{ #category : 'accessing' }
TbBounds >> bottom: aNumber [
	bottom := aNumber.

	self assertFinite
]

{ #category : 'accessing' }
TbBounds >> bottomCenter [
	"Answer the point at the center of the receiver's bottom horizontal line."
	<return: #Point>

	^ self center x @ self bottom
]

{ #category : 'accessing' }
TbBounds >> bottomLeft [
	"Answer the point at the left edge of the bottom horizontal line of the receiver."
	<return: #Point>

	^ self origin x @ self corner y
]

{ #category : 'accessing' }
TbBounds >> bottomRight [
	"Answer the point at the right edge of the bottom horizontal line of the receiver."
	<return: #Point>

	^ self corner
]

{ #category : 'initialization' }
TbBounds >> bounds: aBlBounds [
	self
		left: aBlBounds left
		top: aBlBounds top
		right: aBlBounds right
		bottom: aBlBounds bottom
]

{ #category : 'accessing' }
TbBounds >> center [
	<return: #Point>

	^ ((left / 2.0) + (right / 2.0)) @ ((top / 2.0) + (bottom / 2.0))
]

{ #category : 'accessing' }
TbBounds >> centerLeft [
	<return: #Point>

	^ self left @ self center y
]

{ #category : 'accessing' }
TbBounds >> centerRight [
	<return: #Point>

	^ self right @ self center y
]

{ #category : 'vector functions' }
TbBounds >> clamp: aPoint [
	<return: #Point>

	^ (aPoint min: self corner) max: self origin
]

{ #category : 'vector functions' }
TbBounds >> clockwiseEdges [
	<return: #Collection of: #BlRay>

	^ { 
		TbRay from: self topLeft directed: (self topRight - self topLeft) asBlocVector.
		TbRay from: self topRight directed: (self bottomRight - self topRight) asBlocVector.
		TbRay from: self bottomRight directed: (self bottomLeft - self bottomRight) asBlocVector.
		TbRay from: self bottomLeft directed: (self topLeft - self bottomLeft) asBlocVector.
	}
]

{ #category : 'comparing' }
TbBounds >> closeTo: aBlBounds [
	"Return true if I am close to the given bounds"
	<return: #Boolean>
	
	| precision |
	precision := self class defaultPrecision.
	^ (self left closeTo: aBlBounds left precision: precision)
		and: [ (self right closeTo: aBlBounds right precision: precision)
				and: [ (self top closeTo: aBlBounds top precision: precision)
						and: [ (self bottom closeTo: aBlBounds bottom precision: precision) ] ] ]
]

{ #category : 'vector functions' }
TbBounds >> closestEdgeTo: aPoint [
	<return: #BlRay>

	^ self counterClockwiseEdges detectMin: [ :aRay | aRay distanceTo: aPoint ]
]

{ #category : 'testing' }
TbBounds >> containedInRect: aRectangle [
	"Answer whether a receiver is within a aRectangle"
	<return: #Boolean>
	| aLeft aTop aRight aBottom |
	
	aLeft := aRectangle left.
	aTop := aRectangle top.
	aRight := aRectangle right.
	aBottom := aRectangle bottom.

	^ aLeft <= left and: [
		aTop <= top and: [
			aRight >= right and: [
				aBottom >= bottom ] ] ]
]

{ #category : 'testing' }
TbBounds >> containsPoint: aPoint [ 
	"Answer whether aPoint is within the receiver."
	<return: #Boolean>

	^ self origin <= aPoint and: [ aPoint < self corner ]
]

{ #category : 'testing' }
TbBounds >> containsRect: aRectangle [
	"Answer whether aRectangle is within the receiver"
	<return: #Boolean>
	| aLeft aTop aRight aBottom |
	
	aLeft := aRectangle left.
	aTop := aRectangle top.
	aRight := aRectangle right.
	aBottom := aRectangle bottom.
	
	^ aLeft >= left and: [
		aTop >= top and: [
			aRight <= right and: [
				aBottom <= bottom ] ] ]
]

{ #category : 'accessing' }
TbBounds >> corner [
	^ right @ bottom
]

{ #category : 'vector functions' }
TbBounds >> counterClockwiseEdges [
	<return: #Collection of: #BlRay>
	
	^ { 
		TbRay from: self topRight directed: (self topLeft - self topRight) asBlocVector.
		TbRay from: self topLeft directed: (self bottomLeft - self topLeft) asBlocVector.
		TbRay from: self bottomLeft directed: (self bottomRight - self bottomLeft) asBlocVector.		
		TbRay from: self bottomRight directed: (self topRight - self bottomRight) asBlocVector.
	}
]

{ #category : 'accessing' }
TbBounds >> encompass [
	| newLeft newTop newRight newBottom |
	
	newLeft := left min: right.
	newTop := top min: bottom.
	newRight := left max: right.
	newBottom := top max: bottom.
	
	left := newLeft.
	top := newTop.
	right := newRight.
	bottom := newBottom
]

{ #category : 'rectangle functions' }
TbBounds >> encompass: aPoint [ 
	"Inplace encompass me so that I contain both the receiver and aPoint."

	top := top min: aPoint y.
	right := right max: aPoint x.
	left := left min: aPoint x.
	bottom := bottom max: aPoint y.
	
	self assertFinite
]

{ #category : 'rectangle functions' }
TbBounds >> expandBy: aDelta [ 
	"Outset me by delta. Delta is a Rectangle, Point, or Number."

	^ aDelta isRectangle
		ifTrue: [ self expandByMargin: aDelta ]
		ifFalse: [ aDelta isPoint
			ifTrue: [ self expandByPoint: aDelta ]
			ifFalse: [ aDelta isNumber
				ifTrue: [ self expandByNumber: aDelta ]
				ifFalse: [ self expandByMargin: aDelta ] ] ]
]

{ #category : 'rectangle functions' }
TbBounds >> expandByLeft: aLeft top: aTop right: aRight bottom: aBottom [

	left := left - aLeft.
	top := top - aTop.
	right := right + aRight.
	bottom := bottom + aBottom.
	
	self assertFinite
]

{ #category : 'rectangle functions' }
TbBounds >> expandByMargin: aMargin [ 

	left := left - aMargin left.
	top := top - aMargin top.
	right := right + aMargin right.
	bottom := bottom + aMargin bottom.
	
	self assertFinite
]

{ #category : 'rectangle functions' }
TbBounds >> expandByNumber: aNumber [ 
		
	left := left - aNumber.
	top := top - aNumber.
	right := right + aNumber.
	bottom := bottom + aNumber.
	
	self assertFinite
]

{ #category : 'rectangle functions' }
TbBounds >> expandByPoint: aPoint [ 
	
	left := left - aPoint x.
	top := top - aPoint y.
	right := right + aPoint x.
	bottom := bottom + aPoint y.
	
	self assertFinite
]

{ #category : 'accessing' }
TbBounds >> expanded [
	"Transform me so that origin and corner are rounded to integers.
	Rounding is done by upper value on origin and lower value on corner so that
	self is inside rounded rectangle."
	
	left := left floor.
	top := top floor.
	right := right ceiling.
	bottom := bottom ceiling
]

{ #category : 'accessing' }
TbBounds >> extent [

	^ (right - left) @ (bottom - top)
]

{ #category : 'initialization' }
TbBounds >> extent: aPoint [
	bottom := top + aPoint y.
	right := left + aPoint x
]

{ #category : 'testing' }
TbBounds >> hasPositiveExtent [
	^ right > left and: [ bottom > top ]
]

{ #category : 'accessing' }
TbBounds >> height [
	^ bottom - top
]

{ #category : 'initialization' }
TbBounds >> initialize [
	super initialize.
	
	left := 0.
	top := 0.
	right := 0.
	bottom := 0
]

{ #category : 'rectangle functions' }
TbBounds >> intersect: aRectangle ifNone: aBlock [
	"Answer a Rectangle that is the area in which the receiver overlaps with 
	aRectangle. 
	If there's no overlap, evaluate the block instead"
	| aLeft aTop aRight aBottom newLeft newTop newRight newBottom |

	(self intersects: aRectangle)
		ifFalse: [ ^ aBlock value ].
	
	aLeft := aRectangle left.
	aTop := aRectangle top.
	aRight := aRectangle right.
	aBottom := aRectangle bottom.
	
	newLeft := aLeft max: left.
	newTop := aTop max: top.
	newRight := aRight min: right.
	newBottom := aBottom min: bottom.

	^ self class new
		left: newLeft
		top: newTop
		right: newRight
		bottom: newBottom
]

{ #category : 'testing' }
TbBounds >> intersects: aRectangle [ 
	"Answer whether aRectangle intersects the receiver anywhere"
	<return: #Boolean>
	| aLeft aTop aRight aBottom |
	
	aLeft := aRectangle left.
	aTop := aRectangle top.
	aRight := aRectangle right.
	aBottom := aRectangle bottom.

	aRight <= left ifTrue: [ ^ false ].
	aBottom <= top ifTrue: [ ^ false ].
	aLeft >= right ifTrue: [ ^ false ].
	aTop >= bottom ifTrue: [ ^ false ].
	^ true
]

{ #category : 'accessing' }
TbBounds >> left [
	^ left
]

{ #category : 'accessing' }
TbBounds >> left: aNumber [
	left := aNumber.

	self assertFinite
]

{ #category : 'initialization' }
TbBounds >> left: aLeft top: aTop corner: aCorner [
	left := aLeft.
	top := aTop.
	right := aCorner x.
	bottom := aCorner y.

	self assertFinite
]

{ #category : 'initialization' }
TbBounds >> left: aLeft top: aTop right: aRight bottom: aBottom [
	left := aLeft.
	top := aTop.
	right := aRight.
	bottom := aBottom.
	
	self assertFinite
]

{ #category : 'rectangle functions' }
TbBounds >> merge: aRectangle [ 
	"Merge provided rectangle into me.
	aRectangle must not be nil"
	| useRcvr aLeft aTop aRight aBottom minX maxX minY maxY |

	useRcvr := true.

	aLeft := aRectangle left.
	aTop := aRectangle top.
	aRight := aRectangle right.
	aBottom := aRectangle bottom.

	minX := aLeft < left
		ifTrue: 
			[ useRcvr := false.
			aLeft ]
		ifFalse: [ left ].
	maxX := aRight > right
		ifTrue: 
			[ useRcvr := false.
			aRight ]
		ifFalse: [ right ].
	minY := aTop < top
		ifTrue: 
			[ useRcvr := false.
			aTop ]
		ifFalse: [ top ].
	maxY := aBottom > bottom
		ifTrue: 
			[ useRcvr := false.
			aBottom ]
		ifFalse: [ bottom ].
	
	"no need to merge do nothing"
	useRcvr 
		ifTrue: [ ^ self ].
	
	left := minX.
	top := minY.
	right := maxX.
	bottom := maxY.
	
	self assertFinite
]

{ #category : 'accessing' }
TbBounds >> origin [
	^ left @ top
]

{ #category : 'initialization' }
TbBounds >> origin: anOrigin corner: aCorner [
	left := anOrigin x.
	top := anOrigin y.
	right := aCorner x.
	bottom := aCorner y.
	
	self assertFinite
]

{ #category : 'initialization' }
TbBounds >> origin: anOrigin extent: anExtent [
	left := anOrigin x.
	top := anOrigin y.
	right := left + anExtent x.
	bottom := top + anExtent y.
	
	self assertFinite
]

{ #category : 'vector functions' }
TbBounds >> outsideNormalCloseTo: aPoint [
	<return: #BlRay>
	| anEdge aProjection aNormal |
	
	anEdge := self closestEdgeTo: aPoint.
	aProjection := anEdge projection: aPoint.
	aNormal := anEdge vector normal.

	^ TbRay from: aProjection directed: aNormal
]

{ #category : 'accessing' }
TbBounds >> position [
	<return: #Point>

	^ self origin
]

{ #category : 'printing' }
TbBounds >> printOn: aStream [ 
	"Refer to the comment in Object|printOn:."

	self origin printOn: aStream.
	aStream nextPutAll: ' corner: '.
	self corner printOn: aStream
]

{ #category : 'initialization' }
TbBounds >> rectangle: aRectangle [
	self
		left: aRectangle left
		top: aRectangle top
		right: aRectangle right
		bottom: aRectangle bottom
]

{ #category : 'accessing' }
TbBounds >> right [
	^ right
]

{ #category : 'accessing' }
TbBounds >> right: aNumber [
	right := aNumber.

	self assertFinite
]

{ #category : 'accessing' }
TbBounds >> rightCenter [
	"Answer the point at the center of the receiver's right vertical line."
	<return: #Point>

	^ self right @ self center y
]

{ #category : 'transforming' }
TbBounds >> scaleBy: aFactor [
	
	^ aFactor isPoint
		ifTrue: [ self scaleX: aFactor x Y: aFactor y ]
		ifFalse: [ aFactor isNumber
			ifTrue: [ self scaleX: aFactor Y: aFactor ]
			ifFalse: [ self scaleX: aFactor x Y: aFactor y ] ]
]

{ #category : 'transforming' }
TbBounds >> scaleX: aX Y: aY [

	left := left * aX.
	top := top * aY.
	right := right * aX.
	bottom := bottom * aY.
	
	self assertFinite
]

{ #category : 'printing' }
TbBounds >> storeOn: aStream [ 
	"printed form is good for storing too"
	
	aStream nextPut: $(.
	self printOn: aStream.
	aStream nextPut: $).
]

{ #category : 'accessing' }
TbBounds >> top [
	^ top
]

{ #category : 'accessing' }
TbBounds >> top: aNumber [
	top := aNumber.

	self assertFinite
]

{ #category : 'accessing' }
TbBounds >> topCenter [
	"Answer the point at the center of the receiver's top horizontal line."
	<return: #Point>

	^ self center x @ self top
]

{ #category : 'accessing' }
TbBounds >> topLeft [
	"Answer the point at the top left corner of the receiver's top horizontal line"
	<return: #Point>

	^ left @ top
]

{ #category : 'accessing' }
TbBounds >> topRight [
	"Answer the point at the top right corner of the receiver's top horizontal line."
	<return: #Point>

	^ self corner x @ self origin y
]

{ #category : 'transforming' }
TbBounds >> translateBy: aPoint [

	self translateX: aPoint x Y: aPoint y
]

{ #category : 'transforming' }
TbBounds >> translateX: aX Y: aY [

	left := left + aX.
	top := top + aY.
	right := right + aX.
	bottom := bottom + aY.
	
	self assertFinite
]

{ #category : 'accessing' }
TbBounds >> width [
	^ right - left
]
