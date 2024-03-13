Class {
	#name : #SpTurboWindowAdapter,
	#superclass : #SpTurboAbstractAdapter,
	#category : #'Spec-Turbo-Base'
}

{ #category : #accessing }
SpTurboWindowAdapter >> addContent: aView toWindow: aSpecWindow [

	self space root addChild: aView.

]

{ #category : #accessing }
SpTurboWindowAdapter >> addPresenterIn: widgetToBuild withSpecLayout: aSpec [

	self
		addContent: (self model presenter buildWithLayout: aSpec)
		toWindow: widgetToBuild
]

{ #category : #accessing }
SpTurboWindowAdapter >> buildWidget [

	^ SpStubWindowView new
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

	^ SpTurboWindowWidget new.

]

{ #category : #accessing }
SpTurboWindowAdapter >> open [


]

{ #category : #accessing }
SpTurboWindowAdapter >> openWithDeferredAction: aBlock [

	aBlock value
]

{ #category : #accessing }
SpTurboWindowAdapter >> space [ 

	^ self model application propertyAt: #turboSpace

]

{ #category : #accessing }
SpTurboWindowAdapter >> title: aString [
]
