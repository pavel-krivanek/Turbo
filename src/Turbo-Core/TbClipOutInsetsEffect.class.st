Class {
	#name : #TbClipOutInsetsEffect,
	#superclass : #TbClipOutEffect,
	#instVars : [
		'insets'
	],
	#category : #'Turbo-Core-Effect'
}

{ #category : #initialization }
TbClipOutInsetsEffect >> initialize [
	super initialize.
	
	insets := BlInsets empty
]

{ #category : #accessing }
TbClipOutInsetsEffect >> insets [
	<return: #BlInsets>

	^ insets
]

{ #category : #accessing }
TbClipOutInsetsEffect >> insets: aBlInsets [
	insets := aBlInsets
]
