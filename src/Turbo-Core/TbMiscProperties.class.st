Class {
	#name : 'TbMiscProperties',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'clipChildren',
		'focused',
		'mouseTransparent',
		'userData',
		'debug',
		'label'
	],
	#category : 'Turbo-Core-Basic-Support',
	#package : 'Turbo-Core',
	#tag : 'Basic-Support'
}

{ #category : 'accessing' }
TbMiscProperties >> clipChildren [
	^ clipChildren
]

{ #category : 'accessing' }
TbMiscProperties >> clipChildren: anObject [
	clipChildren := anObject
]

{ #category : 'accessing' }
TbMiscProperties >> debug [
	^ debug
]

{ #category : 'accessing' }
TbMiscProperties >> debug: aBoolean [
	debug := aBoolean
]

{ #category : 'accessing' }
TbMiscProperties >> focused [
	^ self focusedProperty value
]

{ #category : 'accessing' }
TbMiscProperties >> focused: anObject [
	self focusedProperty value: anObject
]

{ #category : 'accessing' }
TbMiscProperties >> focusedProperty [
	^ focused
		ifNil: [ focused := TbObjectProperty
				on: self
				named: #focused
				default: false ]
]

{ #category : 'initialization' }
TbMiscProperties >> initialize [
	super initialize.
	
	clipChildren := true.
	userData := IdentityDictionary new.
	debug := false.
	label := ''
]

{ #category : 'accessing' }
TbMiscProperties >> label [
	<return: #String>

	^ label
]

{ #category : 'accessing' }
TbMiscProperties >> label: aString [
	label := aString asString
]

{ #category : 'accessing' }
TbMiscProperties >> userData [
	^userData
]

{ #category : 'accessing' }
TbMiscProperties >> userData: aDict [
	userData := aDict
]
