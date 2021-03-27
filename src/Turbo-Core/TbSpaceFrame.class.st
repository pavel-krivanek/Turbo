"
! Frame model

I represent one space frame. There are usually 60 frames per seconds, which means that ideally frame should take less than 16ms to go through all phases.

The frame consists of three important phases
- event handling
- scheduled tasks processing / animation
- layout
- rendering
-idle

I know my currentPhase which is one of the registered phases.

The list of default phases is initialized in ${method:BlSpaceFrame>>#initializePhases}$
"
Class {
	#name : #TbSpaceFrame,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'phases',
		'currentPhaseLink'
	],
	#category : #'Turbo-Core-Space-Frame'
}

{ #category : #adding }
TbSpaceFrame >> addPhase: aFramePhase [
	self
		assert: [ aFramePhase isNotNil ]
		description: [ 'Frame phase must not be nil' ].

	self phases add: aFramePhase
]

{ #category : #adding }
TbSpaceFrame >> addPhases: aCollectonOfPhases [
	aCollectonOfPhases do: [ :aFramePhase | self addPhase: aFramePhase ]
]

{ #category : #accessing }
TbSpaceFrame >> currentPhase [
	<return: #BlSpaceFramePhase>

	self
		assert: [ currentPhaseLink isNotNil ]
		description: [ 'Current phase must not be nil' ].

	^ currentPhaseLink value
]

{ #category : #testing }
TbSpaceFrame >> hasNextPhase [
	<return: #Boolean>

	^ currentPhaseLink nextLink isNotNil
]

{ #category : #initialization }
TbSpaceFrame >> initialize [
	super initialize.

	phases := LinkedList new.
	self initializePhases.
	currentPhaseLink := phases firstLink
]

{ #category : #initialization }
TbSpaceFrame >> initializePhases [
	self addPhases: { 
		BlSpaceFrameIdlePhase new.
		BlSpaceFrameEventPhase new.
		BlSpaceFrameTaskPhase new.
		BlSpaceFrameLayoutPhase new.
		BlSpaceFrameDrawingPhase new }
]

{ #category : #accessing }
TbSpaceFrame >> nextPhase [
	"Return the next frame after the current one"
	<return: #BlSpaceFramePhase>
	
	^ self nextPhaseLink value
]

{ #category : #private }
TbSpaceFrame >> nextPhaseLink [
	"Return the link with a next frame after the current one"
	<return: #Link>

	^ self hasNextPhase
		ifTrue: [ currentPhaseLink nextLink ]
		ifFalse: [ phases firstLink ]
]

{ #category : #accessing }
TbSpaceFrame >> phases [
	"Return a collection of all phases"
	<return: #Collection of: #BlSpaceFramePhase>

	^ phases
]

{ #category : #running }
TbSpaceFrame >> runCurrentPhaseOn: aSpace [
	self currentPhase runOn: aSpace
]

{ #category : #running }
TbSpaceFrame >> runOn: aSpace [

	self runCurrentPhaseOn: aSpace.

	[ self hasNextPhase ] whileTrue: [
		self switchToNextPhase.
		self runCurrentPhaseOn: aSpace ].

	"move back to the first phase"
	self switchToNextPhase
]

{ #category : #running }
TbSpaceFrame >> switchToNextPhase [
	"Switch to the next phase"

	currentPhaseLink := self nextPhaseLink
]
