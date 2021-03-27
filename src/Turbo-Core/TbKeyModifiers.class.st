Class {
	#name : #TbKeyModifiers,
	#superclass : #Object,
	#instVars : [
		'hashKey'
	],
	#category : #'Turbo-Core-Events'
}

{ #category : #'as yet unclassified' }
TbKeyModifiers class >> altMask [
	^ 2r000100
]

{ #category : #'as yet unclassified' }
TbKeyModifiers class >> capsLockMask [
	^ 2r010000
]

{ #category : #'as yet unclassified' }
TbKeyModifiers class >> cmdMask [
	^ 2r001000
]

{ #category : #'as yet unclassified' }
TbKeyModifiers class >> ctrlMask [
	^ 2r000010
]

{ #category : #'as yet unclassified' }
TbKeyModifiers class >> numLockMask [
	^ 2r100000
]

{ #category : #'as yet unclassified' }
TbKeyModifiers class >> shift: shiftBool ctrl: ctrlBool alt: altBool  cmd: cmdBool [
	^ self new
		shift: shiftBool
		ctrl: ctrlBool
		alt: altBool
		cmd: cmdBool
]

{ #category : #'as yet unclassified' }
TbKeyModifiers class >> shift: shiftBool ctrl: ctrlBool alt: altBool  cmd: cmdBool capsLock: capsLockBool	numLock: numLockBool [
	^ self new
		shift: shiftBool
		ctrl: ctrlBool
		alt: altBool
		cmd: cmdBool
		capsLock: capsLockBool
		numLock: numLockBool
]

{ #category : #'as yet unclassified' }
TbKeyModifiers class >> shiftMask [
	^ 2r000001
]

{ #category : #testing }
TbKeyModifiers >> = aKeyModifiers [
	^ self hash = aKeyModifiers hash
]

{ #category : #accessing }
TbKeyModifiers >> alt: altBool [
	hashKey := hashKey bitAt: 3 put: altBool asBit
]

{ #category : #accessing }
TbKeyModifiers >> capsLock: capsLockBool [
	hashKey := hashKey bitAt: 5 put: capsLockBool asBit
]

{ #category : #accessing }
TbKeyModifiers >> cmd: cmdBool [
	hashKey := hashKey bitAt: 4 put: cmdBool asBit
]

{ #category : #accessing }
TbKeyModifiers >> ctrl: ctrlBool [
	hashKey := hashKey bitAt: 2 put: ctrlBool asBit
]

{ #category : #accessing }
TbKeyModifiers >> hash [
	^ hashKey
]

{ #category : #initialization }
TbKeyModifiers >> initialize [
	super initialize.
	hashKey := 2r000000
	
]

{ #category : #testing }
TbKeyModifiers >> isAlt [
	^ hashKey anyMask: self class altMask
]

{ #category : #testing }
TbKeyModifiers >> isCapsLock [
	^ hashKey anyMask: self class capsLockMask
]

{ #category : #testing }
TbKeyModifiers >> isCmd [
	^ hashKey anyMask: self class cmdMask
]

{ #category : #testing }
TbKeyModifiers >> isCtrl [
	^ hashKey anyMask: self class ctrlMask
]

{ #category : #testing }
TbKeyModifiers >> isEmpty [
	^ hashKey = 0
]

{ #category : #testing }
TbKeyModifiers >> isNumLock [
	^ hashKey anyMask: self class numLockMask
]

{ #category : #testing }
TbKeyModifiers >> isPrimaryModifier [
	"Return true if primary modifier is pressed, false otherwise"
	| aPrimaryModifier |
	
	aPrimaryModifier := OSPlatform current primaryModifier.

	(self isCmd and: [ (aPrimaryModifier includes: BlKeyboardKey metaLeft) or: [ (aPrimaryModifier includes: BlKeyboardKey metaRight) ] ])
		ifTrue: [ ^ true ].
		
	(self isCtrl and: [ (aPrimaryModifier includes: BlKeyboardKey controlLeft) or: [ (aPrimaryModifier includes: BlKeyboardKey controlRight) ] ])
		ifTrue: [ ^ true ].

	^ false
]

{ #category : #testing }
TbKeyModifiers >> isShift [
	^ hashKey anyMask: self class shiftMask
]

{ #category : #testing }
TbKeyModifiers >> isSuper [
	^ self isCmd
]

{ #category : #accessing }
TbKeyModifiers >> numLock: numLockBool [
	hashKey := hashKey bitAt: 6 put: numLockBool asBit
]

{ #category : #accessing }
TbKeyModifiers >> printOn: aStream [
	|mods|
	mods := OrderedCollection new.
	self isAlt ifTrue: [ mods add: 'Alt'].
	self isCmd ifTrue: [ mods add:  'Cmd'].
	self isCtrl ifTrue: [ mods add:  'Ctrl'].
	self isShift ifTrue: [ mods add: 'Shift'].
	self isCapsLock ifTrue: [ mods add:  'CapsLock'].
	self isNumLock ifTrue: [ mods add:  'NumLock'].
	aStream nextPutAll: (mods joinUsing: $+) 
	
	
]

{ #category : #accessing }
TbKeyModifiers >> shift: shiftBool [
	hashKey := hashKey bitAt: 1 put: shiftBool asBit
]

{ #category : #initialization }
TbKeyModifiers >> shift: shiftBool ctrl: ctrlBool alt: altBool cmd: cmdBool [
	hashKey := hashKey bitAt: 1 put: shiftBool asBit.
	hashKey := hashKey bitAt: 2 put: ctrlBool asBit.
	hashKey := hashKey bitAt: 3 put: altBool asBit.
	hashKey := hashKey bitAt: 4 put: cmdBool asBit
]

{ #category : #initialization }
TbKeyModifiers >> shift: shiftBool ctrl: ctrlBool alt: altBool cmd: cmdBool capsLock: capsLockBool numLock: numLockBool [
	hashKey := hashKey bitAt: 1 put: shiftBool asBit.
	hashKey := hashKey bitAt: 2 put: ctrlBool asBit.
	hashKey := hashKey bitAt: 3 put: altBool asBit.
	hashKey := hashKey bitAt: 4 put: cmdBool asBit.
	hashKey := hashKey bitAt: 5 put: capsLockBool asBit.
	hashKey := hashKey bitAt: 6 put: numLockBool asBit
]

{ #category : #printing }
TbKeyModifiers >> storeOn: aStream [
	aStream nextPutAll: '('.
	aStream nextPutAll: self class name.
	aStream nextPutAll: ' shift: '.
	aStream store: self isShift.
	aStream nextPutAll: ' ctrl: '.
	aStream store: self isCtrl.
	aStream nextPutAll: ' alt: '.
	aStream store: self isAlt.
	aStream nextPutAll: ' cmd: '.
	aStream store: self isCmd.
	aStream nextPutAll: ' capsLock: '.
	aStream store: self isCapsLock.
	aStream nextPutAll: ' numLock: '.
	aStream store: self isNumLock.
	aStream nextPutAll: ')'
]
