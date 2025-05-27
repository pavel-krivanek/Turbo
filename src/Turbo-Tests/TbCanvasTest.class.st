Class {
	#name : 'TbCanvasTest',
	#superclass : 'TestCase',
	#instVars : [
		'surface',
		'canvas'
	],
	#category : 'Turbo-Tests',
	#package : 'Turbo-Tests'
}

{ #category : 'as yet unclassified' }
TbCanvasTest >> setUp [ 
    super setUp.
    surface := TbMockSurface new.
    canvas := TbCanvas on: surface.
]

{ #category : 'as yet unclassified' }
TbCanvasTest >> testAtWriteRespectsTransformation [ 
    | p translated offset |
    p := 2@3.
    offset := 1@2.
    canvas pushTransform: (TbMockTranslation by: offset).
    canvas at: p write: 'B'.
    translated := p + offset.
    self assert: (surface writtenCharacterAt: translated) asString equals: 'B'.
    canvas popTransform.
]

{ #category : 'as yet unclassified' }
TbCanvasTest >> testAtWriteWritesCharacter [
    | p |
    p := 5@7.
    canvas at: p write: 'A'.
    self assert: (surface writtenCharacterAt: p) asString equals: 'A'.
]

{ #category : 'as yet unclassified' }
TbCanvasTest >> testAttributesSetterAndGetter [
	| attrs |
	attrs := {#bold. #underline} asSet.
	canvas attributes: attrs.
	self assertCollection: canvas attributes hasSameElements: attrs.
]

{ #category : 'as yet unclassified' }
TbCanvasTest >> testBackgroundColorChanges [ 
    canvas greenBackground.
    self assert: canvas backgroundColor equals: (Color r: 0.0 g: 0.659 b: 0.0 alpha: 1.0).
    canvas yellowBackground.
    self assert: canvas backgroundColor equals: (Color r: 0.659 g: 0.659 b: 0.0 alpha: 1.0).
]

{ #category : 'as yet unclassified' }
TbCanvasTest >> testBackgroundColorSetter [
	canvas backgroundColor: Color blue.
	self assert: canvas backgroundColor equals: Color blue.
]

{ #category : 'as yet unclassified' }
TbCanvasTest >> testBlackBackgroundSetsBackgroundColor [
	canvas blackBackground.
	self assert: canvas backgroundColor equals: Color black.
]

{ #category : 'as yet unclassified' }
TbCanvasTest >> testBoldAttribute [ 
    canvas bold.
    self assert: (canvas attributes includes: #bold).
]

{ #category : 'as yet unclassified' }
TbCanvasTest >> testClipReturnsClipper [ 
    self assert: ((canvas clip) isKindOf: TbClipper).
]

{ #category : 'as yet unclassified' }
TbCanvasTest >> testCyanTextSetsTextColor [
	canvas cyanText.
	self assert: canvas textColor equals: Color cyan.
]

{ #category : 'as yet unclassified' }
TbCanvasTest >> testFillRectangleFillsAllPoints [ 
    | rect points |
    rect := (0@0 extent: 2@1). "width 2, height 1 => points (0,0) (1,0) (2,0)"
    canvas fillRectangle: rect with: 'C'.
    points := { 0@0. 1@0. 2@0 }.
    points do: [ :pt | self assert: (surface writtenCharacterAt: pt) asString  equals: 'C' ].
]

{ #category : 'as yet unclassified' }
TbCanvasTest >> testFullDrawDelegatesToObject [
    | drawable |
    drawable := TbMockDrawable new.
    canvas fullDraw: drawable.
    self assert: (drawable wasDrawnOn: canvas).
]

{ #category : 'as yet unclassified' }
TbCanvasTest >> testGreenTextSetsTextColor [
	canvas greenText.
	self assert: canvas textColor equals: (Color r: 0.0 g: 0.659 b: 0.0 alpha: 1.0).
]

{ #category : 'as yet unclassified' }
TbCanvasTest >> testMagentaBackgroundSetsBackgroundColor [
	canvas magentaBackground.
	self assert: canvas backgroundColor equals: Color magenta.
]

{ #category : 'as yet unclassified' }
TbCanvasTest >> testMagentaTextSetsTextColor [
	canvas magentaText.
	self assert: canvas textColor equals: (Color r: 0.659 g: 0.0 b: 0.659 alpha: 1.0).
]

{ #category : 'as yet unclassified' }
TbCanvasTest >> testPushPopAttributesRestoresState [ 
    | originalBg originalTxt |
    canvas cyanBackground.
    canvas whiteText.
    originalBg := canvas backgroundColor.
    originalTxt := canvas textColor.
    canvas bold.
    canvas pushAttributes.
    canvas redBackground.
    canvas blackText.
    "now restore"
    canvas popAttributes.
    self assert: canvas backgroundColor equals: originalBg.
    self assert: canvas textColor equals: originalTxt.
    self assert: (canvas attributes includes: #bold).
]

{ #category : 'as yet unclassified' }
TbCanvasTest >> testPushPopTransform [ 
    | t |
    t := TbMockTranslation by: 3@4.
    canvas pushTransform: t.
    self assert: canvas transformationStack last equals: t.
    self assert: canvas popTransform equals: t.
]

{ #category : 'as yet unclassified' }
TbCanvasTest >> testSurfaceAccessor [ 
    | anotherSurface |
    anotherSurface := TbMockSurface new.
    canvas surface: anotherSurface.
    self assert: canvas surface equals: anotherSurface.
]

{ #category : 'as yet unclassified' }
TbCanvasTest >> testTextColorChanges [
    canvas redText.
    self assert: canvas textColor equals: (Color r: 0.659 g: 0.0 b: 0.0 alpha: 1.0).
    canvas blueText.
    self assert: canvas textColor equals: (Color r: 0.0 g: 0.0 b: 0.659 alpha: 1.0).
]

{ #category : 'as yet unclassified' }
TbCanvasTest >> testTextColorSetter [
	canvas textColor: Color red.
	self assert: canvas textColor equals: Color red.
]

{ #category : 'as yet unclassified' }
TbCanvasTest >> testTransformReturnsBuilder [
    self assert: ((canvas transform) isKindOf: TbTransformationBuilder2).
]

{ #category : 'as yet unclassified' }
TbCanvasTest >> testWhiteBackgroundSetsBackgroundColor [
	canvas whiteBackground.
	self assert: canvas backgroundColor equals: (Color r: 0.659 g: 0.659 b: 0.659 alpha: 1.0).
]

{ #category : 'as yet unclassified' }
TbCanvasTest >> testYellowTextSetsTextColor [
	canvas yellowText.
	self assert: canvas textColor equals: (Color r: 0.659 g: 0.659 b: 0.0 alpha: 1.0)
]
