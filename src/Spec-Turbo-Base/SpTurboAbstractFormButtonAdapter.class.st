Class {
	#name : #SpTurboAbstractFormButtonAdapter,
	#superclass : #SpTurboAbstractAdapter,
	#category : #'Spec-Turbo-Base'
}

{ #category : #protocol }
SpTurboAbstractFormButtonAdapter >> addModelTo: aFormButton [

	super addModelTo: aFormButton.
		
	aFormButton state: self presenter state.

	self presenter label isEmptyOrNil ifFalse: [ self updateLabelFor: aFormButton ].
	self presenter whenLabelChangedDo: [ self updateLabelFor: aFormButton ].


	aFormButton clickBlock: [
		self backendUpdatingDo: [ self updatePresenterState ] ].
	self presenter whenChangedDo: [
		self backendDetectCyclesDo: [ self updateWidgetState ] ].
	
	aFormButton clickBlock: [
		self presenter state: self model state not ].
	
]

{ #category : #protocol }
SpTurboAbstractFormButtonAdapter >> getLabelText [

	^ self presenter label ifNotNil: [ :aString | aString localizedForPresenter: self presenter ]
]

{ #category : #protocol }
SpTurboAbstractFormButtonAdapter >> state [
	
	^ widget state
]

{ #category : #protocol }
SpTurboAbstractFormButtonAdapter >> updateLabelFor: aWidget [

	aWidget label: self getLabelText.
	aWidget invalidate
]

{ #category : #protocol }
SpTurboAbstractFormButtonAdapter >> updatePresenterState [
	
	self presenter state: self state
]

{ #category : #protocol }
SpTurboAbstractFormButtonAdapter >> updateWidgetState [

	self widgetDo: [ :w | 
		self presenter state = w state
			ifFalse: [ 
				w state: self presenter state.
				w invalidate ] ]
]
