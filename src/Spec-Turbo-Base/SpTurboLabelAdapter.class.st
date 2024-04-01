Class {
	#name : #SpTurboLabelAdapter,
	#superclass : #SpTurboAbstractAdapter,
	#category : #'Spec-Turbo-Base'
}

{ #category : #protocol }
SpTurboLabelAdapter >> addModelTo: aLabel [

	super addModelTo: aLabel.
	
	self model label isEmptyOrNil ifFalse: [ self updateLabelFor: aLabel ].
	self model whenLabelChangedDo: [ self updateLabelFor: aLabel ].
	
]

{ #category : #protocol }
SpTurboLabelAdapter >> getLabelText [

	^ self presenter label ifNotNil: [ :aString | aString localizedForPresenter: self presenter ]
]

{ #category : #protocol }
SpTurboLabelAdapter >> newWidget [ 

	^ SpTurboLabelWidget new.

]

{ #category : #protocol }
SpTurboLabelAdapter >> updateLabelFor: aWidget [

	aWidget label: self getLabelText.
	aWidget invalidate
]
