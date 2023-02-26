"
I am a shortcut registry and contain a collection of ===BlShortcut===
"
Class {
	#name : #TbShortcutRegistry,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'shortcuts'
	],
	#category : #'Turbo-Core-Events-KeyBinding'
}

{ #category : #'adding / removing' }
TbShortcutRegistry >> add: aBlShortcut [
	self shortcuts add: aBlShortcut
]

{ #category : #'adding / removing' }
TbShortcutRegistry >> addAll: aCollectionOfaBlShortcut [
	self shortcuts addAll: aCollectionOfaBlShortcut
]

{ #category : #initialization }
TbShortcutRegistry >> initialize [
	super initialize.
	
	shortcuts := OrderedCollection new
]

{ #category : #'adding / removing' }
TbShortcutRegistry >> remove: aBlShortcut [
	self shortcuts remove: aBlShortcut
]

{ #category : #accessing }
TbShortcutRegistry >> shortcuts [
	^ shortcuts
]

{ #category : #accessing }
TbShortcutRegistry >> shortcuts: anObject [
	shortcuts := anObject
]
