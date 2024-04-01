Class {
	#name : #SpTurboButtonAdapter,
	#superclass : #SpTurboAbstractAdapter,
	#category : #'Spec-Turbo-Base'
}

{ #category : #protocol }
SpTurboButtonAdapter >> addModelTo: aButton [

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
SpTurboButtonAdapter >> getLabelText [

	^ self presenter label ifNotNil: [ :aString | aString localizedForPresenter: self presenter ]
]

{ #category : #protocol }
SpTurboButtonAdapter >> newWidget [ 

	^ SpTurboButtonWidget new.

]

{ #category : #protocol }
SpTurboButtonAdapter >> updateLabelFor: aWidget [

	aWidget label: self getLabelText.
	aWidget invalidate
]
