Class {
	#name : #SpTurboAbstractAdapter,
	#superclass : #SpAbstractAdapter,
	#instVars : [
		'backendUpdating'
	],
	#category : #'Spec-Turbo-Base'
}

{ #category : #accessing }
SpTurboAbstractAdapter class >> adaptingName [
	"Override me if adapter will not follow the common pattern"

	"remove 'SpTurbo' part and *in general*, I will have the adapting name"

	^ (self name allButFirst: 7) asSymbol
]

{ #category : #accessing }
SpTurboAbstractAdapter class >> allAdapters [

	^ self allSubclasses
]

{ #category : #'instance creation' }
SpTurboAbstractAdapter >> add: anAdapter [ 
	
	self widgetDo: [ :aWidget |
		| child |
		child := anAdapter asWidget.
		child size: 10@3.
		child hasParent ifFalse: [
		aWidget layout: TbLinearLayout new.
		aWidget addChild: child.]
		 ]
]

{ #category : #protocol }
SpTurboAbstractAdapter >> addModelIn: widgetToBuild withSpecLayout: aSpec [
	
	
]

{ #category : #protocol }
SpTurboAbstractAdapter >> addModelTo: aWidget [

	aWidget enabled: self presenter isEnabled.
]

{ #category : #enumerating }
SpTurboAbstractAdapter >> backendDetectCyclesDo: aBlock [ 

	self isBackendUpdating ifTrue: [ ^ self ].
	^ aBlock value
]

{ #category : #enumerating }
SpTurboAbstractAdapter >> backendUpdatingDo: aBlock [ 
	"This is a general mechanism to avoid colisions. 
	 I'm adding it for the cases where a presenter can be updated in two directions: from the 
	 user and from the backend. 
	 A tipical example of this is SpTextPresenter>>text:, who can be updated from the UI, but 
	 also needs to be updated from the backend to keep the text property updated."
	| oldStatus |

	oldStatus := backendUpdating.
	backendUpdating := true.
	aBlock ensure: [ 
		backendUpdating := oldStatus ]
]

{ #category : #protocol }
SpTurboAbstractAdapter >> bindKeyCombination: aShortcut toAction: aBlock [


]

{ #category : #protocol }
SpTurboAbstractAdapter >> borderColor: color [
]

{ #category : #protocol }
SpTurboAbstractAdapter >> borderWidth: width [
]

{ #category : #protocol }
SpTurboAbstractAdapter >> buildWidget [

	| aWidget |
	
	aWidget := self newWidget.
	self addModelTo: aWidget.
	^ aWidget
]

{ #category : #protocol }
SpTurboAbstractAdapter >> color: color [
]

{ #category : #protocol }
SpTurboAbstractAdapter >> convert: aNumberOrUnit [

	| val |

	val := (aNumberOrUnit isNumber 
		ifTrue: [ (aNumberOrUnit pixels convertTo: Unit character) rounded ]
		ifFalse: [ (aNumberOrUnit convertTo: Unit character) rounded ]) value.
	^ val.
]

{ #category : #protocol }
SpTurboAbstractAdapter >> dragEnabled: aBoolean [
]

{ #category : #protocol }
SpTurboAbstractAdapter >> dropEnabled: aBoolean [
]

{ #category : #protocol }
SpTurboAbstractAdapter >> enabled [

	^ widget enabled
]

{ #category : #protocol }
SpTurboAbstractAdapter >> enabled: aBoolean [

	widget enabled: aBoolean
]

{ #category : #'gt-inspector-extension' }
SpTurboAbstractAdapter >> gtInspectorPreviewIn: aGLMCompositePresentation [
	"Do nothing at the moment"
]

{ #category : #protocol }
SpTurboAbstractAdapter >> hRigid [
]

{ #category : #protocol }
SpTurboAbstractAdapter >> hShrinkWrap [

]

{ #category : #protocol }
SpTurboAbstractAdapter >> hSpaceFill [
]

{ #category : #initialization }
SpTurboAbstractAdapter >> initialize [

	super initialize.
	backendUpdating := false
]

{ #category : #enumerating }
SpTurboAbstractAdapter >> isBackendUpdating [

	^ backendUpdating
]

{ #category : #protocol }
SpTurboAbstractAdapter >> layout: aLayout [
]

{ #category : #protocol }
SpTurboAbstractAdapter >> newWidget [

	^ SpTurboGeneralWidget named: ((self class name withoutPrefix: #Turbo) withoutSuffix: #Adapter)
]

{ #category : #protocol }
SpTurboAbstractAdapter >> removeSubWidgets [
]

{ #category : #protocol }
SpTurboAbstractAdapter >> setBalloonText: aString [
]

{ #category : #protocol }
SpTurboAbstractAdapter >> takeKeyboardFocus [
]

{ #category : #protocol }
SpTurboAbstractAdapter >> useProportionalLayout [
]

{ #category : #protocol }
SpTurboAbstractAdapter >> vRigid [
]

{ #category : #protocol }
SpTurboAbstractAdapter >> vShrinkWrap [
]

{ #category : #protocol }
SpTurboAbstractAdapter >> vSpaceFill [
]

{ #category : #protocol }
SpTurboAbstractAdapter >> when: anAnnouncement do: aBlock [
]
