Class {
	#name : #TextBlocNCursesHost,
	#superclass : #BlHost,
	#instVars : [
		'isRunning',
		'lib',
		'win'
	],
	#category : #'TextBloc-NCurses'
}

{ #category : #initialization }
TextBlocNCursesHost >> characterExtent [

	^ 8@16
]

{ #category : #initialization }
TextBlocNCursesHost >> createHostSpaceFor: aSpace [

	| aHostSpace|

	aHostSpace := TextBlocNCursesHostSpace new. 
	aHostSpace host: self.
	aHostSpace space: aSpace.
	aHostSpace withTextBlocRenderer.

	aSpace hostSpace: aHostSpace.	
]

{ #category : #initialization }
TextBlocNCursesHost >> destroyHostSpaceFor: aSpace [
	"Destroys host space window of a given space.
	Note: in most cases under 'destroy host space' we mean 'close host window' and unregister it"
	
	aSpace detachHostSpace
]

{ #category : #initialization }
TextBlocNCursesHost >> initialize [
	super initialize.
	
	isRunning := false
]

{ #category : #initialization }
TextBlocNCursesHost >> isRunning [
	"Return true if host is initialized and running"
	<return: #Boolean>

	^ isRunning
]

{ #category : #initialization }
TextBlocNCursesHost >> start [
	isRunning := true.
	
	lib := NCursesLib uniqueInstance.
	win := lib initscr.
	
	lib bkgdset: ($  asInteger ).
	lib clear.
	lib refresh.
	
	lib print: 'press any key'.
]

{ #category : #initialization }
TextBlocNCursesHost >> stop [
	isRunning := false.
	
	lib bkgdset: (Character space asInteger ).
	lib endwin.
]
