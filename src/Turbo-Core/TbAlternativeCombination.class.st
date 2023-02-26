"
I represent an alternative ""OR"" combination of multiple distinct keys. (disjunction)

I am very useful to support shortcuts that treat different keyboard keys as identical.
For example there might be two SHIFT keys: SHIFT_L (left shift) and SHIFT_R (right shift). In most cases for the end user there should be no difference between those two.

Here is an example of how to unify two shifts:

BlAlternativeCombination new
	key: Key leftShift;
	key: Key rightShift;
	yourself

Unified meta (cmd):

BlAlternativeCombination new
	with: (BlSingleKeyCombination key: Key leftMeta);
	with: (BlSingleKeyCombination key: Key rightMeta);
	yourself
"
Class {
	#name : #TbAlternativeCombination,
	#superclass : #TbKeyCombination,
	#instVars : [
		'combinations'
	],
	#category : #'Turbo-Core-Events-KeyBinding'
}

{ #category : #visiting }
TbAlternativeCombination >> accept: aKeyCombinationVisitor [
	^ aKeyCombinationVisitor visitAlternative: self
]

{ #category : #accessing }
TbAlternativeCombination >> combinations [
	<return: #SequenceableCollection of: #BlKeyCombination>

	^ combinations
]

{ #category : #testing }
TbAlternativeCombination >> includes: aKey [
	^ self combinations anySatisfy: [ :aCombination | aCombination includes: aKey ]
]

{ #category : #initialization }
TbAlternativeCombination >> initialize [
	super initialize.
	
	"keys := SortedCollection sortBlock: [ :keyA :keyB | keyA keyValue < keyB keyValue ]".
	combinations := OrderedCollection new
]

{ #category : #testing }
TbAlternativeCombination >> isAlternative [
	^ true
]

{ #category : #adding }
TbAlternativeCombination >> key: aKey [
	self with: (TbSingleKeyCombination key: aKey)
]

{ #category : #'key matching' }
TbAlternativeCombination >> match: aKeyboardBuffer [
	<return: #Number>
	
	^ self combinations
		inject: 0
		into: [ :max :aCombination | max max: (aCombination match: aKeyboardBuffer) ]
]

{ #category : #'key matching' }
TbAlternativeCombination >> matches: aKeyboardBuffer [
	<return: #Boolean>

	^ self combinations
		anySatisfy: [ :aCombination | aCombination matches: aKeyboardBuffer ]
]

{ #category : #controlling }
TbAlternativeCombination >> or: anotherKeyCombination [
	<return: #BlKeyCombination>

	^ self with: anotherKeyCombination
]

{ #category : #printing }
TbAlternativeCombination >> printOn: aStream [
	
	aStream nextPut: $(.
	
	self combinations
		do: [ :aCombination | aCombination printOn: aStream ]
		separatedBy: [ aStream nextPutAll: ' | ' ].

	aStream nextPut: $)
]

{ #category : #adding }
TbAlternativeCombination >> with: aCombination [
	aCombination isAlternative
		ifTrue: [ self combinations addAll: aCombination combinations ]
		ifFalse: [ self combinations add: aCombination ]
]

{ #category : #adding }
TbAlternativeCombination >> withAll: aCollectionOfCombinations [
	self combinations addAll: aCollectionOfCombinations
]
