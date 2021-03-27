Class {
	#name : #TbVTEHost,
	#superclass : #TbHost,
	#instVars : [
		'isRunning',
		'lib',
		'win'
	],
	#category : #'Turbo-VTE'
}

{ #category : #example }
TbVTEHost class >> example [ 

	<script>
	
	| e1 e2 e3 space universe host |
	
	e1 := TextBlocFrameElement new.
	e1 size: 23@4.
	e2 := TextBlocFrameElement new.
	e2 size: 20@6.
	e3 := TextBlocHelloElement new.
	e3 size: 15@2.
	e3 relocate: 2@2.

	space := BlSpace new.
	space extent: 50@20.
	space root layout: BlFlowLayout new horizontal.
	space root relocate: 2@2.
	space root addChild: e1.
	space root addChild: e2.
	e2 addChild: e3.

	universe := BlUniverse new.
	universe pulseLoop: (TextBlocPulseLoop2 new 
		universe: universe;
		yourself).

	host := TextBlocVTEHost new.
	space host: host.
	universe spaceManager addSpace: space.

	space host createHostSpaceFor: space.
	space hostSpace show.

	universe start.
	space dispatchEvent: (BlSpaceShownEvent new space: universe).


]

{ #category : #initialization }
TbVTEHost >> characterExtent [

	^ 8@16
]

{ #category : #initialization }
TbVTEHost >> createHostSpaceFor: aSpace [

	| aHostSpace|

	aHostSpace := TextBlocVTEHostSpace new. 
	aHostSpace host: self.
	aHostSpace space: aSpace.
	aHostSpace withTextBlocRenderer.

	aSpace hostSpace: aHostSpace.	
]

{ #category : #initialization }
TbVTEHost >> destroyHostSpaceFor: aSpace [
	"Destroys host space window of a given space.
	Note: in most cases under 'destroy host space' we mean 'close host window' and unregister it"
	
	aSpace detachHostSpace
]

{ #category : #initialization }
TbVTEHost >> initialize [
	super initialize.
	
	isRunning := false
]

{ #category : #initialization }
TbVTEHost >> isRunning [
	"Return true if host is initialized and running"
	<return: #Boolean>

	^ isRunning
]

{ #category : #initialization }
TbVTEHost >> start [
	isRunning := true.
	

]

{ #category : #initialization }
TbVTEHost >> stop [
	isRunning := false.
	
	
]
