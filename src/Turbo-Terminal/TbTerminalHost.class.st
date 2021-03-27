Class {
	#name : #TbTerminalHost,
	#superclass : #TbHost,
	#instVars : [
		'isRunning',
		'lib',
		'win'
	],
	#category : #'Turbo-Terminal'
}

{ #category : #initialization }
TbTerminalHost >> characterExtent [

	^ 8@16
]

{ #category : #initialization }
TbTerminalHost >> createHostSpaceFor: aSpace [

	| aHostSpace|

	aHostSpace := TextBlocTerminalHostSpace new. 
	aHostSpace host: self.
	aHostSpace space: aSpace.
	aHostSpace withTextBlocRenderer.

	aSpace hostSpace: aHostSpace.	
]

{ #category : #initialization }
TbTerminalHost >> destroyHostSpaceFor: aSpace [
	"Destroys host space window of a given space.
	Note: in most cases under 'destroy host space' we mean 'close host window' and unregister it"
	
	aSpace detachHostSpace
]

{ #category : #initialization }
TbTerminalHost >> initialize [
	super initialize.
	
	isRunning := false
]

{ #category : #initialization }
TbTerminalHost >> isRunning [
	"Return true if host is initialized and running"
	<return: #Boolean>

	^ isRunning
]

{ #category : #initialization }
TbTerminalHost >> start [
	isRunning := true.
	

]

{ #category : #initialization }
TbTerminalHost >> stop [
	isRunning := false.
	
	
]
