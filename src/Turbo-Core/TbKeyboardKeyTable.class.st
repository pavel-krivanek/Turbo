Class {
	#name : #TbKeyboardKeyTable,
	#superclass : #Object,
	#category : #'Turbo-Core-Universe'
}

{ #category : #initialization }
TbKeyboardKeyTable >> initialize: aMapDictionary with: aMapArray [
	aMapArray pairsDo: [ :eachCode :eachName |
		| aName |
		
		aName := (BlKeyboardKey respondsTo: eachName)
			ifTrue: [ eachName ]
			ifFalse: [ (BlKeyboardKey respondsTo: eachName uncapitalized)
				ifTrue: [ eachName uncapitalized ]
				ifFalse: [ #unknown ] ].

		aMapDictionary at: eachCode put: ((BlKeyboardKey perform: aName) setValue: eachCode) ]
]

{ #category : #'api - converting' }
TbKeyboardKeyTable >> keyFromScanCode: aScanCode [
	<return: #BlKeyboardKey>

	^ self subclassResponsibility
]
