Class {
	#name : 'TbOverlayEffect',
	#superclass : 'TbElementEffect',
	#instVars : [
		'paint'
	],
	#category : 'Turbo-Core-Effect',
	#package : 'Turbo-Core',
	#tag : 'Effect'
}

{ #category : 'initialization' }
TbOverlayEffect >> initialize [
	super initialize.
	
	paint := Color transparent
]

{ #category : 'accessing' }
TbOverlayEffect >> paint [
	^ paint
]

{ #category : 'accessing' }
TbOverlayEffect >> paint: anObject [
	paint := anObject
]
