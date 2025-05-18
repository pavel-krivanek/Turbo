"
I am a visitor for ===BlKeyCombination=== composition tree.
See my subclasses for all available visitors.

Example:

	result := keyCombination accept: visitor
"
Class {
	#name : 'TbKeyCombinationVisitor',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#category : 'Turbo-Core-Events-KeyBinding',
	#package : 'Turbo-Core',
	#tag : 'Events-KeyBinding'
}

{ #category : 'visiting' }
TbKeyCombinationVisitor >> visitAlternative: aBlAlternativeCombination [
]

{ #category : 'visiting' }
TbKeyCombinationVisitor >> visitCompulsory: aBlCompulsoryCombination [
]

{ #category : 'visiting' }
TbKeyCombinationVisitor >> visitKey: aBlKeyCodeCombination [
]
