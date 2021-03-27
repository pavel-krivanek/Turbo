Class {
	#name : #TbNCursesHost,
	#superclass : #TbHost,
	#instVars : [
		'isRunning',
		'lib',
		'win'
	],
	#category : #'Turbo-NCurses'
}

{ #category : #initialization }
TbNCursesHost >> characterExtent [

	^ 8@16
]

{ #category : #initialization }
TbNCursesHost >> createHostSpaceFor: aSpace [

	| aHostSpace|

	aHostSpace := TbNCursesHostSpace new. 
	aHostSpace host: self.
	aHostSpace space: aSpace.
	aHostSpace withTextBlocRenderer.

	aSpace hostSpace: aHostSpace.	
]

{ #category : #initialization }
TbNCursesHost >> destroyHostSpaceFor: aSpace [
	"Destroys host space window of a given space.
	Note: in most cases under 'destroy host space' we mean 'close host window' and unregister it"
	
	aSpace detachHostSpace
]

{ #category : #initialization }
TbNCursesHost >> initialize [
	super initialize.
	
	isRunning := false
]

{ #category : #initialization }
TbNCursesHost >> isRunning [
	"Return true if host is initialized and running"
	<return: #Boolean>

	^ isRunning
]

{ #category : #initialization }
TbNCursesHost >> start [
	isRunning := true.
	
	lib := NCursesLib uniqueInstance.
	win := lib initscr.
	
	lib bkgdset: ($  asInteger ).
	lib clear.
	lib refresh.
	
	lib print: 'press any key'.
]

{ #category : #initialization }
TbNCursesHost >> stop [
	isRunning := false.
	
	lib bkgdset: (Character space asInteger ).
	lib endwin.
]
