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
	
	e1 := TbFrameElement new.
	e1 size: 23@4.
	e2 := TbFrameElement new.
	e2 size: 20@6.
	e3 := TbHelloElement new.
	e3 size: 15@2.
	e3 relocate: 2@2.

	space := TbSpace new.
	space extent: 50@20.
	space root layout: TbFlowLayout new horizontal.
	space root relocate: 2@2.
	space root addChild: e1.
	space root addChild: e2.
	e2 addChild: e3.

	universe := TbUniverse new.
	universe pulseLoop: (TbPulseLoop2 new 
		universe: universe;
		yourself).

	host := TbVTEHost new.
	space host: host.
	universe spaceManager addSpace: space.

	space host createHostSpaceFor: space.
	space hostSpace show.

	universe start.
	space dispatchEvent: (TbSpaceShownEvent new space: universe).


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
