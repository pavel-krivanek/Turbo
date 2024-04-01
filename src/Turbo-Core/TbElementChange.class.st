"
I represent a single element property change.

I log all changes in a linked list in order to simplify debugging process
"
Class {
	#name : #TbElementChange,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'records',
		'hasActiveChanges',
		'previousValue'
	],
	#category : #'Turbo-Core-Basic-Changes'
}

{ #category : #notifying }
TbElementChange >> commitChange: anNewValue on: anElement [
	"Send an event letting element's event handlers know that a property changed.
	Should be done once"
	
	self subclassResponsibility
]

{ #category : #notifying }
TbElementChange >> commitOn: anElement [
	"Commit changes done to the given element if there are any"
	| lastValue |

	self hasActiveChanges
		ifFalse: [ ^ self ].

	lastValue := records last changedValue.

	(previousValue isNil or: [ (self compare: lastValue with: previousValue) not ])
		ifTrue: [
			records last beNotified.
			self commitChange: lastValue on: anElement ].

	previousValue := lastValue.
	hasActiveChanges := false
]

{ #category : #comparing }
TbElementChange >> compare: aNewValue with: anOldValue [
	"Return true if new value is equal (or close to) to new value"
	<return: #Boolean>
	
	^ self subclassResponsibility
]

{ #category : #printing }
TbElementChange >> gtDisplayOn: aStream [
	aStream nextPutAll: self name
]

{ #category : #testing }
TbElementChange >> hasActiveChanges [
	"Return true if there are any uncomitted changes, false otherwise"
	<return: #Boolean>
	
	^ hasActiveChanges
]

{ #category : #initialization }
TbElementChange >> initialize [
	super initialize.
	
	records := LinkedList new.
	hasActiveChanges := false
]

{ #category : #accessing }
TbElementChange >> name [
	"Return a change name, eg. `Position` or `Extent` to be used in various tools extensions"
	<return: #String>

	^ self subclassResponsibility
]

{ #category : #'instance creation' }
TbElementChange >> newChangeValue: anObject [

	^ TbBloc debugModeEnabled
		ifTrue: [ TbElementChangeRecordWithContext new changedValue: anObject; context: thisContext copyStack ]
		ifFalse: [ TbElementChangeRecord new changedValue: anObject ]
]

{ #category : #recording }
TbElementChange >> old: anOldValue new: aNewValue [
	self
		assert: [ records isEmpty or: [ records last changedValue = anOldValue ] ]
		description: [ 'Last recorded value must be equal to the old value that is being changed' ].
	self
		assert: [ anOldValue ~= aNewValue ]
		description: [ 'Old and new values must be different' ].

	self records
		ifEmpty: [ self records add: (self newChangeValue: anOldValue) ].

	self records add: (self newChangeValue: aNewValue).
	hasActiveChanges := true
]

{ #category : #accessing }
TbElementChange >> previousValue [
	"Return last comitted value or nil if it does not exist"
	<return: #Object or: nil>

	^ previousValue
]

{ #category : #printing }
TbElementChange >> printOn: aStream [
	aStream nextPutAll: self name, ' (older values on top)'
]

{ #category : #accessing }
TbElementChange >> records [
	"Return a collection of all change records.
	It is not guaranteed that records collection contains
	absolutely all changes done to the element"
	<return: #Collection of: #BlElementChangeRecord>

	^ records
]
