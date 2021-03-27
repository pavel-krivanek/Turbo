Class {
	#name : #TextBlocMorphicHost,
	#superclass : #BlHost,
	#instVars : [
		'isRunning'
	],
	#category : #'TextBloc-Morphic'
}

{ #category : #initialization }
TextBlocMorphicHost >> characterExtent [

	^ 8@16
]

{ #category : #initialization }
TextBlocMorphicHost >> createHostSpaceFor: aSpace [

	| aWindow aHostSpace|

	aWindow := self createMorphicWindowFor: aSpace.
	aHostSpace := TextBlocMorphicHostSpace new. 
	aHostSpace morphicWindow: aWindow. 
	aHostSpace host: self.
	aHostSpace space: aSpace.
	aHostSpace withTextBlocRenderer.

	aSpace hostSpace: aHostSpace.
	
	"Create and assign a new morphic host space for given bloc space"
	
]

{ #category : #initialization }
TextBlocMorphicHost >> createMorphicWindowFor: aSpace [
	"Note, that I use given space only to find out what window properties to use for created window.
	I do not create any strong or weak references to provided space"
	| aWindow |

	aWindow := TextBlocMorphicWindow new.
	aWindow spaceExtent: aSpace extent * self characterExtent.
	"aWindow borderless: aSpace borderless."

	^ aWindow
]

{ #category : #initialization }
TextBlocMorphicHost >> destroyHostSpaceFor: aSpace [
	"Destroys host space window of a given space.
	Note: in most cases under 'destroy host space' we mean 'close host window' and unregister it"
	
	aSpace detachHostSpace
]

{ #category : #initialization }
TextBlocMorphicHost >> initialize [
	super initialize.
	
	isRunning := false
]

{ #category : #initialization }
TextBlocMorphicHost >> isRunning [
	"Return true if host is initialized and running"
	<return: #Boolean>

	^ isRunning
]

{ #category : #initialization }
TextBlocMorphicHost >> start [
	isRunning := true
]

{ #category : #initialization }
TextBlocMorphicHost >> stop [
	isRunning := false
]
