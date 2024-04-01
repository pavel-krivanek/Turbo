Class {
	#name : #TbRenderer,
	#superclass : #Object,
	#traits : 'TTbHostRenderer + TTbDebug',
	#classTraits : 'TTbHostRenderer classTrait + TTbDebug classTrait',
	#instVars : [
		'surface',
		'textBlocCanvas'
	],
	#category : #'Turbo-Canvas'
}

{ #category : #'renderer - rendering' }
TbRenderer >> doRender: aSpace [

	aSpace fullDrawOn: textBlocCanvas
]

{ #category : #initialization }
TbRenderer >> initializeForForm: aFormSurface [
	"Initalize sparta canvas to be used with a form surface"
	| scaleFactor |

"	windowExtent := aFormSurface windowExtent.
	canvasExtent := aFormSurface canvasExtent.

	scaleFactor := aFormSurface scaleFactor.
"	textBlocCanvas := TbCanvas on: aFormSurface.


]

{ #category : #initialization }
TbRenderer >> initializeHostSpace: aBlHostSpace [

	surface := aBlHostSpace newSurface.
	surface initializeOn: aBlHostSpace
]

{ #category : #'renderer - rendering' }
TbRenderer >> prepareToRender: aSpace [

	self surface initializeResourcesOn: self
]

{ #category : #'renderer - rendering' }
TbRenderer >> render: aSpace [
	"Render a given space according to its dirty areas.
	Note: if there are no dirty areas nothing will happen, including window or canvas update"

	(self renderNeeded: aSpace)
		ifFalse: [ ^ self ].

	self surface prepareToRender: aSpace.
	 [ self surface renderFor: aSpace ]
		ensure: [ self finishedRender: aSpace ]
]

{ #category : #'renderer - accessing' }
TbRenderer >> surface [
	^ surface
]

{ #category : #'renderer - accessing' }
TbRenderer >> surface: aRendererSurface [
	surface := aRendererSurface
]
