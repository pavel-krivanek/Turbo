Class {
	#name : #SpTextBlocWidget,
	#superclass : #BlElement,
	#instVars : [
		'enabled'
	],
	#category : #'Spec-TextBlocAdapters-Widgets'
}

{ #category : #'as yet unclassified' }
SpTextBlocWidget >> bindKeyCombination: aShortcut toAction: aBlock [

	
]

{ #category : #'as yet unclassified' }
SpTextBlocWidget >> drawFrameOn: aCanvas [

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
SpTextBlocWidget >> drawOnTextBlocCanvas: aCanvas [

	self drawFrameOn: aCanvas.
	

]

{ #category : #accessing }
SpTextBlocWidget >> enabled [
	^ enabled
]

{ #category : #accessing }
SpTextBlocWidget >> enabled: anObject [
	enabled := anObject
]
