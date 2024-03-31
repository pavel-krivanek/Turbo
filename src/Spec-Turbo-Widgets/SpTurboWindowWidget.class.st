Class {
	#name : #SpTurboWindowWidget,
	#superclass : #SpTurboWidget,
	#instVars : [
		'dragDelta',
		'dragMode'
	],
	#category : #'Spec-Turbo-Widgets'
}

{ #category : #'as yet unclassified' }
SpTurboWindowWidget >> bounds [ 

^ super bounds
]

{ #category : #'as yet unclassified' }
SpTurboWindowWidget >> clipChildren [ ^ true
]

{ #category : #'as yet unclassified' }
SpTurboWindowWidget >> close [ 

 self removeFromParent 
]

{ #category : #'as yet unclassified' }
SpTurboWindowWidget >> defaultLayout [
	^ TbBasicLayoutWithPadding new
		topLeftPadding: 1@1;
		bottomRightPadding: 1@1;
		yourself
]

{ #category : #'as yet unclassified' }
SpTurboWindowWidget >> drawOnTurboCanvas: aCanvas [

	self drawFrameOn: aCanvas.
	aCanvas at: 2@1 write: '[▓]'.
	aCanvas at: 6@1 write: self adapter model title asString.
	aCanvas at: (self bounds width-4)@1 write: '[x]'.
	aCanvas at: (self bounds width-8)@1 write: '[^]'.
	aCanvas at: (self bounds width-12)@1 write: '[-]'.
	
]

{ #category : #'as yet unclassified' }
SpTurboWindowWidget >> initialize [ 
	
	super initialize.
				
	self size: 64@20. 

	self addEventHandlerOn: TbDragStartEvent do: [ :evt |
		(evt position y = self bounds top and: [ evt position x >= bounds left and: [ evt position y <= bounds right ] ]) 
			ifTrue: [ 
				dragMode := #move.
				dragDelta := evt position-self position.
				evt consumed: true
			 ].
		(evt position = ((self bounds bottomRight)-(1@1)) )
			ifTrue: [ 
				dragMode := #resize.
				dragDelta := evt position-self position.
				evt consumed: true
			 ].
		].
	
	self addEventHandlerOn: TbDragEvent do: [ :evt |
		dragMode = #move ifTrue: [ 
			self relocate: (evt position-dragDelta).
			evt consumed: true ].
		dragMode = #resize ifTrue: [ 
			self size: (evt position-bounds topLeft).
			evt consumed: true ].		].
			
	self addEventHandlerOn: TbClickEvent do: [ :evt | 
		evt position = (self position + ((self bounds width-4)@0)) ifTrue: [ self close ]
		]
]

{ #category : #'as yet unclassified' }
SpTurboWindowWidget >> measuredBounds [ 

	^ super measuredBounds
]
