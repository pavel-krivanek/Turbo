Class {
	#name : #SpTurboRadioButtonWidget,
	#superclass : #SpTurboWidget,
	#instVars : [
		'label',
		'state',
		'acceptBlock',
		'clickBlock'
	],
	#category : #'Spec-Turbo-Widgets'
}

{ #category : #initialization }
SpTurboRadioButtonWidget >> acceptBlock [

	^ acceptBlock
]

{ #category : #initialization }
SpTurboRadioButtonWidget >> acceptBlock: aBlock [

	acceptBlock := aBlock

]

{ #category : #accessing }
SpTurboRadioButtonWidget >> clickBlock [
	^ clickBlock
]

{ #category : #accessing }
SpTurboRadioButtonWidget >> clickBlock: anObject [
	clickBlock := anObject
]

{ #category : #initialization }
SpTurboRadioButtonWidget >> drawOnTurboCanvas: aCanvas [

	aCanvas pushAttributes.
		
	aCanvas at: 1@1 write: '(', self radioButtonText, ') ', self label.
	
	aCanvas popAttributes.
]

{ #category : #initialization }
SpTurboRadioButtonWidget >> initialize [ 
	
	super initialize.
	
	self addEventHandlerOn: TbClickEvent do: [ :evt | 
		self enabled ifTrue: [ self clickBlock value ]].

	self addEventHandlerOn: TbMouseDownEvent do: [ :evt | 
			self onMouseDown: evt ].
	self addEventHandlerOn: TbMouseUpEvent do: [ :evt |
		 self onMouseUp: evt ].
	self addEventHandlerOn: TbKeystrokeEvent do: [ :evt |
		self onKeystroke: evt ].
			



]

{ #category : #accessing }
SpTurboRadioButtonWidget >> label [
	^ label ifNil: ''
]

{ #category : #accessing }
SpTurboRadioButtonWidget >> label1 [
	^ label
]

{ #category : #accessing }
SpTurboRadioButtonWidget >> label: anObject [
	label := anObject
]

{ #category : #initialization }
SpTurboRadioButtonWidget >> onKeystroke: anEvent [

	self enabled ifFalse: [ ^ self ].

	"text := (text ifNil: ['']), anEvent char asString.
	self acceptBlock cull: text."
	
	self invalidate

]

{ #category : #initialization }
SpTurboRadioButtonWidget >> onMouseDown: anEvent [

	self enabled ifFalse: [ ^ self ].
	
	self hasFocus ifFalse: [self transferFocus].
	self invalidate

]

{ #category : #initialization }
SpTurboRadioButtonWidget >> onMouseUp: anEvent [

	self invalidate

]

{ #category : #initialization }
SpTurboRadioButtonWidget >> radioButtonText [

	^ (state ifNil: [ false ])
		ifTrue: [ '*' ]
		ifFalse: [ ' ' ]
]

{ #category : #accessing }
SpTurboRadioButtonWidget >> state [
	^ state
]

{ #category : #accessing }
SpTurboRadioButtonWidget >> state: anObject [
	state := anObject
]
