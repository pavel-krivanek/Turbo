Class {
	#name : #TbRendererVTESurface,
	#superclass : #TbHostRendererSurface,
	#instVars : [
		'presenter',
		'charSize',
		'eventHandler',
		'initialized'
	],
	#category : #'Turbo-VTE'
}

{ #category : #testing }
TbRendererVTESurface class >> supportedBy: aClass [ 
	
	^ false
]

{ #category : #rendering }
TbRendererVTESurface >> at: aPoint put: aCharacter textColor: textColor backgroundColor: backgroundColor attributes: attributes [

	presenter application defer: [ 
		presenter 
			saveCursor;
			cursorPosition: aPoint;
			feed: aCharacter asString;
			restoreCursor ]
]

{ #category : #rendering }
TbRendererVTESurface >> charSize [

	^ charSize ifNil: [ 
		charSize := (GtkRunLoop defer: [ 
			self vteTerminal charWidth @ 
			self vteTerminal charHeight ]) 
			asIntegerPoint ]
]

{ #category : #initialization }
TbRendererVTESurface >> hostSpace: aHostSpace [ 

	super hostSpace: aHostSpace.
	eventHandler hostSpace: aHostSpace.

]

{ #category : #initialization }
TbRendererVTESurface >> initializeOn: aHostRenderer [

	eventHandler := TbVTEEventHandler new.
	eventHandler surface: self. 

	aHostRenderer initializeForForm: self.

]

{ #category : #initialization }
TbRendererVTESurface >> initializeResourcesOn: aHostRenderer [
	"externalForm := BlExternalForm extent: self canvasExtent depth: 32.
	externalForm autoRelease.
	externalForm allocateSpace.
	externalForm fillColor: Color transparent.
"

		| app | 
		
	initialized ifNotNil: [ ^ self ].
	
	app := SpApplication new.
	app useBackend: #Gtk. 
	presenter := TbVTEPresenter newApplication: app.
	presenter beNotEditable. 	
	
	presenter eventHandler whenMouseMoveDo: [ :anEvent |
		eventHandler handleMouseMove: anEvent  ].
	
	presenter eventHandler whenMouseDownDo: [ :anEvent |
		eventHandler handleMouseDown: anEvent ].

	presenter eventHandler whenMouseUpDo: [ :anEvent |
		eventHandler handleMouseUp: anEvent ].

	aHostRenderer initializeForForm: self.
	
	presenter openWithSpec.

	initialized := true.
	
]

{ #category : #rendering }
TbRendererVTESurface >> prepareToRender: aSpace [
	"Dispatch preparation to render through host space based on surface type"
	
	self hostSpace prepareToRender: aSpace onFormSurface: self
]

{ #category : #rendering }
TbRendererVTESurface >> renderFor: aSpace [
	"Dispatch render process through host space based on surface type"
	
	self hostSpace render: aSpace onFormSurface: self
]

{ #category : #initialization }
TbRendererVTESurface >> transformPoint: aPoint [

	"return text coordinates of aPoint given in pixels"

	^ (aPoint // self charSize) asIntegerPoint
]

{ #category : #initialization }
TbRendererVTESurface >> vteTerminal [

	^ presenter adapter innerWidget 
]
