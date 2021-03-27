Class {
	#name : #SpTextBlocRadioButtonWidget,
	#superclass : #SpTextBlocWidget,
	#instVars : [
		'label',
		'state',
		'acceptBlock',
		'clickBlock'
	],
	#category : #'Spec-TextBlocAdapters-Widgets'
}

{ #category : #initialization }
SpTextBlocRadioButtonWidget >> acceptBlock [

	^ acceptBlock
]

{ #category : #initialization }
SpTextBlocRadioButtonWidget >> acceptBlock: aBlock [

	acceptBlock := aBlock

]

{ #category : #accessing }
SpTextBlocRadioButtonWidget >> clickBlock [
	^ clickBlock
]

{ #category : #accessing }
SpTextBlocRadioButtonWidget >> clickBlock: anObject [
	clickBlock := anObject
]

{ #category : #initialization }
SpTextBlocRadioButtonWidget >> drawOnTextBlocCanvas: aCanvas [

	aCanvas pushAttributes.
		
	aCanvas at: 1@1 write: '(', self radioButtonText, ') ', self label.
	
	aCanvas popAttributes.
]

{ #category : #initialization }
SpTextBlocRadioButtonWidget >> initialize [ 
	
	super initialize.
	
	self addEventHandlerOn: BlClickEvent do: [ :evt | 
		self enabled ifTrue: [ self clickBlock value ]].

	self addEventHandlerOn: BlMouseDownEvent do: [ :evt | 
			self onMouseDown: evt ].
	self addEventHandlerOn: BlMouseUpEvent do: [ :evt |
		 self onMouseUp: evt ].
	self addEventHandlerOn: BlKeystrokeEvent do: [ :evt |
		self onKeystroke: evt ].
			



]

{ #category : #accessing }
SpTextBlocRadioButtonWidget >> label [
	^ label ifNil: ''
]

{ #category : #accessing }
SpTextBlocRadioButtonWidget >> label1 [
	^ label
]

{ #category : #accessing }
SpTextBlocRadioButtonWidget >> label: anObject [
	label := anObject
]

{ #category : #initialization }
SpTextBlocRadioButtonWidget >> onKeystroke: anEvent [

	self enabled ifFalse: [ ^ self ].

	"text := (text ifNil: ['']), anEvent char asString.
	self acceptBlock cull: text."
	
	self invalidate

]

{ #category : #initialization }
SpTextBlocRadioButtonWidget >> onMouseDown: anEvent [

	self enabled ifFalse: [ ^ self ].
	
	self hasFocus ifFalse: [self transferFocus].
	self invalidate

]

{ #category : #initialization }
SpTextBlocRadioButtonWidget >> onMouseUp: anEvent [

	self invalidate

]

{ #category : #initialization }
SpTextBlocRadioButtonWidget >> radioButtonText [

	^ (state ifNil: [ false ])
		ifTrue: [ '*' ]
		ifFalse: [ ' ' ]
]

{ #category : #accessing }
SpTextBlocRadioButtonWidget >> state [
	^ state
]

{ #category : #accessing }
SpTextBlocRadioButtonWidget >> state: anObject [
	state := anObject
]
