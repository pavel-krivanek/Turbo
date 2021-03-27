Class {
	#name : #TextBlocRendererVTESurface,
	#superclass : #BlHostRendererSurface,
	#instVars : [
		'presenter',
		'charSize',
		'eventHandler'
	],
	#category : #'TextBloc-VTE'
}

{ #category : #testing }
TextBlocRendererVTESurface class >> supportedBy: aClass [ 
	
	^ false
]

{ #category : #rendering }
TextBlocRendererVTESurface >> at: aPoint put: aCharacter textColor: textColor backgroundColor: backgroundColor attributes: attributes [

	presenter application defer: [ 
		presenter 
			saveCursor;
			cursorPosition: aPoint;
			feed: aCharacter asString;
			restoreCursor ]
]

{ #category : #rendering }
TextBlocRendererVTESurface >> charSize [

	^ charSize ifNil: [ 
		charSize := (GtkRunLoop defer: [ 
			self vteTerminal charWidth @ 
			self vteTerminal charHeight ]) 
			asIntegerPoint ]
]

{ #category : #rendering }
TextBlocRendererVTESurface >> form [

	^ form
]

{ #category : #initialization }
TextBlocRendererVTESurface >> hostSpace: aHostSpace [ 

	super hostSpace: aHostSpace.
	eventHandler hostSpace: aHostSpace.

]

{ #category : #initialization }
TextBlocRendererVTESurface >> initializeOn: aHostRenderer [

	eventHandler := TextBlocVTEEventHandler new.
	eventHandler surface: self. 

	aHostRenderer initializeForForm: self.

]

{ #category : #initialization }
TextBlocRendererVTESurface >> initializeResourcesOn: aHostRenderer [
	"externalForm := BlExternalForm extent: self canvasExtent depth: 32.
	externalForm autoRelease.
	externalForm allocateSpace.
	externalForm fillColor: Color transparent.
"

		| app | 
	
	app := SpApplication new.
	app useBackend: #Gtk. 
	presenter := VteTerminalPresenter newApplication: app.
	  	
	presenter openWithSpec.

	presenter eventHandler whenMouseMoveDo: [ :anEvent |
		eventHandler handleMouseMove: anEvent  ].
	
	presenter eventHandler whenMouseDownDo: [ :anEvent |
		eventHandler handleMouseDown: anEvent ].

	
]

{ #category : #rendering }
TextBlocRendererVTESurface >> prepareToRender: aSpace [
	"Dispatch preparation to render through host space based on surface type"
	
	self hostSpace prepareToRender: aSpace onFormSurface: self
]

{ #category : #rendering }
TextBlocRendererVTESurface >> renderFor: aSpace [
	"Dispatch render process through host space based on surface type"
	
	self hostSpace render: aSpace onFormSurface: self
]

{ #category : #initialization }
TextBlocRendererVTESurface >> transformPoint: aPoint [

	"return text coordinates of aPoint given in pixels"

	^ (aPoint // self charSize) asIntegerPoint
]

{ #category : #initialization }
TextBlocRendererVTESurface >> vteTerminal [

	^ presenter adapter innerWidget 
]
