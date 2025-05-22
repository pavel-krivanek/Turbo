Class {
	#name : 'TbBoundsTest',
	#superclass : 'TestCase',
	#category : 'Turbo-Tests-Bounds',
	#package : 'Turbo-Tests',
	#tag : 'Bounds'
}

{ #category : 'tests' }
TbBoundsTest >> testAsRectangle [
	| bounds rectangle |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	rectangle := bounds asRectangle.
	self assert: rectangle left equals: 10.
	self assert: rectangle right equals: 30.
	self assert: rectangle top equals: 20.
	self assert: rectangle bottom equals: 40.
]

{ #category : 'tests' }
TbBoundsTest >> testAssertFinite [
	| bounds |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	self shouldnt: [ bounds assertFinite ] raise: Error.
]

{ #category : 'tests' }
TbBoundsTest >> testAtRandom [
	| bounds point |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	point := bounds atRandom.
	self assert: (bounds containsPoint: point).
]

{ #category : 'tests' }
TbBoundsTest >> testBottom [
	| bounds |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	self assert: bounds bottom equals: 40.

]

{ #category : 'tests' }
TbBoundsTest >> testBottomCenter [
	| bounds point |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	point := bounds bottomCenter.
	self assert: point x equals: 20.
	self assert: point y equals: 40.
]

{ #category : 'tests' }
TbBoundsTest >> testBottomLeft [
	| bounds point |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	point := bounds bottomLeft.
	self assert: point x equals: 10.
	self assert: point y equals: 40.
]

{ #category : 'tests' }
TbBoundsTest >> testBottomRight [
	| bounds point |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	point := bounds bottomRight.
	self assert: point x equals: 30.
	self assert: point y equals: 40.

]

{ #category : 'tests' }
TbBoundsTest >> testBounds [
	| bounds otherBounds |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	otherBounds := TbBounds left: 5 top: 15 right: 25 bottom: 35.
	bounds bounds: otherBounds.
	self assert: bounds left equals: 5.
	self assert: bounds right equals: 25.
	self assert: bounds top equals: 15.
	self assert: bounds bottom equals: 35.

]

{ #category : 'tests' }
TbBoundsTest >> testCenter [
	| bounds point |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	point := bounds center.
	self assert: point x equals: 20.
	self assert: point y equals: 30.
]

{ #category : 'tests' }
TbBoundsTest >> testCenterLeft [
	| bounds point |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	point := bounds centerLeft.
	self assert: point x equals: 10.
	self assert: point y equals: 30.
]

{ #category : 'tests' }
TbBoundsTest >> testCenterRight [
	| bounds point |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	point := bounds centerRight.
	self assert: point x equals: 30.
	self assert: point y equals: 30.
]

{ #category : 'tests' }
TbBoundsTest >> testClamp [
	| bounds point clampedPoint |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	point := 5@15.
	clampedPoint := bounds clamp: point.
	self assert: clampedPoint x equals: 10.
	self assert: clampedPoint y equals: 20.
]

{ #category : 'tests' }
TbBoundsTest >> testClockwiseEdges [
	| bounds edges |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	edges := bounds clockwiseEdges.
	self assert: edges size equals: 4.
]

{ #category : 'tests' }
TbBoundsTest >> testCloseTo [
	| bounds otherBounds |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	otherBounds := TbBounds left: 10.00001 top: 20.00002 right: 30.00003 bottom: 40.00004.
	self assert: (bounds closeTo: otherBounds).
]

{ #category : 'tests' }
TbBoundsTest >> testClosestEdgeTo [
	| bounds point edge |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	point := 5@15.
	edge := bounds closestEdgeTo: point.
	self assert: (edge isKindOf: TbRay).

]

{ #category : 'tests' }
TbBoundsTest >> testContainedInRect [
	| bounds rectangle |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	rectangle := Rectangle left: 5 right: 35 top: 15 bottom: 45.
	self assert: (bounds containedInRect: rectangle).
]

{ #category : 'tests' }
TbBoundsTest >> testContainsPoint [
	| bounds point |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	point := 15@25.
	self assert: (bounds containsPoint: point).
]

{ #category : 'tests' }
TbBoundsTest >> testContainsRect [
	| bounds otherBounds |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	otherBounds := TbBounds left: 15 top: 25 right: 25 bottom: 35.
	self assert: (bounds containsRect: otherBounds).
]

{ #category : 'tests' }
TbBoundsTest >> testCorner [
	| bounds point |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	point := bounds corner.
	self assert: point x equals: 30.
	self assert: point y equals: 40.
]

{ #category : 'tests' }
TbBoundsTest >> testCounterClockwiseEdges [
	| bounds edges |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	edges := bounds counterClockwiseEdges.
	self assert: edges size equals: 4.
]

{ #category : 'tests' }
TbBoundsTest >> testEncompass [
	| bounds |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	bounds encompass.
	self assert: bounds left equals: 10.
	self assert: bounds right equals: 30.
	self assert: bounds top equals: 20.
	self assert: bounds bottom equals: 40.

]

{ #category : 'tests' }
TbBoundsTest >> testEncompassPoint [
	| bounds point |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	point := 5@15.
	bounds encompass: point.
	self assert: bounds left equals: 5.
	self assert: bounds right equals: 30.
	self assert: bounds top equals: 15.
	self assert: bounds bottom equals: 40.
]

{ #category : 'tests' }
TbBoundsTest >> testEquality [
	| bounds1 bounds2 |
	bounds1 := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	bounds2 := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	self assert: bounds1 equals: bounds2.
]

{ #category : 'tests' }
TbBoundsTest >> testExpandBy [
	| bounds |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	bounds expandBy: 5.
	self assert: bounds left equals: 5.
	self assert: bounds right equals: 35.
	self assert: bounds top equals: 15.
	self assert: bounds bottom equals: 45.
]

{ #category : 'tests' }
TbBoundsTest >> testExpandByLeftTopRightBottom [
	| bounds |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	bounds expandByLeft: 5 top: 10 right: 15 bottom: 20.
	self assert: bounds left equals: 5.
	self assert: bounds right equals: 45.
	self assert: bounds top equals: 10.
	self assert: bounds bottom equals: 60.
]

{ #category : 'tests' }
TbBoundsTest >> testExpandByMargin [
	| bounds margin |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	margin := Rectangle left: 5 right: 15 top: 10 bottom: 20.
	bounds expandByMargin: margin.
	self assert: bounds left equals: 5.
	self assert: bounds right equals: 45.
	self assert: bounds top equals: 10.
	self assert: bounds bottom equals: 60.

]

{ #category : 'tests' }
TbBoundsTest >> testExpandByNumber [
	| bounds |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	bounds expandByNumber: 5.
	self assert: bounds left equals: 5.
	self assert: bounds right equals: 35.
	self assert: bounds top equals: 15.
	self assert: bounds bottom equals: 45.
]

{ #category : 'tests' }
TbBoundsTest >> testExpandByPoint [
	| bounds point |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	point := 5@10.
	bounds expandByPoint: point.
	self assert: bounds left equals: 5.
	self assert: bounds right equals: 35.
	self assert: bounds top equals: 10.
	self assert: bounds bottom equals: 50.
]

{ #category : 'tests' }
TbBoundsTest >> testExpanded [
	| bounds |
	bounds := TbBounds left: 10.5 top: 20.5 right: 30.5 bottom: 40.5.
	bounds expanded.
	self assert: bounds left equals: 10.
	self assert: bounds right equals: 31.
	self assert: bounds top equals: 20.
	self assert: bounds bottom equals: 41.
]

{ #category : 'tests' }
TbBoundsTest >> testExtent [
	| bounds extent |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	extent := bounds extent.
	self assert: extent x equals: 20.
	self assert: extent y equals: 20.
]

{ #category : 'tests' }
TbBoundsTest >> testExtentPoint [
	| bounds point |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	point := 20@20.
	bounds extent: point.
	self assert: bounds right equals: 30.
	self assert: bounds bottom equals: 40.
]

{ #category : 'tests' }
TbBoundsTest >> testFromRectangle [
	| rectangle bounds |
	rectangle := Rectangle left: 10 right: 20 top: 30 bottom: 40.
	bounds := TbBounds fromRectangle: rectangle.
	self assert: bounds left equals: 10.
	self assert: bounds right equals: 20.
	self assert: bounds top equals: 30.
	self assert: bounds bottom equals: 40.
]

{ #category : 'tests' }
TbBoundsTest >> testHasPositiveExtent [
	| bounds |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	self assert: bounds hasPositiveExtent.
]

{ #category : 'tests' }
TbBoundsTest >> testHeight [
	| bounds |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	self assert: bounds height equals: 20.
]

{ #category : 'tests' }
TbBoundsTest >> testInitialize [
	| bounds |
	bounds := TbBounds new.
	self assert: bounds left equals: 0.
	self assert: bounds right equals: 0.
	self assert: bounds top equals: 0.
	self assert: bounds bottom equals: 0.
]

{ #category : 'tests' }
TbBoundsTest >> testIntersectIfNone [
	| bounds otherBounds intersection |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	otherBounds := TbBounds left: 20 top: 30 right: 40 bottom: 50.
	intersection := bounds intersect: otherBounds ifNone: [ nil ].
	self assert: (intersection isKindOf: TbBounds).
	self assert: intersection left equals: 20.
	self assert: intersection right equals: 30.
	self assert: intersection top equals: 30.
	self assert: intersection bottom equals: 40.
]

{ #category : 'tests' }
TbBoundsTest >> testIntersects [
	| bounds otherBounds |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	otherBounds := TbBounds left: 20 top: 30 right: 40 bottom: 50.
	self assert: (bounds intersects: otherBounds).

]

{ #category : 'tests' }
TbBoundsTest >> testLeft [
	| bounds |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	self assert: bounds left equals: 10.
]

{ #category : 'tests' }
TbBoundsTest >> testLeftTopRightBottom [
	| bounds |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	self assert: bounds left equals: 10.
	self assert: bounds right equals: 30.
	self assert: bounds top equals: 20.
	self assert: bounds bottom equals: 40.
]

{ #category : 'tests' }
TbBoundsTest >> testMerge [
	| bounds otherBounds |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	otherBounds := TbBounds left: 5 top: 15 right: 35 bottom: 45.
	bounds merge: otherBounds.
	self assert: bounds left equals: 5.
	self assert: bounds right equals: 35.
	self assert: bounds top equals: 15.
	self assert: bounds bottom equals: 45.
]

{ #category : 'tests' }
TbBoundsTest >> testOrigin [
	| bounds point |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	point := bounds origin.
	self assert: point x equals: 10.
	self assert: point y equals: 20.
]

{ #category : 'tests' }
TbBoundsTest >> testOriginCorner [
	| bounds |
	bounds := TbBounds origin: 10@20 corner: 30@40.
	self assert: bounds left equals: 10.
	self assert: bounds right equals: 30.
	self assert: bounds top equals: 20.
	self assert: bounds bottom equals: 40.

]

{ #category : 'tests' }
TbBoundsTest >> testOriginExtent [
	| bounds |
	bounds := TbBounds origin: 10@20 extent: 20@30.
	self assert: bounds left equals: 10.
	self assert: bounds right equals: 30.
	self assert: bounds top equals: 20.
	self assert: bounds bottom equals: 50.
]

{ #category : 'tests' }
TbBoundsTest >> testOutsideNormalCloseTo [
	| bounds point ray |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	point := 5@15.
	ray := bounds outsideNormalCloseTo: point.
	self assert: (ray isKindOf: TbRay).
]

{ #category : 'tests' }
TbBoundsTest >> testPosition [
	| bounds point |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	point := bounds position.
	self assert: point x equals: 10.
	self assert: point y equals: 20.
]

{ #category : 'tests' }
TbBoundsTest >> testPrintOn [
	| bounds stream |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	stream := WriteStream on: String new.
	bounds printOn: stream.
	self assert: stream contents equals: '(10@20) corner: (30@40)'.
]

{ #category : 'tests' }
TbBoundsTest >> testRectangle [
	| bounds rectangle |
	rectangle := Rectangle left: 10 right: 20 top: 30 bottom: 40.
	bounds := TbBounds new rectangle: rectangle.
	self assert: bounds left equals: 10.
	self assert: bounds right equals: 20.
	self assert: bounds top equals: 30.
	self assert: bounds bottom equals: 40.
]

{ #category : 'tests' }
TbBoundsTest >> testRight [
	| bounds |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	self assert: bounds right equals: 30.
]

{ #category : 'tests' }
TbBoundsTest >> testRightCenter [
	| bounds point |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	point := bounds rightCenter.
	self assert: point x equals: 30.
	self assert: point y equals: 30.
]

{ #category : 'tests' }
TbBoundsTest >> testScaleBy [
	| bounds |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	bounds scaleBy: 2.
	self assert: bounds left equals: 20.
	self assert: bounds right equals: 60.
	self assert: bounds top equals: 40.
	self assert: bounds bottom equals: 80.

]

{ #category : 'tests' }
TbBoundsTest >> testScaleXY [
	| bounds |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	bounds scaleX: 2 Y: 2.
	self assert: bounds left equals: 20.
	self assert: bounds right equals: 60.
	self assert: bounds top equals: 40.
	self assert: bounds bottom equals: 80.
]

{ #category : 'tests' }
TbBoundsTest >> testStoreOn [
	| bounds stream |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	stream := WriteStream on: String new.
	bounds storeOn: stream.
	self assert: stream contents equals: '((10@20) corner: (30@40))'.
]

{ #category : 'tests' }
TbBoundsTest >> testTop [
	| bounds |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	self assert: bounds top equals: 20.

]

{ #category : 'tests' }
TbBoundsTest >> testTopCenter [
	| bounds point |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	point := bounds topCenter.
	self assert: point x equals: 20.
	self assert: point y equals: 20.

]

{ #category : 'tests' }
TbBoundsTest >> testTopLeft [
	| bounds point |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	point := bounds topLeft.
	self assert: point x equals: 10.
	self assert: point y equals: 20.

]

{ #category : 'tests' }
TbBoundsTest >> testTopRight [
	| bounds point |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	point := bounds topRight.
	self assert: point x equals: 30.
	self assert: point y equals: 20.
]

{ #category : 'tests' }
TbBoundsTest >> testTranslateBy [
	| bounds point |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	point := 5@10.
	bounds translateBy: point.
	self assert: bounds left equals: 15.
	self assert: bounds right equals: 35.
	self assert: bounds top equals: 30.
	self assert: bounds bottom equals: 50.

]

{ #category : 'tests' }
TbBoundsTest >> testTranslateXY [
	| bounds |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	bounds translateX: 5 Y: 10.
	self assert: bounds left equals: 15.
	self assert: bounds right equals: 35.
	self assert: bounds top equals: 30.
	self assert: bounds bottom equals: 50.
]

{ #category : 'tests' }
TbBoundsTest >> testWidth [
	| bounds |
	bounds := TbBounds left: 10 top: 20 right: 30 bottom: 40.
	self assert: bounds width equals: 20.
]
