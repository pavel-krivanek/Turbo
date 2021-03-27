Class {
	#name : #TextBlocRendererTerminalSurface,
	#superclass : #BlHostRendererSurface,
	#instVars : [
		'form'
	],
	#category : #'TextBloc-Terminal'
}

{ #category : #testing }
TextBlocRendererTerminalSurface class >> supportedBy: aClass [ 
	
	^ false
]

{ #category : #rendering }
TextBlocRendererTerminalSurface >> at: aPoint put: aCharacter textColor: textColor backgroundColor: backgroundColor attributes: attributes [

	| term |
	
	term := TextBlocVT100 stdout.

	term moveAt: aPoint.
	
	Stdio stdout nextPutAll: aCharacter asString.
	Stdio stdout flush.
]

{ #category : #rendering }
TextBlocRendererTerminalSurface >> form [

	^ form
]

{ #category : #initialization }
TextBlocRendererTerminalSurface >> initializeOn: anObject [

	anObject initializeForForm: self


]

{ #category : #initialization }
TextBlocRendererTerminalSurface >> initializeResourcesOn: aHostRenderer [
	"externalForm := BlExternalForm extent: self canvasExtent depth: 32.
	externalForm autoRelease.
	externalForm allocateSpace.
	externalForm fillColor: Color transparent.
"

	self initializeOn: aHostRenderer
]

{ #category : #rendering }
TextBlocRendererTerminalSurface >> prepareToRender: aSpace [
	"Dispatch preparation to render through host space based on surface type"
	
	self hostSpace prepareToRender: aSpace onFormSurface: self
]

{ #category : #rendering }
TextBlocRendererTerminalSurface >> renderFor: aSpace [
	"Dispatch render process through host space based on surface type"
	
	self hostSpace render: aSpace onFormSurface: self
]
