Class {
	#name : 'TbRendererTestingSurface',
	#superclass : 'TbHostRendererSurface',
	#instVars : [
		'displayMatrix'
	],
	#category : 'Turbo-Canvas-Testing',
	#package : 'Turbo-Canvas',
	#tag : 'Testing'
}

{ #category : 'testing' }
TbRendererTestingSurface class >> supportedBy: aClass [ 
	
	^ false
]

{ #category : 'rendering' }
TbRendererTestingSurface >> at: aPoint put: aCharacter [
 
	| line | 
	aPoint y > displayMatrix size ifTrue: [ ^ self ].
	line := displayMatrix at: aPoint y.
	aPoint x <= line size ifTrue: [ 
		line at: aPoint x put: aCharacter ]
	
]

{ #category : 'rendering' }
TbRendererTestingSurface >> at: aPoint put: aCharacter textColor: textColor backgroundColor: backgroundColor attributes: attributes [

	^ self at: aPoint asIntegerPoint put: aCharacter 
]

{ #category : 'initialization' }
TbRendererTestingSurface >> displayMatrix [

	^ displayMatrix
]

{ #category : 'initialization' }
TbRendererTestingSurface >> initializeOn: anObject [

	anObject initializeForForm: self


]

{ #category : 'initialization' }
TbRendererTestingSurface >> initializeResourcesOn: aHostRenderer [

	| hostMatrix |
	
	hostMatrix := self hostSpace displayMatrix.

	displayMatrix := (1 to: hostMatrix size) collect: [ :y |
		(1 to: hostMatrix anyOne size) collect: [ :x | $. ] ].
		
	self initializeOn: aHostRenderer
]

{ #category : 'rendering' }
TbRendererTestingSurface >> prepareToRender: aSpace [
	"Dispatch preparation to render through host space based on surface type"
	
	self hostSpace prepareToRender: aSpace onFormSurface: self
]

{ #category : 'rendering' }
TbRendererTestingSurface >> renderFor: aSpace [
	"Dispatch render process through host space based on surface type"
	
	self hostSpace render: aSpace onFormSurface: self
]
