Class {
	#name : #SpTextBlocTextInputField,
	#superclass : #SpTextBlocWidget,
	#instVars : [
		'text',
		'acceptBlock'
	],
	#category : #'Spec-TextBlocAdapters-Widgets'
}

{ #category : #initialization }
SpTextBlocTextInputField >> acceptBlock [

	^ acceptBlock
]

{ #category : #initialization }
SpTextBlocTextInputField >> acceptBlock: aBlock [

	acceptBlock := aBlock

]

{ #category : #initialization }
SpTextBlocTextInputField >> drawOnTextBlocCanvas: aCanvas [

	aCanvas pushAttributes.
		
	aCanvas blueBackground.
	aCanvas fillRectangle: (Rectangle origin: 1@1 corner: self extent) with: ' '.

	aCanvas whiteText.
	aCanvas bold.
	aCanvas at: 1@1 write: self text.

	
	aCanvas popAttributes.
]

{ #category : #initialization }
SpTextBlocTextInputField >> initialize [ 
	
	super initialize.
	
	self addEventHandlerOn: BlMouseDownEvent do: [ :evt | 
			self onMouseDown: evt ].
	self addEventHandlerOn: BlMouseUpEvent do: [ :evt |
		 self onMouseUp: evt ].
	self addEventHandlerOn: BlKeystrokeEvent do: [ :evt |
		self onKeystroke: evt ].
			



]

{ #category : #initialization }
SpTextBlocTextInputField >> onKeystroke: anEvent [

	self enabled ifFalse: [ ^ self ].

	text := (text ifNil: ['']), anEvent char asString.
	self acceptBlock cull: text.
	
	self invalidate

]

{ #category : #initialization }
SpTextBlocTextInputField >> onMouseDown: anEvent [

	self enabled ifFalse: [ ^ self ].
	
	self hasFocus ifFalse: [self transferFocus].
	self invalidate

]

{ #category : #initialization }
SpTextBlocTextInputField >> onMouseUp: anEvent [

	self invalidate

]

{ #category : #initialization }
SpTextBlocTextInputField >> text [ 

	^ text ifNil: '' asText
]

{ #category : #initialization }
SpTextBlocTextInputField >> text: aText [

	text := aText
]
