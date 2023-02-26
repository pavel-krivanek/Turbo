Class {
	#name : #TbBlurEffect,
	#superclass : #TbElementEffect,
	#instVars : [
		'radius'
	],
	#category : #'Turbo-Core-Effect'
}

{ #category : #accessing }
TbBlurEffect class >> radius: aNumber [
	^ self new
		radius: aNumber;
		yourself
]

{ #category : #accessing }
TbBlurEffect >> radius [
	^ radius
]

{ #category : #accessing }
TbBlurEffect >> radius: aNumber [
	"Set standart deviation of gaussian blur"
	radius := aNumber
]
