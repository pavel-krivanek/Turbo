Extension { #name : #WinPlatform }

{ #category : #'*Turbo-Core' }
WinPlatform >> blocKeyFor: aKeyValue in: aKeyTable [
	<return: #BlKeyboardKey>

	^ aKeyTable valueForWindowsPlatform: aKeyValue
]

{ #category : #'*Turbo-Core' }
WinPlatform >> primaryModifier [
	^ BlAlternativeCombination new
		key: BlKeyboardKey controlLeft;
		key: BlKeyboardKey controlRight;
		yourself
]

{ #category : #'*Turbo-Core' }
WinPlatform >> secondaryModifier [
	^ BlAlternativeCombination new
		key: BlKeyboardKey altLeft;
		key: BlKeyboardKey altRight;
		yourself
]
