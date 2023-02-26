Class {
	#name : #SpTurboWindowAdapter,
	#superclass : #SpTurboAbstractAdapter,
	#instVars : [
		'space',
		'universe',
		'host'
	],
	#category : #'Spec-Turbo-Base'
}

{ #category : #accessing }
SpTurboWindowAdapter >> addContent: aView toWindow: aSpecWindow [

	space root addChild: aView.

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

	space hostSpace morphicWindow close.
]

{ #category : #accessing }
SpTurboWindowAdapter >> initialize [

	super initialize.
	
	self initializeSpace.
]

{ #category : #accessing }
SpTurboWindowAdapter >> initializeSpace [

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
SpTurboWindowAdapter >> isDisplayed [ 

	^ true
]

{ #category : #accessing }
SpTurboWindowAdapter >> open [


]

{ #category : #accessing }
SpTurboWindowAdapter >> openWithDeferredAction: aBlock [

	aBlock value
]

{ #category : #accessing }
SpTurboWindowAdapter >> title: aString [
]
