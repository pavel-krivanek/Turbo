Class {
	#name : #TbRendererTerminalSurface,
	#superclass : #TbHostRendererSurface,
	#instVars : [
		'form'
	],
	#category : #'Turbo-Terminal'
}

{ #category : #testing }
TbRendererTerminalSurface class >> supportedBy: aClass [ 
	
	^ false
]

{ #category : #rendering }
TbRendererTerminalSurface >> at: aPoint put: aCharacter textColor: textColor backgroundColor: backgroundColor attributes: attributes [

	| term |
	
	term := TbVT100 stdout.

	term moveAt: aPoint.
	
	Stdio stdout nextPutAll: aCharacter asString utf8Encoded.
	Stdio stdout flush.
]

{ #category : #rendering }
TbRendererTerminalSurface >> form [

	^ form
]

{ #category : #initialization }
TbRendererTerminalSurface >> initializeOn: anObject [

	anObject initializeForForm: self


]

{ #category : #initialization }
TbRendererTerminalSurface >> initializeResourcesOn: aHostRenderer [
	"externalForm := BlExternalForm extent: self canvasExtent depth: 32.
	externalForm autoRelease.
	externalForm allocateSpace.
	externalForm fillColor: Color transparent.
"

	self initializeOn: aHostRenderer
]

{ #category : #rendering }
TbRendererTerminalSurface >> prepareToRender: aSpace [
	"Dispatch preparation to render through host space based on surface type"
	
	self hostSpace prepareToRender: aSpace onFormSurface: self
]

{ #category : #rendering }
TbRendererTerminalSurface >> renderFor: aSpace [
	"Dispatch render process through host space based on surface type"
	
	self hostSpace render: aSpace onFormSurface: self
]
