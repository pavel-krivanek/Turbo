"
element := BlElement new.

space := BlSpace new.
space extent: 50@50.
space root addChild: element.

universe := BlUniverse new.
universe pulseLoop: (CustomPulseLoop new 
	universe: universe;
	yourself).

host := TextBlocTestingHost new.
space host: host.
universe spaceManager addSpace: space.

space host createHostSpaceFor: space.
space hostSpace show.

space dispatchEvent: (BlSpaceShownEvent new space: universe).
universe pulseLoop firePulse.
""universe start.""

space hostSpace content
"
Class {
	#name : #TextBlocTestingHost,
	#superclass : #BlHost,
	#instVars : [
		'isRunning'
	],
	#category : #'TextBloc-Core-Testing'
}

{ #category : #initialization }
TextBlocTestingHost >> createHostSpaceFor: aSpace [

	| aHostSpace|

	aHostSpace := TextBlocTestingHostSpace new. 
	aHostSpace host: self.
	aHostSpace space: aSpace.
	aHostSpace createDisplayMatrix. "maybe not the best place here"
	aHostSpace withTextBlocRenderer.

	aSpace hostSpace: aHostSpace.
	
	"Create and assign a new morphic host space for given bloc space"
	
]

{ #category : #initialization }
TextBlocTestingHost >> destroyHostSpaceFor: aSpace [
	"Destroys host space window of a given space.
	Note: in most cases under 'destroy host space' we mean 'close host window' and unregister it"
	
	aSpace detachHostSpace
]

{ #category : #initialization }
TextBlocTestingHost >> initialize [
	super initialize.
	
	isRunning := false
]

{ #category : #initialization }
TextBlocTestingHost >> isRunning [
	"Return true if host is initialized and running"
	<return: #Boolean>

	^ isRunning
]

{ #category : #initialization }
TextBlocTestingHost >> start [
	isRunning := true
]

{ #category : #initialization }
TextBlocTestingHost >> stop [
	isRunning := false
]
