"
I represent layout constraints and I am a superclass of all layout constraints.

Layouts that require additional properties must subclass be and add an extension method to ===BlLayoutCommonConstraints===

Since some constraints are also axis dependent (horizontal or vertical) I provide access to them through #horizontal and #vertical.

See ===BlLayoutConstraintsAxis=== to learn more about axis-dependent constraints
"
Class {
	#name : #TbLayoutConstraints,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'vertical',
		'horizontal'
	],
	#category : #'Turbo-Core-Layouts-Basic'
}

{ #category : #initialization }
TbLayoutConstraints >> defaultHorizontal [
	^ BlLayoutConstraintsAxis new
]

{ #category : #initialization }
TbLayoutConstraints >> defaultVertical [
	^ BlLayoutConstraintsAxis new
]

{ #category : #accessing }
TbLayoutConstraints >> horizontal [
	"Return horizontal-axis specific constraints.
	horizontal constraints can not be nil"
	<return: #BlLayoutConstraintsAxis>

	^ horizontal
]

{ #category : #initialization }
TbLayoutConstraints >> initialize [
	super initialize.
	
	horizontal := self defaultHorizontal.
	vertical := self defaultVertical
]

{ #category : #accessing }
TbLayoutConstraints >> vertical [
	"Return vertical-axis specific constraints.
	vertical constraints can not be nil"
	<return: #BlLayoutConstraintsAxis>

	^ vertical
]
