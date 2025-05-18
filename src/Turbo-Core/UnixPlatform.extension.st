Extension { #name : 'UnixPlatform' }

{ #category : '*Turbo-Core' }
UnixPlatform >> blocKeyFor: aKeyValue in: aKeyTable [
	<return: #BlKeyboardKey>

	^ aKeyTable valueForUnixPlatform: aKeyValue
]

{ #category : '*Turbo-Core' }
UnixPlatform >> primaryModifier [
	^ TbAlternativeCombination new
		key: TbKeyboardKey controlLeft;
		key: TbKeyboardKey controlRight;
		yourself
]

{ #category : '*Turbo-Core' }
UnixPlatform >> secondaryModifier [
	^ TbAlternativeCombination new
		key: TbKeyboardKey altLeft;
		key: TbKeyboardKey altRight;
		yourself
]
