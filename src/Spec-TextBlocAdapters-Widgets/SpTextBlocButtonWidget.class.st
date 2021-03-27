Class {
	#name : #SpTextBlocButtonWidget,
	#superclass : #SpTextBlocWidget,
	#instVars : [
		'label',
		'clickBlock',
		'pressed',
		'state',
		'color',
		'icon'
	],
	#category : #'Spec-TextBlocAdapters-Widgets'
}

{ #category : #accessing }
SpTextBlocButtonWidget >> clickBlock [
	^ clickBlock
]

{ #category : #accessing }
SpTextBlocButtonWidget >> clickBlock: anObject [
	clickBlock := anObject
]

{ #category : #accessing }
SpTextBlocButtonWidget >> color [
	^ color
]

{ #category : #accessing }
SpTextBlocButtonWidget >> color: anObject [
	color := anObject
]

{ #category : #'as yet unclassified' }
SpTextBlocButtonWidget >> drawOnTextBlocCanvas: aCanvas [

	| pos offset |
	
	aCanvas pushAttributes.
	
"	(self globalBoundsToLocal: (BlBounds fromRectangle: self bounds)) logCr.
"
	offset := pressed 
		ifTrue: [ 1@0 ]
		ifFalse: [ 0@0 ].
	
	pos := (self extent / 2) - ((self label size//2)@0).

	state
		ifTrue: [ aCanvas yellowBackground ]
		ifFalse: [ 
			enabled
				ifTrue: [ aCanvas greenBackground  ]
				ifFalse: [ aCanvas whiteBackground ] ].	

	color ifNotNil: [ aCanvas backgroundColor: color ].
		
	aCanvas fillRectangle: (Rectangle origin: 1@1+offset corner: self extent-(1@1)+offset) with: ' '.

	self hasFocus 
		ifTrue: [ aCanvas yellowText. aCanvas bold  ]
		ifFalse: [ aCanvas blackText ].			
	aCanvas at: pos+offset write: self label. 

	pressed ifFalse: [ 
		aCanvas blackBackground.
		aCanvas fillRectangle: (Rectangle 
				origin: (2@self extent y) 
				corner: (self extent x@self extent y)) with: ' '.
		aCanvas fillRectangle: (Rectangle 
				origin: (self extent x@2) 
				corner: (self extent x@self extent y)) with: ' '. ].

	aCanvas popAttributes.
		

]

{ #category : #accessing }
SpTextBlocButtonWidget >> icon [
	^ icon
]

{ #category : #accessing }
SpTextBlocButtonWidget >> icon: anObject [
	icon := anObject
]

{ #category : #accessing }
SpTextBlocButtonWidget >> initialize [ 
	
	super initialize.
			
	self addEventHandlerOn: BlClickEvent do: [ :evt | 
		self enabled ifTrue: [ self clickBlock value ]].
	self addEventHandlerOn: BlMouseDownEvent do: [ :evt | 
		self enabled ifTrue: [
			self hasFocus ifFalse: [self transferFocus].
			pressed := true. self invalidate ]].
	self addEventHandlerOn: BlMouseUpEvent do: [ :evt |
		self enabled ifTrue: [
		 pressed := false. self invalidate ]].

	pressed := false.
	

]

{ #category : #accessing }
SpTextBlocButtonWidget >> label [
	^ label ifNil: [ '' ]
]

{ #category : #accessing }
SpTextBlocButtonWidget >> label: anObject [
	label := anObject.
	
]

{ #category : #accessing }
SpTextBlocButtonWidget >> state [
	^ state
]

{ #category : #accessing }
SpTextBlocButtonWidget >> state: anObject [
	state := anObject
]
