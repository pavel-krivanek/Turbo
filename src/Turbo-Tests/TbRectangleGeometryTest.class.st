Class {
	#name : 'TbRectangleGeometryTest',
	#superclass : 'TestCase',
	#category : 'Turbo-Tests-Basic',
	#package : 'Turbo-Tests',
	#tag : 'Basic'
}

{ #category : 'tests' }
TbRectangleGeometryTest >> testContainsPointInCorner [
	| geometry |
	geometry := TbRectangleGeometry new.
	geometry extent: 100@50.
	self assert: (geometry containsPoint: 10@10 in: TbElement new).

]

{ #category : 'tests' }
TbRectangleGeometryTest >> testContainsPointInRectangle [
	| geometry |
	geometry := TbRectangleGeometry new.
	geometry extent: 100@50.
	self assert: (geometry containsPoint: 50@25 in: TbElement new).
]

{ #category : 'tests' }
TbRectangleGeometryTest >> testContainsPointOutsideRectangle [
	| geometry |
	geometry := TbRectangleGeometry new.
	geometry extent: 100@50.
	self deny: (geometry containsPoint: 150@25 in: TbElement new).
]

{ #category : 'tests' }
TbRectangleGeometryTest >> testExtentInitialization [
	| geometry |
	geometry := TbRectangleGeometry new.
	self assert: geometry extent equals: 0@0.
]

{ #category : 'tests' }
TbRectangleGeometryTest >> testExtentSetting [
	| geometry |
	geometry := TbRectangleGeometry new.
	geometry extent: 100@50.
	self assert: geometry extent equals: 100@50.
]

{ #category : 'tests' }
TbRectangleGeometryTest >> testExtentSettingNegative [
	| geometry |
	geometry := TbRectangleGeometry new.
	self should: [ geometry extent: -10@50 ] raise: AssertionFailure.
]

{ #category : 'tests' }
TbRectangleGeometryTest >> testMatchExtent [
	| geometry |
	geometry := TbRectangleGeometry new.
	geometry matchExtent: 100@50.
	self assert: geometry extent equals: 100@50.
]

{ #category : 'tests' }
TbRectangleGeometryTest >> testStrokedBoundsCentered [
	| geometry element bounds |
	geometry := TbRectangleGeometry new.
	geometry extent: 100@50.
	element := TbElement new.
	element border: (TbBorder builder paint: Color gray; width: 2; build).
	bounds := geometry strokedBoundsCentered: TbBounds new of: element on: nil.
	self assert: bounds origin equals: -1 @ -1.
	self assert: bounds extent equals: 102@52.
]

{ #category : 'tests' }
TbRectangleGeometryTest >> testStrokedBoundsOutside [
	| geometry element bounds |
	geometry := TbRectangleGeometry new.
	geometry extent: 100@50.
	element := TbElement new.
	element border: (TbBorder builder paint: Color gray; width: 2; build).
	bounds := geometry strokedBoundsOutside: TbBounds new of: element on: nil.
	self assert: bounds origin equals: -2 @ -2.
	self assert: bounds extent equals: 104@54.
]
