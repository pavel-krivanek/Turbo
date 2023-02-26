Class {
	#name : #TbPropertyBinding,
	#superclass : #Object,
	#instVars : [
		'from',
		'to',
		'fromListener',
		'toListener'
	],
	#category : #'Turbo-Core-Property'
}

{ #category : #'as yet unclassified' }
TbPropertyBinding class >> from: aFromProperty to: aToProperty [
	^ self new
		from: aFromProperty to: aToProperty;
		yourself
]

{ #category : #'as yet unclassified' }
TbPropertyBinding class >> from: aFromProperty to: aToProperty bidirectional: aBoolean [
	^ self new
		from: aFromProperty to: aToProperty bidirectional: aBoolean;
		yourself
]

{ #category : #accessing }
TbPropertyBinding >> from [
	^ from
]

{ #category : #accessing }
TbPropertyBinding >> from: aFromProperty to: aToProperty [
	self from: aFromProperty to: aToProperty bidirectional: false
]

{ #category : #'bind/unbind' }
TbPropertyBinding >> from: aFromProperty to: aToProperty bidirectional: isBidirectional [
	
	from := aFromProperty.
	to := aToProperty.
	
	fromListener := TbOnChangeListener do: [ :v | to value: v ].
	from addChangeListener: fromListener.

	isBidirectional
		ifFalse: [ ^ self ].

	toListener := TbOnChangeListener do: [ :v | from value: v ].
	to addChangeListener: toListener
]

{ #category : #accessing }
TbPropertyBinding >> to [
	^ to
]

{ #category : #'bind/unbind' }
TbPropertyBinding >> unbind [
	toListener ifNotNil: [ to removeChangeListener: toListener ].
	fromListener ifNotNil: [ from removeChangeListener: fromListener ].
	to := from := toListener := fromListener := nil
]
