"
I represent a key combination that consists of one distinct key.

I am play a role of a leaf in ===BlKeyCombination=== composition tree.

Public API and Key Messages

- key: initialize me with a given Key
- key return an instance of Key that I represent as combination

 Examples:

	BlSingleKeyCombination key: Key arrowUp
	
	BlSingleKeyCombination new
		key: Key arrowUp
 
Internal Representation and Key Implementation Points.

    Instance Variables
	key:		<Key>


    Implementation Points

	#matches: returns true if key is pressed, which does not enforce the fact that there should be only one pressed key at a time
	
	#match: return 1 if I match any pressed key and 0 otherwise
"
Class {
	#name : 'TbSingleKeyCombination',
	#superclass : 'TbKeyCombination',
	#instVars : [
		'key'
	],
	#category : 'Turbo-Core-Events-KeyBinding',
	#package : 'Turbo-Core',
	#tag : 'Events-KeyBinding'
}

{ #category : 'accessing' }
TbSingleKeyCombination class >> key: aKey [
	^ self new key: aKey
]

{ #category : 'visiting' }
TbSingleKeyCombination >> accept: aKeyCombinationVisitor [
	^ aKeyCombinationVisitor visitKey: self
]

{ #category : 'key matching' }
TbSingleKeyCombination >> includes: aKey [
	^ self key = aKey
]

{ #category : 'accessing' }
TbSingleKeyCombination >> key [
	<return: #BlKeyboardKey>

	^ key
]

{ #category : 'accessing' }
TbSingleKeyCombination >> key: aKey [
	self
		assert: [ aKey isNotNil ]
		description: [ 'Key must not be nil' ].

	key := aKey
]

{ #category : 'key matching' }
TbSingleKeyCombination >> match: aKeyboardBuffer [
	<return: #Number>

	^ (self matches: aKeyboardBuffer) asBit
]

{ #category : 'key matching' }
TbSingleKeyCombination >> matches: aKeyboardBuffer [
	<return: #Boolean>

	^ aKeyboardBuffer isPressed: self key
]

{ #category : 'printing' }
TbSingleKeyCombination >> printOn: aStream [
	aStream nextPutAll: self key name asString
]
