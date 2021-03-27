Class {
	#name : #SpTextBlocButtonAdapter,
	#superclass : #SpTextBlocAbstractAdapter,
	#category : #'Spec-TextBlocAdapters-Base'
}

{ #category : #protocol }
SpTextBlocButtonAdapter >> addModelTo: aButton [

	super addModelTo: aButton.
		
	self presenter label isEmptyOrNil ifFalse: [ self updateLabelFor: aButton ].
	self presenter whenLabelChangedDo: [ self updateLabelFor: aButton ].

	aButton state: self presenter state.
	self presenter whenStateChangedDo: [ :new | self presenter state: new ].

	aButton enabled: self presenter isEnabled.
	self presenter whenEnabledChangedDo: [ :new | self presenter enabled: new ].

	aButton icon: self presenter icon.
	self presenter whenIconChangedDo: [ :new | self presenter enabled: new ].


	aButton color: self presenter color.

	aButton clickBlock: [ self presenter action value ].
	
	
]

{ #category : #protocol }
SpTextBlocButtonAdapter >> getLabelText [

	^ self presenter label ifNotNil: [ :aString | aString localizedForPresenter: self presenter ]
]

{ #category : #protocol }
SpTextBlocButtonAdapter >> newWidget [ 

	^ SpTextBlocButtonWidget new.

]

{ #category : #protocol }
SpTextBlocButtonAdapter >> updateLabelFor: aWidget [

	aWidget label: self getLabelText.
	aWidget invalidate
]
