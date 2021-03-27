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
			aHandledError element addChild: (anErrorContainer := TbElement new
				layout: TbLinearLayout vertical;
				constraintsDo: [ :c |
					c horizontal fitContent.
					c vertical fitContent ]) as: #errorContainer ].
	
	anErrorContainer
		addChild: (BlTextElement new
			padding: (TbInsets all: 5);
			text: 'Debug draw error' asRopedText;
			geometry: (TbRectangle cornerRadius: 3);
			border: (TbBorder paint: Color gray width: 1);
			background: Color white;
			when: TbClickEvent do: [ :anEvent |
				anEvent consumed: true.
				aHandledError error debug
			])
]
