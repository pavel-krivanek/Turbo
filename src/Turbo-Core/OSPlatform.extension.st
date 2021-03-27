Extension { #name : #OSPlatform }

{ #category : #'*Turbo-Core' }
OSPlatform >> blocKeyFor: aKeyValue in: aKeyTable [
	<return: #BlKeyboardKey>

	^ self subclassResponsibility
]

{ #category : #'*Turbo-Core' }
OSPlatform >> primaryModifier [
	^ self subclassResponsibility
]

{ #category : #'*Turbo-Core' }
OSPlatform >> secondaryModifier [
	^ self subclassResponsibility
]
