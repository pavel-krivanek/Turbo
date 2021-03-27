"
!! Code generation

Instance creation methods for the english alphabet are generated using the following script

[[[
			
($A to: $Z) do: [ :c | BlKeyboardKey class compile: c asString uncapitalized, '
	<return: #', BlKeyboardKey name, '>
	^ self named: #', c asString classified: 'keys - letters' ].

#(zero one two three four five six seven eight nine) withIndexDo: [ :n :i | BlKeyboardKey class compile: n asString, '
	<return: #', BlKeyboardKey name, '>
	^ self named: #''', (i - 1) asString, '''' classified: 'keys - digits' ].

(1 to: 12) do: [ :n | BlKeyboardKey class compile: 'F', n asString, '
	<return: #', BlKeyboardKey name, '>
	^ self named: #F', n asString classified: 'keys - functions' ].

#(Return Tab Space Delete Escape CapsLock Function Backspace) do: [ :n | BlKeyboardKey class compile: n uncapitalized asString, '
	<return: #', BlKeyboardKey name, '>
	^ self named: #', n asString classified: 'keys - special' ].

#(VolumeUp VolumeDown Mute) do: [ :n | BlKeyboardKey class compile: n uncapitalized asString, '
	<return: #', BlKeyboardKey name, '>
	^ self named: #', n asString classified: 'keys - sound' ].

#(PageUp PageDown ArrowLeft ArrowRight ArrowUp ArrowDown Home) do: [ :n | BlKeyboardKey class compile: n uncapitalized asString, '
	<return: #', BlKeyboardKey name, '>
	^ self named: #', n asString classified: 'keys - navigation' ].

#(MetaLeft MetaRight ShiftLeft ShiftRight ControlLeft ControlRight AltLeft AltRight) do: [ :n | BlKeyboardKey class compile: n uncapitalized asString, '
	<return: #', BlKeyboardKey name, '>
	^ self named: #', n asString classified: 'keys - modifiers' ].

#(Minus Equal LeftBracket RightBracket Quote Semicolon Backslash Comma Slash Period Grave) do: [ :n | BlKeyboardKey class compile: n uncapitalized asString, '
	<return: #', BlKeyboardKey name, '>
	^ self named: #', n asString classified: 'keys - symbols' ].

]]]
"
Class {
	#name : #TbKeyboardKey,
	#superclass : #Object,
	#instVars : [
		'value',
		'name'
	],
	#category : #'Turbo-Core-Events-KeyBinding'
}

{ #category : #'keys - functions' }
TbKeyboardKey class >> F1 [
	<return: #BlKeyboardKey>
	^ self named: #F1
]

{ #category : #'keys - functions' }
TbKeyboardKey class >> F10 [
	<return: #BlKeyboardKey>
	^ self named: #F10
]

{ #category : #'keys - functions' }
TbKeyboardKey class >> F11 [
	<return: #BlKeyboardKey>
	^ self named: #F11
]

{ #category : #'keys - functions' }
TbKeyboardKey class >> F12 [
	<return: #BlKeyboardKey>
	^ self named: #F12
]

{ #category : #'keys - functions' }
TbKeyboardKey class >> F2 [
	<return: #BlKeyboardKey>
	^ self named: #F2
]

{ #category : #'keys - functions' }
TbKeyboardKey class >> F3 [
	<return: #BlKeyboardKey>
	^ self named: #F3
]

{ #category : #'keys - functions' }
TbKeyboardKey class >> F4 [
	<return: #BlKeyboardKey>
	^ self named: #F4
]

{ #category : #'keys - functions' }
TbKeyboardKey class >> F5 [
	<return: #BlKeyboardKey>
	^ self named: #F5
]

{ #category : #'keys - functions' }
TbKeyboardKey class >> F6 [
	<return: #BlKeyboardKey>
	^ self named: #F6
]

{ #category : #'keys - functions' }
TbKeyboardKey class >> F7 [
	<return: #BlKeyboardKey>
	^ self named: #F7
]

{ #category : #'keys - functions' }
TbKeyboardKey class >> F8 [
	<return: #BlKeyboardKey>
	^ self named: #F8
]

{ #category : #'keys - functions' }
TbKeyboardKey class >> F9 [
	<return: #BlKeyboardKey>
	^ self named: #F9
]

{ #category : #'keys - letters' }
TbKeyboardKey class >> a [
	<return: #BlKeyboardKey>
	^ self named: #A
]

{ #category : #'keys - modifiers' }
TbKeyboardKey class >> altLeft [
	<return: #BlKeyboardKey>
	^ self named: #AltLeft
]

{ #category : #'keys - modifiers' }
TbKeyboardKey class >> altRight [
	<return: #BlKeyboardKey>
	^ self named: #AltRight
]

{ #category : #'keys - navigation' }
TbKeyboardKey class >> arrowDown [
	<return: #BlKeyboardKey>
	^ self named: #ArrowDown
]

{ #category : #'keys - navigation' }
TbKeyboardKey class >> arrowLeft [
	<return: #BlKeyboardKey>
	^ self named: #ArrowLeft
]

{ #category : #'keys - navigation' }
TbKeyboardKey class >> arrowRight [
	<return: #BlKeyboardKey>
	^ self named: #ArrowRight
]

{ #category : #'keys - navigation' }
TbKeyboardKey class >> arrowUp [
	<return: #BlKeyboardKey>
	^ self named: #ArrowUp
]

{ #category : #'keys - letters' }
TbKeyboardKey class >> b [
	<return: #BlKeyboardKey>
	^ self named: #B
]

{ #category : #'keys - symbols' }
TbKeyboardKey class >> backslash [
	<return: #BlKeyboardKey>
	^ self named: #Backslash
]

{ #category : #'keys - special' }
TbKeyboardKey class >> backspace [
	<return: #BlKeyboardKey>
	^ self named: #Backspace
]

{ #category : #'keys - letters' }
TbKeyboardKey class >> c [
	<return: #BlKeyboardKey>
	^ self named: #C
]

{ #category : #'keys - special' }
TbKeyboardKey class >> capsLock [
	<return: #BlKeyboardKey>
	^ self named: #CapsLock
]

{ #category : #'keys - symbols' }
TbKeyboardKey class >> comma [
	<return: #BlKeyboardKey>
	^ self named: #Comma
]

{ #category : #'keys - modifiers' }
TbKeyboardKey class >> controlLeft [
	<return: #BlKeyboardKey>
	^ self named: #ControlLeft
]

{ #category : #'keys - modifiers' }
TbKeyboardKey class >> controlRight [
	<return: #BlKeyboardKey>
	^ self named: #ControlRight
]

{ #category : #'keys - letters' }
TbKeyboardKey class >> d [
	<return: #BlKeyboardKey>
	^ self named: #D
]

{ #category : #'keys - special' }
TbKeyboardKey class >> delete [
	<return: #BlKeyboardKey>
	^ self named: #Delete
]

{ #category : #'keys - letters' }
TbKeyboardKey class >> e [
	<return: #BlKeyboardKey>
	^ self named: #E
]

{ #category : #'keys - digits' }
TbKeyboardKey class >> eight [
	<return: #BlKeyboardKey>
	^ self named: #'8'
]

{ #category : #'keys - symbols' }
TbKeyboardKey class >> equal [
	<return: #BlKeyboardKey>
	^ self named: #Equal
]

{ #category : #'keys - special' }
TbKeyboardKey class >> escape [
	<return: #BlKeyboardKey>
	^ self named: #Escape
]

{ #category : #'keys - letters' }
TbKeyboardKey class >> f [
	<return: #BlKeyboardKey>
	^ self named: #F
]

{ #category : #'keys - digits' }
TbKeyboardKey class >> five [
	<return: #BlKeyboardKey>
	^ self named: #'5'
]

{ #category : #'keys - digits' }
TbKeyboardKey class >> four [
	<return: #BlKeyboardKey>
	^ self named: #'4'
]

{ #category : #'keys - special' }
TbKeyboardKey class >> function [
	<return: #BlKeyboardKey>
	^ self named: #Function
]

{ #category : #'keys - letters' }
TbKeyboardKey class >> g [
	<return: #BlKeyboardKey>
	^ self named: #G
]

{ #category : #'keys - symbols' }
TbKeyboardKey class >> grave [
	<return: #BlKeyboardKey>
	^ self named: #Grave
]

{ #category : #'keys - letters' }
TbKeyboardKey class >> h [
	<return: #BlKeyboardKey>
	^ self named: #H
]

{ #category : #'keys - navigation' }
TbKeyboardKey class >> home [
	<return: #BlKeyboardKey>
	^ self named: #Home
]

{ #category : #'keys - letters' }
TbKeyboardKey class >> i [
	<return: #BlKeyboardKey>
	^ self named: #I
]

{ #category : #'keys - letters' }
TbKeyboardKey class >> j [
	<return: #BlKeyboardKey>
	^ self named: #J
]

{ #category : #'keys - letters' }
TbKeyboardKey class >> k [
	<return: #BlKeyboardKey>
	^ self named: #K
]

{ #category : #'keys - letters' }
TbKeyboardKey class >> l [
	<return: #BlKeyboardKey>
	^ self named: #L
]

{ #category : #'keys - symbols' }
TbKeyboardKey class >> leftBracket [
	<return: #BlKeyboardKey>
	^ self named: #LeftBracket
]

{ #category : #'keys - letters' }
TbKeyboardKey class >> m [
	<return: #BlKeyboardKey>
	^ self named: #M
]

{ #category : #'keys - modifiers' }
TbKeyboardKey class >> metaLeft [
	<return: #BlKeyboardKey>
	^ self named: #MetaLeft
]

{ #category : #'keys - modifiers' }
TbKeyboardKey class >> metaRight [
	<return: #BlKeyboardKey>
	^ self named: #MetaRight
]

{ #category : #'keys - symbols' }
TbKeyboardKey class >> minus [
	<return: #BlKeyboardKey>
	^ self named: #Minus
]

{ #category : #'keys - sound' }
TbKeyboardKey class >> mute [
	<return: #BlKeyboardKey>
	^ self named: #Mute
]

{ #category : #'keys - letters' }
TbKeyboardKey class >> n [
	<return: #BlKeyboardKey>
	^ self named: #N
]

{ #category : #'instance creation' }
TbKeyboardKey class >> named: aName [
	<return: #BlKeyboardKey>

	^ self new withName: aName
]

{ #category : #'keys - digits' }
TbKeyboardKey class >> nine [
	<return: #BlKeyboardKey>
	^ self named: #'9'
]

{ #category : #'keys - letters' }
TbKeyboardKey class >> o [
	<return: #BlKeyboardKey>
	^ self named: #O
]

{ #category : #'keys - digits' }
TbKeyboardKey class >> one [
	<return: #BlKeyboardKey>
	^ self named: #'1'
]

{ #category : #'keys - letters' }
TbKeyboardKey class >> p [
	<return: #BlKeyboardKey>
	^ self named: #P
]

{ #category : #'keys - navigation' }
TbKeyboardKey class >> pageDown [
	<return: #BlKeyboardKey>
	^ self named: #PageDown
]

{ #category : #'keys - navigation' }
TbKeyboardKey class >> pageUp [
	<return: #BlKeyboardKey>
	^ self named: #PageUp
]

{ #category : #'keys - symbols' }
TbKeyboardKey class >> period [
	<return: #BlKeyboardKey>
	^ self named: #Period
]

{ #category : #'keys - letters' }
TbKeyboardKey class >> q [
	<return: #BlKeyboardKey>
	^ self named: #Q
]

{ #category : #'keys - symbols' }
TbKeyboardKey class >> quote [
	<return: #BlKeyboardKey>
	^ self named: #Quote
]

{ #category : #'keys - letters' }
TbKeyboardKey class >> r [
	<return: #BlKeyboardKey>
	^ self named: #R
]

{ #category : #'keys - special' }
TbKeyboardKey class >> return [
	<return: #BlKeyboardKey>
	^ self named: #Return
]

{ #category : #'keys - symbols' }
TbKeyboardKey class >> rightBracket [
	<return: #BlKeyboardKey>
	^ self named: #RightBracket
]

{ #category : #'keys - letters' }
TbKeyboardKey class >> s [
	<return: #BlKeyboardKey>
	^ self named: #S
]

{ #category : #'keys - symbols' }
TbKeyboardKey class >> semicolon [
	<return: #BlKeyboardKey>
	^ self named: #Semicolon
]

{ #category : #'keys - digits' }
TbKeyboardKey class >> seven [
	<return: #BlKeyboardKey>
	^ self named: #'7'
]

{ #category : #'keys - modifiers' }
TbKeyboardKey class >> shiftLeft [
	<return: #BlKeyboardKey>
	^ self named: #ShiftLeft
]

{ #category : #'keys - modifiers' }
TbKeyboardKey class >> shiftRight [
	<return: #BlKeyboardKey>
	^ self named: #ShiftRight
]

{ #category : #'keys - digits' }
TbKeyboardKey class >> six [
	<return: #BlKeyboardKey>
	^ self named: #'6'
]

{ #category : #'keys - symbols' }
TbKeyboardKey class >> slash [
	<return: #BlKeyboardKey>
	^ self named: #Slash
]

{ #category : #'keys - special' }
TbKeyboardKey class >> space [
	<return: #BlKeyboardKey>
	^ self named: #Space
]

{ #category : #'keys - letters' }
TbKeyboardKey class >> t [
	<return: #BlKeyboardKey>
	^ self named: #T
]

{ #category : #'keys - special' }
TbKeyboardKey class >> tab [
	<return: #BlKeyboardKey>
	^ self named: #Tab
]

{ #category : #'keys - digits' }
TbKeyboardKey class >> three [
	<return: #BlKeyboardKey>
	^ self named: #'3'
]

{ #category : #'keys - digits' }
TbKeyboardKey class >> two [
	<return: #BlKeyboardKey>
	^ self named: #'2'
]

{ #category : #'keys - letters' }
TbKeyboardKey class >> u [
	<return: #BlKeyboardKey>
	^ self named: #U
]

{ #category : #'instance creation' }
TbKeyboardKey class >> unknown [
	<return: #BlKeyboardKey>

	^ self named: self unknownKeyName
]

{ #category : #'instance creation' }
TbKeyboardKey class >> unknown: aValue [
	<return: #BlKeyboardKey>

	^ self unknown setValue: aValue
]

{ #category : #accessing }
TbKeyboardKey class >> unknownKeyName [
	^ #Unknown
]

{ #category : #'keys - letters' }
TbKeyboardKey class >> v [
	<return: #BlKeyboardKey>
	^ self named: #V
]

{ #category : #'keys - sound' }
TbKeyboardKey class >> volumeDown [
	<return: #BlKeyboardKey>
	^ self named: #VolumeDown
]

{ #category : #'keys - sound' }
TbKeyboardKey class >> volumeUp [
	<return: #BlKeyboardKey>
	^ self named: #VolumeUp
]

{ #category : #'keys - letters' }
TbKeyboardKey class >> w [
	<return: #BlKeyboardKey>
	^ self named: #W
]

{ #category : #'keys - letters' }
TbKeyboardKey class >> x [
	<return: #BlKeyboardKey>
	^ self named: #X
]

{ #category : #'keys - letters' }
TbKeyboardKey class >> y [
	<return: #BlKeyboardKey>
	^ self named: #Y
]

{ #category : #'keys - letters' }
TbKeyboardKey class >> z [
	<return: #BlKeyboardKey>
	^ self named: #Z
]

{ #category : #'keys - digits' }
TbKeyboardKey class >> zero [
	<return: #BlKeyboardKey>
	^ self named: #'0'
]

{ #category : #comparing }
TbKeyboardKey >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	
	self isUnkownKey = anObject isUnkownKey
		ifFalse: [ ^ false ].
	
	^ self isUnkownKey
		ifTrue: [ value = anObject value ]
		ifFalse: [ name = anObject name ]
]

{ #category : #comparing }
TbKeyboardKey >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ self isUnkownKey
		ifTrue: [ value hash ]
		ifFalse: [ name hash ]
]

{ #category : #initialization }
TbKeyboardKey >> initialize [
	super initialize.
	
	name := self class unknownKeyName.
	value := nil
]

{ #category : #testing }
TbKeyboardKey >> isArrowLeft [
	^ self = self class arrowLeft
]

{ #category : #testing }
TbKeyboardKey >> isArrowRight [
	^ self = self class arrowRight
]

{ #category : #testing }
TbKeyboardKey >> isEscape [
	^ self = self class escape
]

{ #category : #testing }
TbKeyboardKey >> isUnkownKey [
	<return: #Boolean>

	 ^ self name == self class unknownKeyName
]

{ #category : #accessing }
TbKeyboardKey >> name [
	<return: #Symbol>

	^ name
]

{ #category : #printing }
TbKeyboardKey >> printOn: aStream [
	aStream
		nextPutAll: 'Key ';
		nextPutAll: name;
		nextPutAll: ' code: (';
		print: value;
		nextPutAll: ')'
]

{ #category : #private }
TbKeyboardKey >> setValue: aValue [
	value := aValue
]

{ #category : #accessing }
TbKeyboardKey >> value [
	"Return a platform and host specific value behind the key.
	I am useless for a typical user and have only debugging purpose"
	<return: #Number>
	
	^ value
]

{ #category : #initialization }
TbKeyboardKey >> withName: aName [
	name := aName asSymbol
]
