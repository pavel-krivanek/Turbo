Class {
	#name : 'TbElementTest',
	#superclass : 'TestCase',
	#instVars : [
		'element'
	],
	#category : 'Turbo-Tests',
	#package : 'Turbo-Tests'
}

{ #category : 'system startup' }
TbElementTest >> setUp [ 

	element := TbElement new.
]

{ #category : 'system startup' }
TbElementTest >> testChildrenAreEmpty [

	self assert: element children isEmpty
]

{ #category : 'system startup' }
TbElementTest >> testElevation [ 

	self assert: element elevation equals: TbRelativeElevation zero
]

{ #category : 'system startup' }
TbElementTest >> testEmptyBorder [

	self assert: element border width equals: 0
]

{ #category : 'system startup' }
TbElementTest >> testEmptyBounds [ 

	self assert: element bounds position equals: 0@0	.
	self assert: element bounds extent equals: 0@0
]

{ #category : 'system startup' }
TbElementTest >> testEmptyMeasuredBounds [

	self assert: element measuredBounds position equals: 0@0.
	self assert: element measuredBounds extent equals: 0@0
]

{ #category : 'system startup' }
TbElementTest >> testParentIsNIl [

	self assert: element parent isNil
]

{ #category : 'system startup' }
TbElementTest >> testTransformationOwner [ 

	self assert: element transformation owner equals: element
]

{ #category : 'system startup' }
TbElementTest >> testVisibilityChange [

	| storedArgument |

	self assert: element isVisible.
	
	element visibilityProperty onChangedDo: [ :newValue |
		storedArgument := newValue  ].
	
	element visibility: TbVisibility hidden.
	self assert: storedArgument isHidden.
	self deny: element isVisible.
	
]
