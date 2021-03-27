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

{ #category : #settings }
TbBloc class >> preferencesOn: aBuilder [
	<systemsettings>
	(aBuilder group: #Bloc)
		label: 'Bloc';
		description: 'Bloc settings';
		parent: self preferencesGroup;
		with: [
			(aBuilder pickOne: #preferableHostClass)
				target: self;
				order: 1;
				label: 'Preferable host' ;
				domainValues: (BlHost availableHostClasses collect: [ :aHostClass | aHostClass label -> aHostClass ]);
				description: 'Choose which host to be used for opening spaces'.

			(aBuilder pickOne: #preferableSpartaCanvas)
				target: self;
				order: 2;
				precondition: [ self environment includesKey: #BlSpartaRenderer ];
				label: 'Preferable Sparta renderering backend' ;
				domainValues: ((self environment at: #BlSpartaRenderer) availableCanvasBuilderClasses collect: [ :aBuilderClass | aBuilderClass label -> aBuilderClass ]);
				description: 'Choose which graphical library should be used to render bloc spaces'.
				
			(aBuilder pickOne: #preferableEventHandlerRegistry)
				target: self;
				order: 3;
				label: 'Preferable event handler registry backend' ;
				domainValues: ((BlHandlerRegistry availableRegistryClasses collect: [ :aClass | aClass label -> aClass ]) sort: [ :a :b | a key < b key ]);
				description: 'Choose which data structure should be used for event handler registry'.
				
			(aBuilder pickOne: #preferableChildrenDataStructure)
				target: self;
				order: 4;
				label: 'Preferable children data structure' ;
				domainValues: { BlChildrenArray . BlChildrenRope . BlChildrenLinkedList };
				description: 'Choose which data structure should be used to store element''s children'.

			(aBuilder setting: #assertionsEnabled)
				order: 5;
				target: self;
				label: 'Assertions';
				description: 'Set enabled to turn assertions on or disable to turn them off';
				default: [ true ].
				
			(aBuilder setting: #debugModeEnabled)
				order: 6;
				target: self;
				label: 'Debug Mode';
				description: 'Set enabled to turn extensive debugging mode on or disable to turn it off';
				default: [ false ].
		]
]
