Class {
	#name : #TbSpaceStepEvent,
	#superclass : #TbSpaceEvent,
	#instVars : [
		'start',
		'end'
	],
	#category : #'Turbo-Core-Events'
}

{ #category : #accessing }
TbSpaceStepEvent >> end [
	<return: #DateAndTime>

	^ end
]

{ #category : #accessing }
TbSpaceStepEvent >> end: aDateAndTime [
	end := aDateAndTime
]

{ #category : #accessing }
TbSpaceStepEvent >> start [
	<return: #DateAndTime>

	^ start
]

{ #category : #accessing }
TbSpaceStepEvent >> start: aDateAndTime [
	start := aDateAndTime
]
