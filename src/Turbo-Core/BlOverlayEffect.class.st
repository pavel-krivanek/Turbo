Class {
	#name : #BlOverlayEffect,
	#superclass : #BlElementEffect,
	#instVars : [
		'paint'
	],
	#category : #'Turbo-Core-Effect'
}

{ #category : #initialization }
BlOverlayEffect >> initialize [
	super initialize.
	
	paint := Color transparent
]

{ #category : #accessing }
BlOverlayEffect >> paint [
	^ paint
]

{ #category : #accessing }
BlOverlayEffect >> paint: anObject [
	paint := anObject
]
