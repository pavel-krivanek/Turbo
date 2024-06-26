Class {
	#name : #SpTurboWindowAdapter,
	#superclass : #SpTurboAbstractAdapter,
	#category : #'Spec-Turbo-Base'
}

{ #category : #accessing }
SpTurboWindowAdapter >> addContent: aView toWindow: aSpecWindow [

	self widget addChild: aView.

]

{ #category : #accessing }
SpTurboWindowAdapter >> addPresenterIn: widgetToBuild withSpecLayout: aSpec [

	self
		addContent: (self model presenter buildWithLayout: aSpec)
		toWindow: widgetToBuild
]

{ #category : #accessing }
SpTurboWindowAdapter >> buildWidget [
	^ SpTurboWindowWidget new adapter: self
]

{ #category : #accessing }
SpTurboWindowAdapter >> close [


]

{ #category : #accessing }
SpTurboWindowAdapter >> delete [

	self space hostSpace morphicWindow close.
]

{ #category : #accessing }
SpTurboWindowAdapter >> initialize [

	super initialize.
]

{ #category : #accessing }
SpTurboWindowAdapter >> isDisplayed [ 

	^ true
]

{ #category : #accessing }
SpTurboWindowAdapter >> newWidget [ 

	^ SpTurboWindowWidget new adapter: self

]

{ #category : #accessing }
SpTurboWindowAdapter >> open [

]

{ #category : #accessing }
SpTurboWindowAdapter >> openWithDeferredAction: aBlock [

	self space root addChild: self widget.
	
	aBlock value
]

{ #category : #accessing }
SpTurboWindowAdapter >> space [ 

	^ self model application propertyAt: #turboSpace

]

{ #category : #accessing }
SpTurboWindowAdapter >> title: aString [
]
