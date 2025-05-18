Class {
	#name : 'TbImageBackgroundBuilder',
	#superclass : 'TbBackgroundBuilder',
	#instVars : [
		'form'
	],
	#category : 'Turbo-Core-Basic-Background',
	#package : 'Turbo-Core',
	#tag : 'Basic-Background'
}

{ #category : 'building' }
TbImageBackgroundBuilder >> build [
	<return: #BlBackground>

	^ (TbImageBackground image: self form) opacity: self opacity
]

{ #category : 'accessing' }
TbImageBackgroundBuilder >> form [
	<return: #Form>

	^ form
]

{ #category : 'accessing' }
TbImageBackgroundBuilder >> form: aForm [
	form := aForm
]

{ #category : 'accessing' }
TbImageBackgroundBuilder >> iconNamed: aSymbol [
	self form: (Smalltalk ui icons iconNamed: aSymbol)
]
