Class {
	#name : #TextBlocRendererNCursesSurface,
	#superclass : #BlHostRendererSurface,
	#instVars : [
		'form'
	],
	#category : #'TextBloc-NCurses'
}

{ #category : #testing }
TextBlocRendererNCursesSurface class >> supportedBy: aClass [ 
	
	^ false
]

{ #category : #rendering }
TextBlocRendererNCursesSurface >> at: aPoint put: aCharacter textColor: textColor backgroundColor: backgroundColor attributes: attributes [

	| lib localWin |
	
	lib := NCursesLib uniqueInstance.

	localWin := lib newwin_lines: 1 cols: 1 y: aPoint y x: aPoint x.
	aCharacter asString isWideString ifFalse: [ 
		lib print: aCharacter asString at: 1@1 on: localWin ].
	lib refresh: localWin.

	aCharacter asString isWideString ifFalse: [ 
		lib print: aCharacter asString  ]
]

{ #category : #rendering }
TextBlocRendererNCursesSurface >> form [

	^ form
]

{ #category : #initialization }
TextBlocRendererNCursesSurface >> initializeOn: anObject [

	anObject initializeForForm: self


]

{ #category : #initialization }
TextBlocRendererNCursesSurface >> initializeResourcesOn: aHostRenderer [
	"externalForm := BlExternalForm extent: self canvasExtent depth: 32.
	externalForm autoRelease.
	externalForm allocateSpace.
	externalForm fillColor: Color transparent.
"

	self initializeOn: aHostRenderer
]

{ #category : #rendering }
TextBlocRendererNCursesSurface >> prepareToRender: aSpace [
	"Dispatch preparation to render through host space based on surface type"
	
	self hostSpace prepareToRender: aSpace onFormSurface: self
]

{ #category : #rendering }
TextBlocRendererNCursesSurface >> renderFor: aSpace [
	"Dispatch render process through host space based on surface type"
	
	self hostSpace render: aSpace onFormSurface: self
]
