Class {
	#name : #SpTurboWidget,
	#superclass : #TbElement,
	#instVars : [
		'enabled'
	],
	#category : #'Spec-Turbo-Widgets'
}

{ #category : #'as yet unclassified' }
SpTurboWidget >> bindKeyCombination: aShortcut toAction: aBlock [

	
]

{ #category : #'as yet unclassified' }
SpTurboWidget >> drawFrameOn: aCanvas [

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
SpTurboWidget >> drawOnTurboCanvas: aCanvas [

	"aCanvas  fillRectangle: (self bounds insetBy: 1) with: 'x' "
	"self drawFrameOn: aCanvas."
	

]

{ #category : #accessing }
SpTurboWidget >> enabled [
	^ enabled
]

{ #category : #accessing }
SpTurboWidget >> enabled: anObject [
	enabled := anObject
]
