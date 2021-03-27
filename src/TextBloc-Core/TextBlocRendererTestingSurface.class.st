Class {
	#name : #TextBlocRendererTestingSurface,
	#superclass : #BlHostRendererSurface,
	#instVars : [
		'displayMatrix'
	],
	#category : #'TextBloc-Core-Testing'
}

{ #category : #testing }
TextBlocRendererTestingSurface class >> supportedBy: aClass [ 
	
	^ false
]

{ #category : #rendering }
TextBlocRendererTestingSurface >> at: aPoint put: aCharacter [
 
	(displayMatrix at: aPoint y) at: aPoint x put: aCharacter.
	
]

{ #category : #rendering }
TextBlocRendererTestingSurface >> at: aPoint put: aCharacter textColor: textColor backgroundColor: backgroundColor attributes: attributes [

	^ self at: aPoint put: aCharacter 
]

{ #category : #initialization }
TextBlocRendererTestingSurface >> displayMatrix [

	^ displayMatrix
]

{ #category : #initialization }
TextBlocRendererTestingSurface >> initializeOn: anObject [

	anObject initializeForForm: self


]

{ #category : #initialization }
TextBlocRendererTestingSurface >> initializeResourcesOn: aHostRenderer [

	| hostMatrix |
	
	hostMatrix := self hostSpace displayMatrix.

	displayMatrix := (1 to: hostMatrix size) collect: [ :y |
		(1 to: hostMatrix anyOne size) collect: [ :x | $. ] ].
		
	self initializeOn: aHostRenderer
]

{ #category : #rendering }
TextBlocRendererTestingSurface >> prepareToRender: aSpace [
	"Dispatch preparation to render through host space based on surface type"
	
	self hostSpace prepareToRender: aSpace onFormSurface: self
]

{ #category : #rendering }
TextBlocRendererTestingSurface >> renderFor: aSpace [
	"Dispatch render process through host space based on surface type"
	
	self hostSpace render: aSpace onFormSurface: self
]
