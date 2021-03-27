"
I represent a compulsory ""AND"" combination of multiple distinct keys. (conjunction)
I am useful when there is a need to create a key combination that should be matched when all subcombinations are matching.

Example of a key combination that matches then and only then when both ""arrowLeft"" and ""W"" are pressed:

BlCompulsoryCombination new
	key: Key arrowLeft;
	key: Key w;
	yourself

Unified meta (cmd):

BlCompulsoryCombination new
	with: (BlSingleKeyCombination key: Key arrowLeft);
	with: (BlSingleKeyCombination key: Key w);
	yourself
"
Class {
	#name : #TbCompulsoryCombination,
	#superclass : #TbKeyCombination,
	#instVars : [
		'combinations'
	],
	#category : #'Turbo-Core-Events-KeyBinding'
}

{ #category : #visiting }
TbCompulsoryCombination >> accept: aKeyCombinationVisitor [
	^ aKeyCombinationVisitor visitCompulsory: self
]

{ #category : #accessing }
TbCompulsoryCombination >> combinations [
	<return: #SequenceableCollection of: #BlKeyCombination>
	
	^ combinations
]

{ #category : #testing }
TbCompulsoryCombination >> includes: aKey [
	^ self combinations anySatisfy: [ :aCombination | aCombination includes: aKey ]
]

{ #category : #initialization }
TbCompulsoryCombination >> initialize [
	super initialize.
	
	combinations := OrderedCollection new
]

{ #category : #testing }
TbCompulsoryCombination >> isCompulsory [
	^ true
]

{ #category : #adding }
TbCompulsoryCombination >> key: aKey [
	self with: (TbSingleKeyCombination key: aKey)
]

{ #category : #'key matching' }
TbCompulsoryCombination >> match: aKeyboardBuffer [
	<return: #Number>

	^ self combinations
		detectSum: [ :aCombination | aCombination match: aKeyboardBuffer ]
]

{ #category : #'key matching' }
TbCompulsoryCombination >> matches: aKeyboardBuffer [
	<return: #Boolean>
	
	^ self combinations
		ifEmpty: [ false ]
		ifNotEmpty: [ :theCombinations |
			theCombinations allSatisfy: [ :aCombination | aCombination matches: aKeyboardBuffer ] ]
]

{ #category : #printing }
TbCompulsoryCombination >> printOn: aStream [
	
	aStream nextPut: $(.
	
	self combinations
		do: [ :aCombination | aCombination printOn: aStream ]
		separatedBy: [ aStream nextPutAll: ' & ' ].

	aStream nextPut: $).
]

{ #category : #adding }
TbCompulsoryCombination >> with: aCombination [
	
	aCombination isCompulsory
		ifTrue: [ self combinations addAll: aCombination combinations ]
		ifFalse: [ self combinations add: aCombination ]
]

{ #category : #adding }
TbCompulsoryCombination >> withAll: aCollectionOfCombinations [
	aCollectionOfCombinations do: [ :aCombination | self with: aCombination ]
]
