Class {
	#name : #SpTextBlocTextInputFieldExample,
	#superclass : #SpTextPresenterExample,
	#instVars : [
		'field1',
		'field2',
		'field3'
	],
	#category : #'Spec-TextBloc-Examples'
}

{ #category : #specs }
SpTextBlocTextInputFieldExample class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: #field1;
		add: #field2;
		add: #field3.
]

{ #category : #specs }
SpTextBlocTextInputFieldExample class >> open [ 

	<script>
	^ super open
]

{ #category : #accessing }
SpTextBlocTextInputFieldExample >> field1 [
	^ field1
]

{ #category : #accessing }
SpTextBlocTextInputFieldExample >> field1: anObject [
	field1 := anObject
]

{ #category : #accessing }
SpTextBlocTextInputFieldExample >> field2 [
	^ field2
]

{ #category : #accessing }
SpTextBlocTextInputFieldExample >> field2: anObject [
	field2 := anObject
]

{ #category : #accessing }
SpTextBlocTextInputFieldExample >> field3 [
	^ field3
]

{ #category : #accessing }
SpTextBlocTextInputFieldExample >> field3: anObject [
	field3 := anObject
]

{ #category : #accessing }
SpTextBlocTextInputFieldExample >> initializePresenters [

	"field1 action: [ self inform: 'button 1 pressed'. field1 label: 'clicked'. ].
	field2 action: [ self inform: 'button 2 pressed' ].

	field3 action: [ self inform: 'button 3 pressed' ].
"
]

{ #category : #accessing }
SpTextBlocTextInputFieldExample >> initializeWidgets [ 

	field1 := self newTextInput.
	field2 := self newTextInput.
	field3 := self newTextInput.	

]
