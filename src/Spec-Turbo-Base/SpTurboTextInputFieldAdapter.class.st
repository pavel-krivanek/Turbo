Class {
	#name : #SpTurboTextInputFieldAdapter,
	#superclass : #SpTurboTextAdapter,
	#category : #'Spec-Turbo-Base'
}

{ #category : #protocol }
SpTurboTextInputFieldAdapter >> addModelTo: inputField [

	super addModelTo: inputField.
		
	self model text isEmptyOrNil ifFalse: [ self updateTextFor: inputField ].
	self model whenTextChangedDo: [ self updateTextFor: inputField ].
	inputField acceptBlock: [ self model text: inputField text ].

	inputField enabled: self model isEnabled.
	self model whenEnabledChangedDo: [ :new | self model enabled: new ].
	
	
	
]

{ #category : #protocol }
SpTurboTextInputFieldAdapter >> newWidget [ 

	^ SpTurboTextInputField new.

]

{ #category : #protocol }
SpTurboTextInputFieldAdapter >> updateLabelFor: aWidget [

	aWidget label: (self model label).
	aWidget invalidate
]

{ #category : #protocol }
SpTurboTextInputFieldAdapter >> updateTextFor: aWidget [

	aWidget text: (self model text).
	aWidget invalidate
]
