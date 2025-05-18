Class {
	#name : 'TbElementScrolledEvent',
	#superclass : 'TbElementEvent',
	#instVars : [
		'delta'
	],
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'instance creation' }
TbElementScrolledEvent class >> delta: aPoint [
	^ self new
		delta: aPoint;
		yourself
]

{ #category : 'accessing' }
TbElementScrolledEvent >> delta [
	<return: #Point>

	^ delta
]

{ #category : 'accessing' }
TbElementScrolledEvent >> delta: aPoint [
	delta := aPoint
]
