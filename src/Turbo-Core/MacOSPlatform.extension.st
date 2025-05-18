Extension { #name : 'MacOSPlatform' }

{ #category : '*Turbo-Core' }
MacOSPlatform >> primaryModifier [
	^ TbAlternativeCombination new
		key: TbKeyboardKey metaLeft;
		key: TbKeyboardKey metaRight;
		yourself
]

{ #category : '*Turbo-Core' }
MacOSPlatform >> secondaryModifier [
	^ TbAlternativeCombination new
		key: TbKeyboardKey controlLeft;
		key: TbKeyboardKey controlRight;
		yourself
]
