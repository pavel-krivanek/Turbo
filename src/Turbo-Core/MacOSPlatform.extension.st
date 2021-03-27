Extension { #name : #MacOSPlatform }

{ #category : #'*Turbo-Core' }
MacOSPlatform >> primaryModifier [
	^ BlAlternativeCombination new
		key: BlKeyboardKey metaLeft;
		key: BlKeyboardKey metaRight;
		yourself
]

{ #category : #'*Turbo-Core' }
MacOSPlatform >> secondaryModifier [
	^ BlAlternativeCombination new
		key: BlKeyboardKey controlLeft;
		key: BlKeyboardKey controlRight;
		yourself
]
