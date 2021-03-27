"
I am a special case of transparent background.
It is recommended to refer my unique instance since I am stateless and my superclass is immutable
"
Class {
	#name : #TbTransparentBackground,
	#superclass : #TbBackground,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Turbo-Core-Basic-Background'
}

{ #category : #cleanup }
TbTransparentBackground class >> cleanUp [
	super cleanUp.
	
	uniqueInstance := nil
]

{ #category : #accessing }
TbTransparentBackground class >> uniqueInstance [
	"Return a unique instance of transparent backgrond.
	It is preferable to use unique instance than create a new every time"
	<return: #BlBackground>

	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #testing }
TbTransparentBackground >> isTransparent [
	"I am transparent by definition"
	<return: #Boolean>
	
	^ true
]

{ #category : #geometry }
TbTransparentBackground >> matchExtent: anExtent [
	"Do nothing for the transparent background"
]
