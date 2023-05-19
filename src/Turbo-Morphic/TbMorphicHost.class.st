Class {
	#name : #TbMorphicHost,
	#superclass : #TbHost,
	#instVars : [
		'isRunning'
	],
	#category : #'Turbo-Morphic'
}

{ #category : #cleaning }
TbMorphicHost class >> clean [ 

	<script>

	Process allSubInstances select: [ :each | each name = 'Turbo Main Loop' ] thenDo: [ :each | each terminate ]
]

{ #category : #initialization }
TbMorphicHost >> characterExtent [

	^ 8@16
]

{ #category : #initialization }
TbMorphicHost >> createHostSpaceFor: aSpace [

	| aWindow aHostSpace|

	aWindow := self createMorphicWindowFor: aSpace.
	aHostSpace := TbMorphicHostSpace new. 
	aHostSpace morphicWindow: aWindow. 
	aHostSpace host: self.
	aHostSpace space: aSpace.
	aHostSpace withTurboRenderer.

	aSpace hostSpace: aHostSpace.
	
	"Create and assign a new morphic host space for given bloc space"
	
]

{ #category : #initialization }
TbMorphicHost >> createMorphicWindowFor: aSpace [
	"Note, that I use given space only to find out what window properties to use for created window.
	I do not create any strong or weak references to provided space"
	| aWindow |

	aWindow := TbMorphicWindow new.
	aWindow spaceExtent: aSpace extent * self characterExtent.
	"aWindow borderless: aSpace borderless."

	^ aWindow
]

{ #category : #initialization }
TbMorphicHost >> destroyHostSpaceFor: aSpace [
	"Destroys host space window of a given space.
	Note: in most cases under 'destroy host space' we mean 'close host window' and unregister it"
	
	aSpace detachHostSpace
]

{ #category : #initialization }
TbMorphicHost >> initialize [
	super initialize.
	
	isRunning := false
]

{ #category : #initialization }
TbMorphicHost >> isRunning [
	"Return true if host is initialized and running"
	<return: #Boolean>

	^ isRunning
]

{ #category : #initialization }
TbMorphicHost >> start [
	isRunning := true
]

{ #category : #initialization }
TbMorphicHost >> stop [
	isRunning := false
]
