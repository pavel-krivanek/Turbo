Class {
	#name : #SpTurboButtonWidget,
	#superclass : #SpTurboWidget,
	#instVars : [
		'label',
		'clickBlock',
		'pressed',
		'state',
		'color',
		'icon'
	],
	#category : #'Spec-Turbo-Widgets'
}

{ #category : #accessing }
SpTurboButtonWidget >> clickBlock [
	^ clickBlock
]

{ #category : #accessing }
SpTurboButtonWidget >> clickBlock: anObject [
	clickBlock := anObject
]

{ #category : #accessing }
SpTurboButtonWidget >> color [
	^ color
]

{ #category : #accessing }
SpTurboButtonWidget >> color: anObject [
	color := anObject
]

{ #category : #'as yet unclassified' }
SpTurboButtonWidget >> drawOnTurboCanvas: aCanvas [

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
SpTurboButtonWidget >> icon [
	^ icon
]

{ #category : #accessing }
SpTurboButtonWidget >> icon: anObject [
	icon := anObject
]

{ #category : #accessing }
SpTurboButtonWidget >> initialize [ 
	
	super initialize.
			
	self addEventHandlerOn: TbClickEvent do: [ :evt | 
		self enabled ifTrue: [ self clickBlock value ]].
	self addEventHandlerOn: TbMouseDownEvent do: [ :evt | 
		self enabled ifTrue: [
			self hasFocus ifFalse: [self transferFocus].
			pressed := true. self invalidate ]].
	self addEventHandlerOn: TbMouseUpEvent do: [ :evt |
		self enabled ifTrue: [
		 pressed := false. self invalidate ]].

	pressed := false.
	
	self size: 23@4.
	

]

{ #category : #accessing }
SpTurboButtonWidget >> label [
	^ label ifNil: [ '' ]
]

{ #category : #accessing }
SpTurboButtonWidget >> label: anObject [
	label := anObject.
	
]

{ #category : #accessing }
SpTurboButtonWidget >> state [
	^ state
]

{ #category : #accessing }
SpTurboButtonWidget >> state: anObject [
	state := anObject
]
