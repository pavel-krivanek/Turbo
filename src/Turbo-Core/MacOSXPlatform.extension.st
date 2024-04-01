Extension { #name : #MacOSXPlatform }

{ #category : #'*Turbo-Core' }
MacOSXPlatform >> blocKeyFor: aKeyValue in: aKeyTable [
	<return: #BlKeyboardKey>

	^ aKeyTable valueForMacOSXPlatform: aKeyValue
]
