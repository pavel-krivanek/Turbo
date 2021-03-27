Extension { #name : #UnixPlatform }

{ #category : #'*Turbo-Core' }
UnixPlatform >> blocKeyFor: aKeyValue in: aKeyTable [
	<return: #BlKeyboardKey>

	^ aKeyTable valueForUnixPlatform: aKeyValue
]

{ #category : #'*Turbo-Core' }
UnixPlatform >> primaryModifier [
	^ BlAlternativeCombination new
		key: BlKeyboardKey controlLeft;
		key: BlKeyboardKey controlRight;
		yourself
]

{ #category : #'*Turbo-Core' }
UnixPlatform >> secondaryModifier [
	^ BlAlternativeCombination new
		key: BlKeyboardKey altLeft;
		key: BlKeyboardKey altRight;
		yourself
]
