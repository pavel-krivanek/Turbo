"
I am a fallback host that is chosen if there are no other available and supported hosts.
"
Class {
	#name : #TbHeadlessHost,
	#superclass : #TbHost,
	#instVars : [
		'isRunning'
	],
	#category : #'Turbo-Core-Universe'
}

{ #category : #'driver selection' }
TbHeadlessHost class >> label [
	^ 'Null'
]

{ #category : #'driver selection' }
TbHeadlessHost class >> priority [
	"Infinite priority means that I am selected only if there are no other available hosts"
	<return: #Number>
	
	^ Float infinity
]

{ #category : #api }
TbHeadlessHost >> createHostSpaceFor: aSpace [

	aSpace hostSpace: (TbHeadlessHostSpace new host: self)
]

{ #category : #api }
TbHeadlessHost >> destroyHostSpaceFor: aSpace [
	aSpace detachHostSpace
]

{ #category : #initialization }
TbHeadlessHost >> initialize [
	super initialize.
	
	isRunning := false
]

{ #category : #api }
TbHeadlessHost >> isRunning [
	^ isRunning
]

{ #category : #api }
TbHeadlessHost >> start [
	isRunning := true
]

{ #category : #api }
TbHeadlessHost >> stop [
	isRunning := false
]
