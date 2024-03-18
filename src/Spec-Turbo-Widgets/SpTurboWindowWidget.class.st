Class {
	#name : #SpTurboWindowWidget,
	#superclass : #SpTurboWidget,
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
SpTurboWindowWidget >> defaultLayout [
	^ TbBasicLayoutWithPadding new
		topLeftPadding: 1@1;
		bottomRightPadding: 1@1;
		yourself
]

{ #category : #'as yet unclassified' }
SpTurboWindowWidget >> drawOnTurboCanvas: aCanvas [

	self drawFrameOn: aCanvas
]

{ #category : #'as yet unclassified' }
SpTurboWindowWidget >> initialize [ 
	
	super initialize.
				
	self size: 64@20. 

]

{ #category : #'as yet unclassified' }
SpTurboWindowWidget >> measuredBounds [ 

	^ super measuredBounds
]
