"
I am a BlBackground builder.
"
Class {
	#name : #TbCompositeBackgroundBuilder,
	#superclass : #TbBackgroundBuilder,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'backgrounds',
		'builders'
	],
	#category : #'Turbo-Core-Basic-Background'
}

{ #category : #builder }
TbCompositeBackgroundBuilder >> build [
	<return: #BlBackground>
	self
		assert: [ builders isNotEmpty ]
		description: [ 'There should be specified at least one background' ].

	^ builders size > 1
		ifTrue: [ (TbCompositeBackground withAll: (builders collect: #build)) opacity: self opacity ]
		ifFalse: [
			self isOpaque
				ifTrue: [ builders first build ]
				ifFalse: [ builders first isOpaque
					ifTrue: [ builders first build opacity: self opacity ]
					ifFalse: [ (TbCompositeBackground withAll: (builders collect: #build)) opacity: self opacity ] ] ]
]

{ #category : #builder }
TbCompositeBackgroundBuilder >> image [
	| aBuilder |
	
	aBuilder := TbImageBackgroundBuilder new.
	builders add: aBuilder.

	^ aBuilder
]

{ #category : #accessing }
TbCompositeBackgroundBuilder >> image: aForm [
	builders add: (TbImageBackgroundBuilder new form: aForm)
]

{ #category : #initialization }
TbCompositeBackgroundBuilder >> initialize [
	super initialize.

	builders := OrderedCollection new
]

{ #category : #accessing }
TbCompositeBackgroundBuilder >> opacity: aNumber [
	"Change opacity of previously added background"
	
	self
		assert: [ backgrounds isNotEmpty ]
		description: [ 'There is no background to modify!' ].
		
	backgrounds last opacity: aNumber
]

{ #category : #builder }
TbCompositeBackgroundBuilder >> paint [
	| aBuilder |
	
	aBuilder := TbPaintBackgroundBuilder new.
	builders add: aBuilder.

	^ aBuilder
]

{ #category : #accessing }
TbCompositeBackgroundBuilder >> paint: aColorOrBlPaint [
	builders add: (TbPaintBackgroundBuilder new paint: aColorOrBlPaint)
]
