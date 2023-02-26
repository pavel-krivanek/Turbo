"
I am mutable implementation of Rectangle which stores coordinates as Numbers and not Points
"
Class {
	#name : #TbSpartaRectangle,
	#superclass : #Object,
	#instVars : [
		'left',
		'top',
		'right',
		'bottom'
	],
	#category : #'Turbo-Math'
}

{ #category : #'instance creation' }
TbSpartaRectangle class >> fromRectangle: aRectangle [
	^ self new
		rectangle: aRectangle;
		yourself
]

{ #category : #'instance creation' }
TbSpartaRectangle class >> origin: anOrigin extent: anExtent [

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

{ #category : #converting }
TbSpartaRectangle >> asRectangle [
	"Convert me to immutable Rectangle.
	Note, that using left:right:top:bottom: is the fastest way to create
	a rectangle from set of numbers (faster than Point#>>corner:)"

	^ Rectangle left: left right: right top: top bottom: bottom
]

{ #category : #converting }
TbSpartaRectangle >> asSpartaPathOn: aSpartaCanvas [
	"I am polymorphic with TSpartaPath and can be used directly"
	^ self
]

{ #category : #accessing }
TbSpartaRectangle >> bottom [
	^ bottom
]

{ #category : #accessing }
TbSpartaRectangle >> bottom: anObject [
	bottom := anObject
]

{ #category : #testing }
TbSpartaRectangle >> containedInRect: aRectangle [
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

{ #category : #testing }
TbSpartaRectangle >> containsRect: aRectangle [
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

{ #category : #accessing }
TbSpartaRectangle >> corner [
	^ right @ bottom
]

{ #category : #'rectangle functions' }
TbSpartaRectangle >> expandBy: aDelta [ 
	"Outset me by delta. Delta is a Rectangle, Point, or Number."

	^ aDelta isRectangle
		ifTrue: [ self expandByMargin: aDelta ]
		ifFalse: [ aDelta isPoint
			ifTrue: [ self expandByPoint: aDelta ]
			ifFalse: [ aDelta isNumber
				ifTrue: [ self expandByNumber: aDelta ]
				ifFalse: [ self expandByMargin: aDelta ] ] ]
]

{ #category : #'rectangle functions' }
TbSpartaRectangle >> expandByLeft: aLeft top: aTop right: aRight bottom: aBottom [

	left := left - aLeft.
	top := top - aTop.
	right := right + aRight.
	bottom := bottom + aBottom
]

{ #category : #'rectangle functions' }
TbSpartaRectangle >> expandByMargin: aMargin [ 

	left := left - aMargin left.
	top := top - aMargin top.
	right := right + aMargin right.
	bottom := bottom + aMargin bottom
]

{ #category : #'rectangle functions' }
TbSpartaRectangle >> expandByNumber: aNumber [ 
		
	left := left - aNumber.
	top := top - aNumber.
	right := right + aNumber.
	bottom := bottom + aNumber
]

{ #category : #'rectangle functions' }
TbSpartaRectangle >> expandByPoint: aPoint [ 
	
	left := left - aPoint x.
	top := top - aPoint y.
	right := right + aPoint x.
	bottom := bottom + aPoint y
]

{ #category : #accessing }
TbSpartaRectangle >> expanded [
	"Transform me so that origin and corner are rounded to integers.
	Rounding is done by upper value on origin and lower value on corner so that
	self is inside rounded rectangle."
	
	left := left floor.
	top := top floor.
	right := right ceiling.
	bottom := bottom ceiling
]

{ #category : #accessing }
TbSpartaRectangle >> extent [

	^ (right - left) @ (bottom - top)
]

{ #category : #testing }
TbSpartaRectangle >> hasPositiveExtent [
	^ right > left and: [ bottom > top ]
]

{ #category : #accessing }
TbSpartaRectangle >> height [
	^ bottom - top
]

{ #category : #initialization }
TbSpartaRectangle >> initialize [
	super initialize.
	
	left := 0.
	top := 0.
	right := 0.
	bottom := 0
]

{ #category : #'rectangle functions' }
TbSpartaRectangle >> intersect: aRectangle ifNone: aBlock [
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

{ #category : #testing }
TbSpartaRectangle >> intersects: aRectangle [ 
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

{ #category : #accessing }
TbSpartaRectangle >> left [
	^ left
]

{ #category : #accessing }
TbSpartaRectangle >> left: anObject [
	left := anObject
]

{ #category : #initialization }
TbSpartaRectangle >> left: aLeft top: aTop corner: aCorner [

	left := aLeft.
	top := aTop.
	right := aCorner x.
	bottom := aCorner y
]

{ #category : #initialization }
TbSpartaRectangle >> left: aLeft top: aTop right: aRight bottom: aBottom [
	left := aLeft.
	top := aTop.
	right := aRight.
	bottom := aBottom
]

{ #category : #'rectangle functions' }
TbSpartaRectangle >> merge: aRectangle [ 
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
	bottom := maxY
]

{ #category : #accessing }
TbSpartaRectangle >> origin [
	^ left @ top
]

{ #category : #initialization }
TbSpartaRectangle >> origin: anOrigin extent: anExtent [

	left := anOrigin x.
	top := anOrigin y.
	right := left + anExtent x.
	bottom := top + anExtent y
]

{ #category : #initialization }
TbSpartaRectangle >> rectangle: aRectangle [
	self
		left: aRectangle left
		top: aRectangle top
		right: aRectangle right
		bottom: aRectangle bottom
]

{ #category : #accessing }
TbSpartaRectangle >> right [
	^ right
]

{ #category : #accessing }
TbSpartaRectangle >> right: anObject [
	right := anObject
]

{ #category : #transforming }
TbSpartaRectangle >> scaleBy: aFactor [
	
	^ aFactor isPoint
		ifTrue: [ self scaleX: aFactor x Y: aFactor y ]
		ifFalse: [ aFactor isNumber
			ifTrue: [ self scaleX: aFactor Y: aFactor ]
			ifFalse: [ self scaleX: aFactor x Y: aFactor y ] ]
]

{ #category : #transforming }
TbSpartaRectangle >> scaleX: aX Y: aY [

	left := left * aX.
	top := top * aY.
	right := right * aX.
	bottom := bottom * aY
]

{ #category : #dispatch }
TbSpartaRectangle >> spartaClipOn: aSpartaCanvas with: aSpartaClipper [
	aSpartaClipper pushRectangle: self
]

{ #category : #dispatch }
TbSpartaRectangle >> spartaFillOn: aSpartaCanvas with: aSpartaFiller [
	aSpartaFiller fillRectangle: self
]

{ #category : #dispatch }
TbSpartaRectangle >> spartaStrokeOn: aSpartaCanvas with: aSpartaStrokePainter [
	aSpartaStrokePainter strokeRectangle: self
]

{ #category : #accessing }
TbSpartaRectangle >> top [
	^ top
]

{ #category : #accessing }
TbSpartaRectangle >> top: anObject [
	top := anObject
]

{ #category : #accessing }
TbSpartaRectangle >> topLeft [
	"Answer the point at the top left corner of the receiver's top horizontal line"
	<return: #Point>

	^ left @ top
]

{ #category : #transforming }
TbSpartaRectangle >> translateBy: aPoint [

	self translateX: aPoint x Y: aPoint y
]

{ #category : #transforming }
TbSpartaRectangle >> translateX: aX Y: aY [

	left := left + aX.
	top := top + aY.
	right := right + aX.
	bottom := bottom + aY
]

{ #category : #accessing }
TbSpartaRectangle >> width [
	^ right - left
]
