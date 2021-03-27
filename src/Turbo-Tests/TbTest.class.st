Class {
	#name : #TbTest,
	#superclass : #TestCase,
	#instVars : [
		'space',
		'host',
		'universe'
	],
	#category : #'Turbo-Tests'
}

{ #category : #running }
TbTest >> content [

	^ space hostSpace content
]

{ #category : #running }
TbTest >> firePulse [

	universe pulseLoop firePulse.

]

{ #category : #running }
TbTest >> setUp [

	space := BlSpace new.
	space extent: 50@10.

	universe := BlUniverse new.
	universe pulseLoop: (TextBlocPulseLoop2 new 
		universe: universe;
		yourself).

	host := TextBlocTestingHost new.
	space host: host.
	universe spaceManager addSpace: space.

	space host createHostSpaceFor: space.
	space hostSpace show.

	space dispatchEvent: (BlSpaceShownEvent new space: universe).

]
