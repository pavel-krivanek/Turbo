Class {
	#name : #TbFrameElement,
	#superclass : #TbElement,
	#category : #'Turbo-Tests'
}

{ #category : #'as yet unclassified' }
TbFrameElement >> drawOnTextBlocCanvas2: aCanvas [

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
TbFrameElement >> drawOnTextBlocCanvas: aCanvas [

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
