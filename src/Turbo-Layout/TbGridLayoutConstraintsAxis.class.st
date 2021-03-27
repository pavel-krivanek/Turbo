Class {
	#name : #TbGridLayoutConstraintsAxis,
	#superclass : #TbLayoutConstraintsAxis,
	#instVars : [
		'spec'
	],
	#category : #'Turbo-Layout-Grid'
}

{ #category : #alignment }
TbGridLayoutConstraintsAxis >> alignCenter [
	self subclassResponsibility
]

{ #category : #initialization }
TbGridLayoutConstraintsAxis >> defaultSpec [
	<return: #BlGridLayoutSpec>

	^ BlGridLayoutSpec undefined
]

{ #category : #initialization }
TbGridLayoutConstraintsAxis >> initialize [
	super initialize.
	
	spec := self defaultSpec
]

{ #category : #accessing }
TbGridLayoutConstraintsAxis >> span: aNumber [
	"Change how many cells (rows or columns) an element needs to take.
	if span is set to 0 grid will ignore space needs of that element
	which may result in overlapping with neighbor rows or columns.
	aNumber must be greater or equal to 0
	aNumber must not be nil"
	self assert: aNumber isNotNil.
	self assert: aNumber >= 0.

	self specSpan: (BlGridLayoutInterval min: self spec span min max: self spec span min + aNumber)
]

{ #category : #private }
TbGridLayoutConstraintsAxis >> spec [
	"Return child's axis specification.
	spec can not be nil"
	<return: #BlGridLayoutSpec>
	self
		assert: spec isNotNil
		description: [ 'Spec can not be nil' ].

	^ spec
]

{ #category : #private }
TbGridLayoutConstraintsAxis >> specAlignment: anAlignment [
	spec := self spec copyWithAlignment: anAlignment
]

{ #category : #private }
TbGridLayoutConstraintsAxis >> specSpan: aSpan [
	"aSpan is an instance of BlGridlLayoutInterval and must not be nil"
	self
		assert: aSpan isNotNil
		description: [ 'Span must not be nil' ].

	spec := spec copyWithSpan: aSpan
]

{ #category : #accessing }
TbGridLayoutConstraintsAxis >> weight: aNumber [
	"Set cell's weight along corresponding axis. Only positive
	weight (> 0) is taken into account. In order reset/disable
	flexible cell distribution set weight to 0.
	aNumber must be equal or greater than 0"
	self assert: aNumber isNotNil.
	self assert: aNumber >= 0.

	spec := self spec copyWithWeight: aNumber
]
