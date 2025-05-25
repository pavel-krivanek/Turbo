Class {
	#name : 'TbFlowLayoutFloatingChild',
	#superclass : 'TbFlowLayoutChild',
	#instVars : [
		'lines'
	],
	#category : 'Turbo-Layout-Flow-Utilities',
	#package : 'Turbo-Layout',
	#tag : 'Flow-Utilities'
}

{ #category : 'adding' }
TbFlowLayoutFloatingChild >> addToLine: aLine [
	
	"Only add me to the first line"
	self lines ifEmpty: [ 
		(self orientation isHorizontal and: [ self direction isRightToLeft ])
			ifTrue: [ aLine addFloatFirst: self ]
			ifFalse: [ aLine addFloatLast: self ] ].
	lines add: aLine
]

{ #category : 'geometry' }
TbFlowLayoutFloatingChild >> excessBreadth [
	^ self totalBreadth - (self lines inject: 0 into: [ :aTotalBreadth :aLine | aTotalBreadth + aLine breadth ] )
]

{ #category : 'initialization' }
TbFlowLayoutFloatingChild >> initialize [
	super initialize.
	
	lines := OrderedCollection new
]

{ #category : 'accessing' }
TbFlowLayoutFloatingChild >> lastLine [
	^ lines last
]

{ #category : 'accessing' }
TbFlowLayoutFloatingChild >> lines [
	^ lines
]
