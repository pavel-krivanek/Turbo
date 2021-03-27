Class {
	#name : #TextBlocTest,
	#superclass : #TestCase,
	#instVars : [
		'space',
		'host',
		'universe'
	],
	#category : #'TextBloc-Tests'
}

{ #category : #running }
TextBlocTest >> content [

	^ space hostSpace content
]

{ #category : #running }
TextBlocTest >> firePulse [

	universe pulseLoop firePulse.

]

{ #category : #running }
TextBlocTest >> setUp [

	space := BlSpace new.
	space extent: 50@10.

	universe := BlUniverse new.
	universe pulseLoop: (TextBlocPulseLoop new 
		universe: universe;
		yourself).

	host := TextBlocTestingHost new.
	space host: host.
	universe spaceManager addSpace: space.

	space host createHostSpaceFor: space.
	space hostSpace show.

	space dispatchEvent: (BlSpaceShownEvent new space: universe).

]
