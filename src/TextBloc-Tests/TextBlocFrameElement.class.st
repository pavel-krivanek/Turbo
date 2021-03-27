Class {
	#name : #TextBlocFrameElement,
	#superclass : #BlElement,
	#category : #'TextBloc-Tests'
}

{ #category : #'as yet unclassified' }
TextBlocFrameElement >> drawOnTextBlocCanvas2: aCanvas [

	| extent |
	
	extent := self bounds.
	
	self hasFocus ifTrue: [ 
	
	aCanvas at: 1@1 write: '╔', (String withAll: ((1 to: (extent width-2)) collect: [ :e | $═ ])) asString, '╗'.
	2 to: extent height - 1 do: [ :y |
		aCanvas at: 1@y write: '║', (String withAll: ((1 to: (extent width-2)) collect: [ :e | $  ])) asString, '║'.
	].
	aCanvas at: 1@extent height write: '╚', (String withAll: ((1 to: (extent width-2)) collect: [ :e | $═ ])) asString, '╝'.
] ifFalse: [ 
	
	aCanvas at: 1@1 write: '┌', (String withAll: ((1 to: (extent width-2)) collect: [ :e | $─ ])) asString, '┐'.
	2 to: extent height - 1 do: [ :y |
		aCanvas at: 1@y write: '│', (String withAll: ((1 to: (extent width-2)) collect: [ :e | $  ])) asString, '│'.
	].
	aCanvas at: 1@extent height write: '└', (String withAll: ((1 to: (extent width-2)) collect: [ :e | $─ ])) asString, '┘'.
].



	
]

{ #category : #'as yet unclassified' }
TextBlocFrameElement >> drawOnTextBlocCanvas: aCanvas [

	| extent |
	
	extent := self bounds.
	
	self hasFocus ifTrue: [ 
	
	aCanvas at: 1@1 write: '*', (String withAll: ((1 to: (extent width-2)) collect: [ :e | $- ])) asString, '*'.
	2 to: extent height - 1 do: [ :y |
		aCanvas at: 1@y write: '||', (String withAll: ((1 to: (extent width-2)) collect: [ :e | $  ])) asString, '|'.
	].
	aCanvas at: 1@extent height write: '*', (String withAll: ((1 to: (extent width-2)) collect: [ :e | $- ])) asString, '*'.
] ifFalse: [ 
	
	aCanvas at: 1@1 write: '*', (String withAll: ((1 to: (extent width-2)) collect: [ :e | $- ])) asString, '*'.
	2 to: extent height - 1 do: [ :y |
		aCanvas at: 1@y write: '|', (String withAll: ((1 to: (extent width-2)) collect: [ :e | $  ])) asString, '|'.
	].
	aCanvas at: 1@extent height write: '*', (String withAll: ((1 to: (extent width-2)) collect: [ :e | $- ])) asString, '*'.
].



	
]
