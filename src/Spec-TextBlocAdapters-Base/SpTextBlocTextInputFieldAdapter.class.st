Class {
	#name : #SpTextBlocTextInputFieldAdapter,
	#superclass : #SpTextBlocTextAdapter,
	#category : #'Spec-TextBlocAdapters-Base'
}

{ #category : #protocol }
SpTextBlocTextInputFieldAdapter >> addModelTo: inputField [

	super addModelTo: inputField.
		
	self model text isEmptyOrNil ifFalse: [ self updateTextFor: inputField ].
	self model whenTextChangedDo: [ self updateTextFor: inputField ].
	inputField acceptBlock: [ self model text: inputField text ].

	inputField enabled: self model isEnabled.
	self model whenEnabledChangedDo: [ :new | self model enabled: new ].
	
	
	
]

{ #category : #protocol }
SpTextBlocTextInputFieldAdapter >> newWidget [ 

	^ SpTextBlocTextInputField new.

]

{ #category : #protocol }
SpTextBlocTextInputFieldAdapter >> updateLabelFor: aWidget [

	aWidget label: (self model label).
	aWidget invalidate
]

{ #category : #protocol }
SpTextBlocTextInputFieldAdapter >> updateTextFor: aWidget [

	aWidget text: (self model text).
	aWidget invalidate
]
