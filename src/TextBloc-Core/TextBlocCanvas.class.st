Class {
	#name : #TextBlocCanvas,
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
	#category : #'TextBloc-Core'
}

{ #category : #'instance creation' }
TextBlocCanvas class >> initialize [

	NamedUnit
		abbreviation: 'char'
		name: 'character'
		pluralName: 'characters'
		value: (16 units: Unit pixel).
]

{ #category : #'instance creation' }
TextBlocCanvas class >> on: aSurface [

	^ self new 
		surface: aSurface;
		yourself
]

{ #category : #accessing }
TextBlocCanvas >> at: aPoint write: aString [

	| pos| 
	
	pos := aPoint.
	
	transformationStack do: [ :each |
		pos := (each transform: pos) asIntegerPoint ].
	
	aString do: [ :e | 
		surface at: pos put: e textColor: textColor backgroundColor: backgroundColor attributes: attributes copy.
		pos := pos + (1@0) ].
]

{ #category : #accessing }
TextBlocCanvas >> attributes [

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
TextBlocCanvas >> attributes: anObject [
	attributes := anObject asSet
]

{ #category : #accessing }
TextBlocCanvas >> attributesStack [

	^ attributesStack ifNil: [ attributesStack := OrderedCollection new ]
]

{ #category : #accessing }
TextBlocCanvas >> backgroundColor [
	^ backgroundColor
]

{ #category : #accessing }
TextBlocCanvas >> backgroundColor: anObject [
	backgroundColor := anObject
]

{ #category : #colors }
TextBlocCanvas >> blackBackground [

	backgroundColor := Color black.
	
]

{ #category : #colors }
TextBlocCanvas >> blackText [

	textColor := Color black.
	
]

{ #category : #colors }
TextBlocCanvas >> blueBackground [

	backgroundColor := Color r: 0.0 g: 0.0 b: 0.659 alpha: 1.0.
	
]

{ #category : #colors }
TextBlocCanvas >> blueText [

	textColor := Color r: 0.0 g: 0.0 b: 0.659 alpha: 1.0.
	
]

{ #category : #attributes }
TextBlocCanvas >> bold [

	attributes add: #bold
]

{ #category : #'drawing-general' }
TextBlocCanvas >> clip [
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
TextBlocCanvas >> clipBuilder [
	^ TextBlocClipper new
]

{ #category : #accessing }
TextBlocCanvas >> currentTransformation [
	^ currentTransformation
]

{ #category : #accessing }
TextBlocCanvas >> currentTransformation: anObject [
	currentTransformation := anObject
]

{ #category : #colors }
TextBlocCanvas >> cyanBackground [

	backgroundColor := Color r: 0.0 g: 0.659 b: 0.659 alpha: 1.0.
	
]

{ #category : #colors }
TextBlocCanvas >> cyanText [

	textColor := Color cyan.
	
]

{ #category : #colors }
TextBlocCanvas >> fillRectangle: aRectangle with: aString [

	aRectangle top to: aRectangle bottom do: [ :y |
		aRectangle left to: aRectangle right do: [ :x |
			self at: x@y write: aString  ] ]
]

{ #category : #'drawing-general' }
TextBlocCanvas >> fullDraw: anObject [
	^ anObject fullDrawOnTextBlocCanvas: self
]

{ #category : #colors }
TextBlocCanvas >> greenBackground [

	backgroundColor := Color r: 0.0 g: 0.659 b: 0.0 alpha: 1.0.
	
]

{ #category : #colors }
TextBlocCanvas >> greenText [

	textColor := Color r: 0.0 g: 0.659 b: 0.0 alpha: 1.0.
	
]

{ #category : #initialization }
TextBlocCanvas >> initialize [
	super initialize.
	
	transformationStack := Stack new.
	layerStack := Stack new.
	currentTransformation := SpartaMatrix new.
	
	self blueBackground.
	self whiteText.
	attributes := Set new
]

{ #category : #colors }
TextBlocCanvas >> magentaBackground [

	backgroundColor := Color magenta.
	
]

{ #category : #colors }
TextBlocCanvas >> magentaText [

	textColor := Color r: 0.659 g: 0.0 b: 0.659 alpha: 1.0.
	
]

{ #category : #accessing }
TextBlocCanvas >> popAttributes [

	| anArray |
	
	anArray := self attributesStack last.
	self attributesStack removeLast.
	
	attributes := anArray first.
	backgroundColor := anArray second.
	textColor := anArray third.

]

{ #category : #initialization }
TextBlocCanvas >> popTransform [

	^ transformationStack pop
]

{ #category : #accessing }
TextBlocCanvas >> pushAttributes [

	self attributesStack add: { attributes copy. backgroundColor. textColor }
]

{ #category : #initialization }
TextBlocCanvas >> pushTransform: aSpartaMatrix [

	transformationStack push: aSpartaMatrix
]

{ #category : #colors }
TextBlocCanvas >> redBackground [

	backgroundColor := Color r: 0.659 g: 0.0 b: 0.0 alpha: 1.0.
	
]

{ #category : #colors }
TextBlocCanvas >> redText [

	textColor := Color r: 0.659 g: 0.0 b: 0.0 alpha: 1.0.
	
]

{ #category : #accessing }
TextBlocCanvas >> surface [
	^ surface
]

{ #category : #accessing }
TextBlocCanvas >> surface: anObject [
	surface := anObject
]

{ #category : #accessing }
TextBlocCanvas >> textColor [
	^ textColor
]

{ #category : #accessing }
TextBlocCanvas >> textColor: anObject [
	textColor := anObject
]

{ #category : #accessing }
TextBlocCanvas >> transform [

	^ self transformationBuilder
		reset;
		canvas: self;
		yourself
]

{ #category : #accessing }
TextBlocCanvas >> transformationBuilder [
	^ TextBlocTransformationBuilder new
]

{ #category : #accessing }
TextBlocCanvas >> transformationStack [
	^ transformationStack
]

{ #category : #colors }
TextBlocCanvas >> whiteBackground [

	backgroundColor := Color r: 0.659 g: 0.659 b: 0.659 alpha: 1.0.
	
]

{ #category : #colors }
TextBlocCanvas >> whiteText [

	textColor := Color r: 0.659 g: 0.659 b: 0.659 alpha: 1.0.
	
]

{ #category : #colors }
TextBlocCanvas >> yellowBackground [

	backgroundColor := Color r: 0.659 g: 0.659 b: 0.0 alpha: 1.0.
	
]

{ #category : #colors }
TextBlocCanvas >> yellowText [

	textColor := Color r: 0.659 g: 0.659 b: 0.0 alpha: 1.0.
	
]
