Class {
	#name : #SpTextBlocWindowAdapter,
	#superclass : #SpTextBlocAbstractAdapter,
	#instVars : [
		'space',
		'universe',
		'host'
	],
	#category : #'Spec-Turbo-Base'
}

{ #category : #accessing }
SpTextBlocWindowAdapter >> addContent: aView toWindow: aSpecWindow [

	space root addChild: aView.

]

{ #category : #accessing }
SpTextBlocWindowAdapter >> addPresenterIn: widgetToBuild withSpecLayout: aSpec [

	self
		addContent: (self model presenter buildWithLayout: aSpec)
		toWindow: widgetToBuild
]

{ #category : #accessing }
SpTextBlocWindowAdapter >> buildWidget [

	^ SpStubWindowView new
]

{ #category : #accessing }
SpTextBlocWindowAdapter >> close [


]

{ #category : #accessing }
SpTextBlocWindowAdapter >> delete [

	space hostSpace morphicWindow close.
]

{ #category : #accessing }
SpTextBlocWindowAdapter >> initialize [

	super initialize.
	
	self initializeSpace.
]

{ #category : #accessing }
SpTextBlocWindowAdapter >> initializeSpace [

	space := TbSpace2 new.
	space extent: 80@25.
	space root size: 80@25.	
	
	universe := TbUniverse new.
	universe pulseLoop: (TbPulseLoop2 new 
		universe: universe;
		yourself).

	host := TbMorphicHost new.
	space host: host.
	universe spaceManager addSpace: space.

	space host createHostSpaceFor: space.
	space hostSpace show.
		
	universe start.
	space dispatchEvent: (TbSpaceShownEvent new space: universe).


]

{ #category : #accessing }
SpTextBlocWindowAdapter >> isDisplayed [ 

	^ true
]

{ #category : #accessing }
SpTextBlocWindowAdapter >> open [


]

{ #category : #accessing }
SpTextBlocWindowAdapter >> openWithDeferredAction: aBlock [

	aBlock value
]

{ #category : #accessing }
SpTextBlocWindowAdapter >> title: aString [
]
