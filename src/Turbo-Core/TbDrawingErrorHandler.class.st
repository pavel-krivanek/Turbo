"
I handle errors happened during rendering phase.

To not completely break the UI thread we should catch the error and prevent the element from further rendering
"
Class {
	#name : #TbDrawingErrorHandler,
	#superclass : #TbSingleErrorHandler,
	#category : #'Turbo-Core-Basic-Errors'
}

{ #category : #testing }
TbDrawingErrorHandler >> matches: aFramePhase [
	^ aFramePhase isDrawingPhase
]

{ #category : #'error handling' }
TbDrawingErrorHandler >> processError: aHandledError [
	| anErrorContainer |
	
	aHandledError element
		childNamed: #errorContainer
		ifFound: [ :anElement | anErrorContainer := anElement ]
		ifNone: [
			aHandledError element addChild: (anErrorContainer := BlElement new
				layout: BlLinearLayout vertical;
				constraintsDo: [ :c |
					c horizontal fitContent.
					c vertical fitContent ]) as: #errorContainer ].
	
	anErrorContainer
		addChild: (BlTextElement new
			padding: (BlInsets all: 5);
			text: 'Debug draw error' asRopedText;
			geometry: (BlRectangle cornerRadius: 3);
			border: (BlBorder paint: Color gray width: 1);
			background: Color white;
			when: BlClickEvent do: [ :anEvent |
				anEvent consumed: true.
				aHandledError error debug
			])
]