"
I represent bloc setting that can be customised from Menu > Settings.

I allow users to:
 - manually select preferable BlHost
"
Class {
	#name : #TbBloc,
	#superclass : #Object,
	#classVars : [
		'AssertionsEnabled',
		'DebugModeEnabled',
		'PreferableChildrenDataStructure',
		'PreferableEventHandlerRegistry',
		'PreferableHostClass',
		'PreferableSpartaCanvasBuilder'
	],
	#category : #'Turbo-Core-Settings'
}

{ #category : #assertions }
TbBloc class >> assertionsEnabled [
	^ AssertionsEnabled ifNil: [ true ]
]

{ #category : #assertions }
TbBloc class >> assertionsEnabled: aBoolean [
	AssertionsEnabled := aBoolean
]

{ #category : #debugging }
TbBloc class >> debugModeEnabled [
	^ DebugModeEnabled ifNil: [ false ]
]

{ #category : #debugging }
TbBloc class >> debugModeEnabled: aBoolean [
	DebugModeEnabled := aBoolean
]

{ #category : #children }
TbBloc class >> defaultChildrenDataStructure [
	^ TbChildrenArray
]

{ #category : #'event handling' }
TbBloc class >> defaultEventHandlerRegistry [
	^ TbHandlerAnnouncerRegistry
]

{ #category : #assertions }
TbBloc class >> disableAssertions [
	self assertionsEnabled: false
]

{ #category : #debugging }
TbBloc class >> disableDebugMode [
	self debugModeEnabled: false
]

{ #category : #assertions }
TbBloc class >> enableAssertions [
	self assertionsEnabled: true
]

{ #category : #debugging }
TbBloc class >> enableDebugMode [
	self debugModeEnabled: true
]

{ #category : #testing }
TbBloc class >> hasSparta [
	^ self environment includesKey: #BlSpartaRenderer
]

{ #category : #children }
TbBloc class >> preferableChildrenDataStructure [
	<return: #'BlChildrenCollection class'>

	^ PreferableChildrenDataStructure ifNil: [ self defaultChildrenDataStructure ]
]

{ #category : #children }
TbBloc class >> preferableChildrenDataStructure: anChildrenCollectionClass [
	PreferableChildrenDataStructure := anChildrenCollectionClass
]

{ #category : #'event handling' }
TbBloc class >> preferableEventHandlerRegistry [
	<return: #'BlHandlerRegistry class'>

	^ PreferableEventHandlerRegistry ifNil: [ self defaultEventHandlerRegistry ]
]

{ #category : #'event handling' }
TbBloc class >> preferableEventHandlerRegistry: anEventHandlerRegistryClass [
	PreferableEventHandlerRegistry := anEventHandlerRegistryClass
]

{ #category : #accessing }
TbBloc class >> preferableHostClass [
	^ PreferableHostClass ifNil: [ TbHost defaultHostClass ]
]

{ #category : #accessing }
TbBloc class >> preferableHostClass: aHostClass [
	
	PreferableHostClass := aHostClass.

	"change preferable universe host according to new setting"
	TbUniverse default preferableHost: aHostClass new.
	SettingBrowser allSubInstances do: [ :aSettingsBrowser | aSettingsBrowser treeChanged: Announcement new ]
]

{ #category : #accessing }
TbBloc class >> preferableSpartaCanvas [
	^ PreferableSpartaCanvasBuilder ifNil: [
		PreferableSpartaCanvasBuilder := (self environment at: #BlSpartaRenderer) defaultCanvasBuilder class ]
]

{ #category : #accessing }
TbBloc class >> preferableSpartaCanvas: aBuilderClass [
	PreferableSpartaCanvasBuilder := aBuilderClass.
	
	"change preferable universe host according to new setting"
	(self environment at: #BlSpartaRenderer) defaultCanvasBuilder: aBuilderClass new
]

{ #category : #settings }
TbBloc class >> preferencesGroup [
	^ 	#appearance
]
