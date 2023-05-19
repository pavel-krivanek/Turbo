Class {
	#name : #SpTurboTextInputField,
	#superclass : #SpTurboWidget,
	#instVars : [
		'text',
		'acceptBlock'
	],
	#category : #'Spec-Turbo-Widgets'
}

{ #category : #initialization }
SpTurboTextInputField >> acceptBlock [

	^ acceptBlock
]

{ #category : #initialization }
SpTurboTextInputField >> acceptBlock: aBlock [

	acceptBlock := aBlock

]

{ #category : #initialization }
SpTurboTextInputField >> drawOnTurboCanvas: aCanvas [

	aCanvas pushAttributes.
		
	aCanvas blueBackground.
	aCanvas fillRectangle: (Rectangle origin: 1@1 corner: self extent) with: ' '.

	aCanvas whiteText.
	aCanvas bold.
	aCanvas at: 1@1 write: self text.

	
	aCanvas popAttributes.
]

{ #category : #initialization }
SpTurboTextInputField >> initialize [ 
	
	super initialize.
	
	self addEventHandlerOn: TbMouseDownEvent do: [ :evt | 
			self onMouseDown: evt ].
	self addEventHandlerOn: TbMouseUpEvent do: [ :evt |
		 self onMouseUp: evt ].
	self addEventHandlerOn: TbKeystrokeEvent do: [ :evt |
		self onKeystroke: evt ].
			
	self size: 23@2.



]

{ #category : #initialization }
SpTurboTextInputField >> onKeystroke: anEvent [

	self enabled ifFalse: [ ^ self ].

	text := (text ifNil: ['']), anEvent char asString.
	self acceptBlock cull: text.
	
	self invalidate

]

{ #category : #initialization }
SpTurboTextInputField >> onMouseDown: anEvent [

	self enabled ifFalse: [ ^ self ].
	
	self hasFocus ifFalse: [self transferFocus].
	self invalidate

]

{ #category : #initialization }
SpTurboTextInputField >> onMouseUp: anEvent [

	self invalidate

]

{ #category : #initialization }
SpTurboTextInputField >> text [ 

	^ text ifNil: '' asText
]

{ #category : #initialization }
SpTurboTextInputField >> text: aText [

	text := aText
]
