Class {
	#name : #TextBlocRendererMorphicFormSurface,
	#superclass : #BlHostRendererSurface,
	#instVars : [
		'form'
	],
	#category : #'TextBloc-Morphic'
}

{ #category : #testing }
TextBlocRendererMorphicFormSurface class >> supportedBy: aClass [ 
	
	^ false
]

{ #category : #rendering }
TextBlocRendererMorphicFormSurface >> at: aPoint put: aCharacter textColor: textColor backgroundColor: backgroundColor attributes: attributes [

	| charForm canvas outCanvas pos finalTextColor |
	
	"SLOOOW temporary implementation"
		
	finalTextColor := textColor.
		
	textColor = Color black ifFalse: [ 
		(attributes includes: #bold) ifTrue: [ finalTextColor := finalTextColor adjustBrightness: 1.] ].
	(attributes includes: #dim) ifTrue: [ finalTextColor := finalTextColor darker].

	charForm := Form extent: self hostSpace host characterExtent depth: 32.
	canvas := FormCanvas on: charForm.
	canvas fillColor: backgroundColor.
	canvas drawString: aCharacter asString at: 0@0 font: StandardFonts codeFont color: finalTextColor.
	
	outCanvas := FormCanvas on: form.
	pos := ((aPoint-(1@1))) rounded * self hostSpace host characterExtent.	
	outCanvas drawImage: charForm at: pos.
	
"	aCharacter asString displayOn: form at: (aPoint-(1@1)) * self hostSpace host characterExtent
"	
]

{ #category : #rendering }
TextBlocRendererMorphicFormSurface >> form [

	^ form
]

{ #category : #initialization }
TextBlocRendererMorphicFormSurface >> initializeOn: anObject [

	anObject initializeForForm: self


]

{ #category : #initialization }
TextBlocRendererMorphicFormSurface >> initializeResourcesOn: aHostRenderer [
	"externalForm := BlExternalForm extent: self canvasExtent depth: 32.
	externalForm autoRelease.
	externalForm allocateSpace.
	externalForm fillColor: Color transparent.
"

	form := Form extent: (self hostSpace windowExtent) depth: 32.
	form fillColor: Color white.
	
	self initializeOn: aHostRenderer
]

{ #category : #rendering }
TextBlocRendererMorphicFormSurface >> prepareToRender: aSpace [
	"Dispatch preparation to render through host space based on surface type"
	
	self hostSpace prepareToRender: aSpace onFormSurface: self
]

{ #category : #rendering }
TextBlocRendererMorphicFormSurface >> renderFor: aSpace [
	"Dispatch render process through host space based on surface type"
	
	self hostSpace render: aSpace onFormSurface: self
]
