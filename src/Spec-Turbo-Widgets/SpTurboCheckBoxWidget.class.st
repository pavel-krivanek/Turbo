Class {
	#name : #SpTurboCheckBoxWidget,
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
SpTurboCheckBoxWidget >> acceptBlock [

	^ acceptBlock
]

{ #category : #initialization }
SpTurboCheckBoxWidget >> acceptBlock: aBlock [

	acceptBlock := aBlock

]

{ #category : #initialization }
SpTurboCheckBoxWidget >> checkBoxText [

	^ (state ifNil: [ false ])
		ifTrue: [ 'X' ]
		ifFalse: [ ' ' ]
]

{ #category : #accessing }
SpTurboCheckBoxWidget >> clickBlock [
	^ clickBlock
]

{ #category : #accessing }
SpTurboCheckBoxWidget >> clickBlock: anObject [
	clickBlock := anObject
]

{ #category : #initialization }
SpTurboCheckBoxWidget >> drawOnTurboCanvas: aCanvas [

	aCanvas pushAttributes.
		
	aCanvas at: 1@1 write: '[', self checkBoxText, '] ', self label.
	
	aCanvas popAttributes.
]

{ #category : #initialization }
SpTurboCheckBoxWidget >> initialize [ 
	
	super initialize.
	
	self addEventHandlerOn: TbClickEvent do: [ :evt | 
		self enabled ifTrue: [ self clickBlock value ]].

	self addEventHandlerOn: TbMouseDownEvent do: [ :evt | 
			self onMouseDown: evt ].
	self addEventHandlerOn: TbMouseUpEvent do: [ :evt |
		 self onMouseUp: evt ].
	self addEventHandlerOn: TbKeystrokeEvent do: [ :evt |
		self onKeystroke: evt ].
	
	self size: 23@1.
		



]

{ #category : #accessing }
SpTurboCheckBoxWidget >> label [
	^ label ifNil: ''
]

{ #category : #accessing }
SpTurboCheckBoxWidget >> label: anObject [
	label := anObject
]

{ #category : #initialization }
SpTurboCheckBoxWidget >> onKeystroke: anEvent [

	self enabled ifFalse: [ ^ self ].

	"text := (text ifNil: ['']), anEvent char asString.
	self acceptBlock cull: text."
	
	self invalidate

]

{ #category : #initialization }
SpTurboCheckBoxWidget >> onMouseDown: anEvent [

	self enabled ifFalse: [ ^ self ].
	
	self hasFocus ifFalse: [self transferFocus].
	self invalidate

]

{ #category : #initialization }
SpTurboCheckBoxWidget >> onMouseUp: anEvent [

	self invalidate

]

{ #category : #accessing }
SpTurboCheckBoxWidget >> state [
	^ state
]

{ #category : #accessing }
SpTurboCheckBoxWidget >> state: anObject [
	state := anObject
]
