Class {
	#name : #TbCanvas,
	#superclass : #Object,
	#instVars : [
		'surface',
		'transformationStack',
		'layerStack',
		'currentTransformation',
		'textColor',
		'backgroundColor',
		'attributes',
		'attributesStack'
	],
	#category : #'Turbo-Canvas'
}

{ #category : #'instance creation' }
TbCanvas class >> initialize [

	NamedUnit
		abbreviation: 'char'
		name: 'character'
		pluralName: 'characters'
		value: (16 units: Unit pixel).
]

{ #category : #'instance creation' }
TbCanvas class >> on: aSurface [

	^ self new 
		surface: aSurface;
		yourself
]

{ #category : #accessing }
TbCanvas >> at: aPoint write: aString [

	| pos| 
	
	pos := aPoint.
	
	transformationStack do: [ :each |
		pos := (each transform: pos) asIntegerPoint ].
	
	aString do: [ :e | 
		surface at: pos put: e textColor: textColor backgroundColor: backgroundColor attributes: attributes copy.
		pos := pos + (1@0) ].
]

{ #category : #accessing }
TbCanvas >> attributes [

"normal        normal display (no highlight)
 standout      best highlighting mode of the terminal.
 underline     underlining
 reverse       reverse video
 blink         blinking
 dim           half bright
 bold          extra bright or bold
 protect       protected mode
 invis         invisible or blank mode"

	^ attributes
]

{ #category : #accessing }
TbCanvas >> attributes: anObject [
	attributes := anObject asSet
]

{ #category : #accessing }
TbCanvas >> attributesStack [

	^ attributesStack ifNil: [ attributesStack := OrderedCollection new ]
]

{ #category : #accessing }
TbCanvas >> backgroundColor [
	^ backgroundColor
]

{ #category : #accessing }
TbCanvas >> backgroundColor: anObject [
	backgroundColor := anObject
]

{ #category : #colors }
TbCanvas >> blackBackground [

	backgroundColor := Color black.
	
]

{ #category : #colors }
TbCanvas >> blackText [

	textColor := Color black.
	
]

{ #category : #colors }
TbCanvas >> blueBackground [

	backgroundColor := Color r: 0.0 g: 0.0 b: 0.659 alpha: 1.0.
	
]

{ #category : #colors }
TbCanvas >> blueText [

	textColor := Color r: 0.0 g: 0.0 b: 0.659 alpha: 1.0.
	
]

{ #category : #attributes }
TbCanvas >> bold [

	attributes add: #bold
]

{ #category : #'drawing-general' }
TbCanvas >> clip [
	"Perform a clipping.
	User gets a clipper object responsible for clipping.
	See !SpartaClipper 'clipping' protocol for available api.

	canvas clip
		by: (0@0 extent: 300@350)
		during: [ 'perform drawing operations here' ].
	
	or:

	canvas clip
		push: (0@0 extent: 300@350).

	'perform drawing operations here'

	canvas clip
		pop.
	"
	<return: #TextBlocClipper>

	^ self clipBuilder
		reset;
		canvas: self;
		yourself
]

{ #category : #'drawing-general' }
TbCanvas >> clipBuilder [
	^ TextBlocClipper new
]

{ #category : #accessing }
TbCanvas >> currentTransformation [
	^ currentTransformation
]

{ #category : #accessing }
TbCanvas >> currentTransformation: anObject [
	currentTransformation := anObject
]

{ #category : #colors }
TbCanvas >> cyanBackground [

	backgroundColor := Color r: 0.0 g: 0.659 b: 0.659 alpha: 1.0.
	
]

{ #category : #colors }
TbCanvas >> cyanText [

	textColor := Color cyan.
	
]

{ #category : #colors }
TbCanvas >> fillRectangle: aRectangle with: aString [

	aRectangle top to: aRectangle bottom do: [ :y |
		aRectangle left to: aRectangle right do: [ :x |
			self at: x@y write: aString  ] ]
]

{ #category : #'drawing-general' }
TbCanvas >> fullDraw: anObject [
	^ anObject fullDrawOnTextBlocCanvas: self
]

{ #category : #colors }
TbCanvas >> greenBackground [

	backgroundColor := Color r: 0.0 g: 0.659 b: 0.0 alpha: 1.0.
	
]

{ #category : #colors }
TbCanvas >> greenText [

	textColor := Color r: 0.0 g: 0.659 b: 0.0 alpha: 1.0.
	
]

{ #category : #initialization }
TbCanvas >> initialize [
	super initialize.
	
	transformationStack := Stack new.
	layerStack := Stack new.
	currentTransformation := SpartaMatrix new.
	
	self blueBackground.
	self whiteText.
	attributes := Set new
]

{ #category : #colors }
TbCanvas >> magentaBackground [

	backgroundColor := Color magenta.
	
]

{ #category : #colors }
TbCanvas >> magentaText [

	textColor := Color r: 0.659 g: 0.0 b: 0.659 alpha: 1.0.
	
]

{ #category : #accessing }
TbCanvas >> popAttributes [

	| anArray |
	
	anArray := self attributesStack last.
	self attributesStack removeLast.
	
	attributes := anArray first.
	backgroundColor := anArray second.
	textColor := anArray third.

]

{ #category : #initialization }
TbCanvas >> popTransform [

	^ transformationStack pop
]

{ #category : #accessing }
TbCanvas >> pushAttributes [

	self attributesStack add: { attributes copy. backgroundColor. textColor }
]

{ #category : #initialization }
TbCanvas >> pushTransform: aSpartaMatrix [

	transformationStack push: aSpartaMatrix
]

{ #category : #colors }
TbCanvas >> redBackground [

	backgroundColor := Color r: 0.659 g: 0.0 b: 0.0 alpha: 1.0.
	
]

{ #category : #colors }
TbCanvas >> redText [

	textColor := Color r: 0.659 g: 0.0 b: 0.0 alpha: 1.0.
	
]

{ #category : #accessing }
TbCanvas >> surface [
	^ surface
]

{ #category : #accessing }
TbCanvas >> surface: anObject [
	surface := anObject
]

{ #category : #accessing }
TbCanvas >> textColor [
	^ textColor
]

{ #category : #accessing }
TbCanvas >> textColor: anObject [
	textColor := anObject
]

{ #category : #accessing }
TbCanvas >> transform [

	^ self transformationBuilder
		reset;
		canvas: self;
		yourself
]

{ #category : #accessing }
TbCanvas >> transformationBuilder [
	^ TextBlocTransformationBuilder2 new
]

{ #category : #accessing }
TbCanvas >> transformationStack [
	^ transformationStack
]

{ #category : #colors }
TbCanvas >> whiteBackground [

	backgroundColor := Color r: 0.659 g: 0.659 b: 0.659 alpha: 1.0.
	
]

{ #category : #colors }
TbCanvas >> whiteText [

	textColor := Color r: 0.659 g: 0.659 b: 0.659 alpha: 1.0.
	
]

{ #category : #colors }
TbCanvas >> yellowBackground [

	backgroundColor := Color r: 0.659 g: 0.659 b: 0.0 alpha: 1.0.
	
]

{ #category : #colors }
TbCanvas >> yellowText [

	textColor := Color r: 0.659 g: 0.659 b: 0.0 alpha: 1.0.
	
]
