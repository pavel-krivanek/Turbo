Class {
	#name : 'TbTest',
	#superclass : 'TestCase',
	#instVars : [
		'space',
		'host',
		'universe'
	],
	#category : 'Turbo-Tests',
	#package : 'Turbo-Tests'
}

{ #category : 'running' }
TbTest >> content [

	^ space hostSpace content
]

{ #category : 'running' }
TbTest >> extent [ 

	^ 50@10
]

{ #category : 'running' }
TbTest >> firePulse [

	universe pulseLoop firePulse.

]

{ #category : 'running' }
TbTest >> setUp [

	space := TbSpace new.
	space extent: self extent.

	universe := TbUniverse new.
	universe pulseLoop: (TbPulseLoop2 new 
		universe: universe;
		yourself).

	host := TbTestingHost new.
	space host: host.
	universe spaceManager addSpace: space.

	space host createHostSpaceFor: space.
	space hostSpace windowExtent: self extent.

	space hostSpace show.

	space dispatchEvent: (TbSpaceShownEvent new space: universe).

]
