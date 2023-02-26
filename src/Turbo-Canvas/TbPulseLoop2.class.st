Class {
	#name : #TbPulseLoop2,
	#superclass : #TbPulseLoop,
	#instVars : [
		'universe'
	],
	#category : #'Turbo-Canvas'
}

{ #category : #accessing }
TbPulseLoop2 >> firePulse [
	pulseStartTime := DateAndTime now.
	self pulseEvent timestamp: pulseStartTime.
	universe firePulse: self pulseEvent.
	self wait.
	Processor yield
]

{ #category : #accessing }
TbPulseLoop2 >> universe [
	^ universe
]

{ #category : #accessing }
TbPulseLoop2 >> universe: anObject [
	universe := anObject
]
