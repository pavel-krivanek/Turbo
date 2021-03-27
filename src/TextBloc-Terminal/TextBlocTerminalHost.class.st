Class {
	#name : #TextBlocTerminalHost,
	#superclass : #BlHost,
	#instVars : [
		'isRunning',
		'lib',
		'win'
	],
	#category : #'TextBloc-Terminal'
}

{ #category : #initialization }
TextBlocTerminalHost >> characterExtent [

	^ 8@16
]

{ #category : #initialization }
TextBlocTerminalHost >> createHostSpaceFor: aSpace [

	| aHostSpace|

	aHostSpace := TextBlocTerminalHostSpace new. 
	aHostSpace host: self.
	aHostSpace space: aSpace.
	aHostSpace withTextBlocRenderer.

	aSpace hostSpace: aHostSpace.	
]

{ #category : #initialization }
TextBlocTerminalHost >> destroyHostSpaceFor: aSpace [
	"Destroys host space window of a given space.
	Note: in most cases under 'destroy host space' we mean 'close host window' and unregister it"
	
	aSpace detachHostSpace
]

{ #category : #initialization }
TextBlocTerminalHost >> initialize [
	super initialize.
	
	isRunning := false
]

{ #category : #initialization }
TextBlocTerminalHost >> isRunning [
	"Return true if host is initialized and running"
	<return: #Boolean>

	^ isRunning
]

{ #category : #initialization }
TextBlocTerminalHost >> start [
	isRunning := true.
	

]

{ #category : #initialization }
TextBlocTerminalHost >> stop [
	isRunning := false.
	
	
]
