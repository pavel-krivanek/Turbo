Extension { #name : #BlElement }

{ #category : #'*TextBloc-Core' }
BlElement >> drawChildrenOnTextBlocCanvas: aCanvas [

	"If there are not children no need to draw and clip"
	self hasChildren
		ifFalse: [ ^ self ].

	aCanvas clip
		when: [ self clipChildren ]
		by: [ "self geometry pathOnSpartaCanvas: aCanvas" ]
		during: [ self children sortedByElevation
			do: [ :anElement | anElement fullDrawOnTextBlocCanvas: aCanvas ] ]
]

{ #category : #'*TextBloc-Core' }
BlElement >> drawOnTextBlocCanvas: aCanvas [

"
	| isBackgroundTransparent isBorderTransparent areBothTransparent areBothVisible |

	isBackgroundTransparent := self background isTransparent.
	isBorderTransparent := self border isTransparent.
	areBothTransparent := isBackgroundTransparent and: [ isBorderTransparent ].
	areBothVisible := (isBackgroundTransparent or: [ isBorderTransparent ]) not.

	areBothTransparent
		ifTrue: [ ^ self ].

	""We create a new virtual layer in order to blend background and border only if they are both visible""

	aCanvas layer
		when: [ self outskirts wantsLayerOn: self ]
		during: [
			aCanvas
				compose: #composeSource
				when: [ self outskirts wantsLayerOn: self ]
				during: [
					self outskirts
						drawBackground: [ self drawBackgroundOnSpartaCanvas: aCanvas ]
						border: [ self drawBorderOnSpartaCanvas: aCanvas ]
						of: self
						onSpartaCanvas: aCanvas ] ]"
]

{ #category : #'*TextBloc-Core' }
BlElement >> fullDrawOnTextBlocCanvas: aCanvas [
	| anEffectBounds |

	"We do not draw transparent elements at all"
	self isTransparent
		ifTrue: [ ^ self ].

	"invisible elements are not rendered too"
	self isVisible
		ifFalse: [ ^ self ].

	anEffectBounds := self geometryBounds.
	"No need to render elements smaller than half of a pixel"
	(anEffectBounds width min: anEffectBounds height) < 0.5
		ifTrue: [ ^ self ].
		
	aCanvas transform
		by: self transformation
		translated: self position
		during: [ :aTransformedCanvas |

		aTransformedCanvas clip
			when: [ self clipChildren ]
			by: [ (self visualBounds: BlBounds new on: aTransformedCanvas) merge: anEffectBounds ]
			during: [
				self drawOnTextBlocCanvas: aTransformedCanvas.
				self drawChildrenOnTextBlocCanvas: aTransformedCanvas ] ] 
	
]
