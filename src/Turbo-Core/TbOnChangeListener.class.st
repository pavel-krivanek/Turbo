"
I am a scriptable version of my parent.
You can use my class method #do:[:newValue|] to define your own action as a block.
"
Class {
	#name : 'TbOnChangeListener',
	#superclass : 'TbChangeListener',
	#instVars : [
		'action'
	],
	#category : 'Turbo-Core-Property',
	#package : 'Turbo-Core',
	#tag : 'Property'
}

{ #category : 'as yet unclassified' }
TbOnChangeListener class >> do: aBlock [
	^ self new
		action: aBlock;
		yourself
]

{ #category : 'accessing' }
TbOnChangeListener >> action [
	<return: #BlockClosure>

	^ action
]

{ #category : 'accessing' }
TbOnChangeListener >> action: aBlock [
	action := aBlock
]

{ #category : 'changes' }
TbOnChangeListener >> valueChanged: aValue [
	self action cull: aValue
]
