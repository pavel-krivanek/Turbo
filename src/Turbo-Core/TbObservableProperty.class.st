"
I am the abstract class for properties that can be observed.
I manage a list of change listener and i notify it when my value changes.
My subclasses can define a specific behavior during invalidation.
"
Class {
	#name : #TbObservableProperty,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'name',
		'owner',
		'rawValue',
		'changeListeners',
		'isValid',
		'binding'
	],
	#category : #'Turbo-Core-Property'
}

{ #category : #'as yet unclassified' }
TbObservableProperty class >> on: anOwner [
	^ self new
		owner: anOwner;
		yourself
]

{ #category : #'as yet unclassified' }
TbObservableProperty class >> on: anOwner named: aSymbol [
	^ self new
		name: aSymbol;
		owner: anOwner;
		yourself
]

{ #category : #'change management' }
TbObservableProperty >> addChangeListener: aListener [

	self
		assert: [ (changeListeners includes: aListener) not ]
		description: [ 'Listener must not be already added!' ].

	changeListeners := changeListeners copyWith: aListener
]

{ #category : #binding }
TbObservableProperty >> bindOn: aProperty [
	self bindOn: aProperty bidirectional: false
]

{ #category : #binding }
TbObservableProperty >> bindOn: aProperty bidirectional: aBoolean [

	self unbind.
	binding := TbPropertyBinding from: aProperty to: self bidirectional: aBoolean
]

{ #category : #accessing }
TbObservableProperty >> defaultName [
	self subclassResponsibility  
]

{ #category : #'change management' }
TbObservableProperty >> hasChangeListeners [
	^ changeListeners isNotEmpty
]

{ #category : #'initialize-release' }
TbObservableProperty >> initialize [
	super initialize.
	changeListeners := #()
]

{ #category : #private }
TbObservableProperty >> invalidateDuring: aBlock [
	"Make sure that the change propagation is not active while executing the parameter."
	isValid ifFalse: [ ^ self ].
	isValid := false.
	aBlock ensure: [ isValid := true ]
]

{ #category : #'change management' }
TbObservableProperty >> invalidated [
	"nothing here. Hook for subclasses"
]

{ #category : #accessing }
TbObservableProperty >> name [
	^ name ifNil: [ name := self defaultName ]
]

{ #category : #accessing }
TbObservableProperty >> name: anObject [
	name := anObject
]

{ #category : #private }
TbObservableProperty >> notifyValueChanged [
	| theListeners aValue |
	self invalidated.
	
	"changeListeners is *immutable* array so there is no need to make a copy
	of existing listeners, we just need to store a reference to the array
	for the case if one of the listeners will be removed as the result of some action
	by any notified listener"
	theListeners := changeListeners.
	aValue := self value.
	theListeners do: [ :cl | cl valueChanged: aValue ]
]

{ #category : #'change management' }
TbObservableProperty >> onChangedDo: aBlock [
	self addChangeListener: (TbOnChangeListener do: aBlock)
]

{ #category : #accessing }
TbObservableProperty >> owner [
	^ owner
]

{ #category : #accessing }
TbObservableProperty >> owner: anObject [
	owner := anObject
]

{ #category : #printing }
TbObservableProperty >> printOn: aStream [
	aStream
		nextPutAll: self className;
		nextPut: $(;
		nextPutAll: 'name:';
		nextPutAll: self name;
		nextPutAll: ', value:';
		print: self rawValue;
		nextPut: $)
]

{ #category : #private }
TbObservableProperty >> rawValue [
	^ rawValue
]

{ #category : #private }
TbObservableProperty >> rawValue: anObject [
	rawValue := anObject
]

{ #category : #'change management' }
TbObservableProperty >> removeAllChangeListeners [
	changeListeners := #()
]

{ #category : #'change management' }
TbObservableProperty >> removeChangeListener: aListener [
	"Remove the argument from the list of listeners"

	self
		assert: [ (changeListeners includes: aListener) ]
		description: [ 'Listener must exist!' ].
	
	changeListeners := changeListeners copyWithout: aListener
]

{ #category : #binding }
TbObservableProperty >> unbind [
	binding ifNotNil: #unbind.
	binding := nil
]

{ #category : #accessing }
TbObservableProperty >> value [
	^ self rawValue
]
