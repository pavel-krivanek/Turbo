Class {
	#name : 'TbGeometryResizerTest',
	#superclass : 'TestCase',
	#category : 'Turbo-Tests-Basic',
	#package : 'Turbo-Tests',
	#tag : 'Basic'
}

{ #category : 'tests' }
TbGeometryResizerTest >> testAdaptExactExtent [
	| resizer geometry element |
	resizer := TbGeometryResizer exact: 50@30.
	element := TbElement new size: 100@100.
	element forceLayout. "a hack to set the extent"
	geometry := TbRectangleGeometry new.
	resizer adapt: geometry to: element.
	self assert: geometry extent equals: 50@30.
]

{ #category : 'tests' }
TbGeometryResizerTest >> testAdaptExactExtentWithZero [
	| resizer geometry element |
	resizer := TbGeometryResizer exact: 0@0.
	element := TbElement new size: 100@100.
	element forceLayout. "a hack to set the extent"
	geometry := TbRectangleGeometry new.
	resizer adapt: geometry to: element.
	self assert: geometry extent equals: 0@0.
]

{ #category : 'tests' }
TbGeometryResizerTest >> testAdaptMatchExtent [
	| resizer geometry element |
	resizer := TbGeometryResizer match.
	element := TbElement new size: 100@100.
	element forceLayout. "a hack to set the extent"
	geometry := TbRectangleGeometry new.
	resizer adapt: geometry to: element.
	self assert: geometry extent equals: 100@100.
]

{ #category : 'tests' }
TbGeometryResizerTest >> testAdaptMatchExtentWithZero [
	| resizer geometry element |
	resizer := TbGeometryResizer match.
	element := TbElement new size: 0@0.
	element forceLayout. "a hack to set the extent"
	geometry := TbRectangleGeometry new.
	resizer adapt: geometry to: element.
	self assert: geometry extent equals: 0@0.
]
