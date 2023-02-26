Extension { #name : #WinPlatform }

{ #category : #'*Turbo-Core' }
WinPlatform >> blocKeyFor: aKeyValue in: aKeyTable [
	<return: #BlKeyboardKey>

	^ aKeyTable valueForWindowsPlatform: aKeyValue
]

{ #category : #'*Turbo-Core' }
WinPlatform >> primaryModifier [
	^ TbAlternativeCombination new
		key: TbKeyboardKey controlLeft;
		key: TbKeyboardKey controlRight;
		yourself
]

{ #category : #'*Turbo-Core' }
WinPlatform >> secondaryModifier [
	^ TbAlternativeCombination new
		key: TbKeyboardKey altLeft;
		key: TbKeyboardKey altRight;
		yourself
]
