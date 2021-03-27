Class {
	#name : #TextBlocRenderer,
	#superclass : #Object,
	#traits : 'TBlHostRenderer + TBlDebug',
	#classTraits : 'TBlHostRenderer classTrait + TBlDebug classTrait',
	#instVars : [
		'surface',
		'textBlocCanvas'
	],
	#category : #'TextBloc-Core'
}

{ #category : #'renderer - rendering' }
TextBlocRenderer >> doRender: aSpace [

	aSpace fullDrawOn: textBlocCanvas
]

{ #category : #initialization }
TextBlocRenderer >> initializeForForm: aFormSurface [
	"Initalize sparta canvas to be used with a form surface"
	| scaleFactor |

"	windowExtent := aFormSurface windowExtent.
	canvasExtent := aFormSurface canvasExtent.

	scaleFactor := aFormSurface scaleFactor.
"	textBlocCanvas := TextBlocCanvas on: aFormSurface.


]

{ #category : #initialization }
TextBlocRenderer >> initializeHostSpace: aBlHostSpace [

	surface := aBlHostSpace newSurface.
	surface initializeOn: aBlHostSpace
]

{ #category : #'renderer - rendering' }
TextBlocRenderer >> prepareToRender: aSpace [

	self surface initializeResourcesOn: self
]

{ #category : #'renderer - rendering' }
TextBlocRenderer >> render: aSpace [
	"Render a given space according to its dirty areas.
	Note: if there are no dirty areas nothing will happen, including window or canvas update"

	(self renderNeeded: aSpace)
		ifFalse: [ ^ self ].

	self surface prepareToRender: aSpace.
	 [ self surface renderFor: aSpace ]
		ensure: [ self finishedRender: aSpace ]
]

{ #category : #'renderer - accessing' }
TextBlocRenderer >> surface [
	^ surface
]

{ #category : #'renderer - accessing' }
TextBlocRenderer >> surface: aRendererSurface [
	surface := aRendererSurface
]
