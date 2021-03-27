Class {
	#name : #TextBlocPulseLoop,
	#superclass : #TbPulseLoop,
	#instVars : [
		'universe'
	],
	#category : #'Turbo-Canvas'
}

{ #category : #accessing }
TextBlocPulseLoop >> firePulse [
	pulseStartTime := DateAndTime now.
	self pulseEvent timestamp: pulseStartTime.
	universe firePulse: self pulseEvent.
	self wait.
	Processor yield
]

{ #category : #accessing }
TextBlocPulseLoop >> universe [
	^ universe
]

{ #category : #accessing }
TextBlocPulseLoop >> universe: anObject [
	universe := anObject
]
