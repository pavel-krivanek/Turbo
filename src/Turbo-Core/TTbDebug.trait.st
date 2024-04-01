"
I contain useful debug utility methods that can be enabled / disabled with:

[[[
	Bloc enableAssertions.
	Bloc disableAssertions.
]]]
"
Trait {
	#name : #TTbDebug,
	#category : #'Turbo-Core-Utilities - Debugging'
}

{ #category : #'debug - asserting' }
TTbDebug classSide >> assert: aBlock [
	"Throw an assertion error if aBlock does not evaluates to true.
	We check for true explicitly to make the assertion fail for non booleans.
	
	Note: Should be enabled with ===Bloc enableAssertions==="
	
	self assertionsEnabled
		ifTrue: [ aBlock value == true ifFalse: [ AssertionFailure signal: 'Assertion failed' ] ]
]

{ #category : #'debug - asserting' }
TTbDebug classSide >> assert: aBlock description: aStringOrBlock [
	"Throw an assertion error if aBlock does not evaluates to true.
	
	Note: Should be enabled with ===Bloc enableAssertions==="

	self assertionsEnabled
		ifTrue: [ aBlock value == true ifFalse: [ AssertionFailure signal: aStringOrBlock value ] ]
]

{ #category : #'debug - asserting' }
TTbDebug classSide >> assertionsEnabled [
	<return: #Boolean>

	^ TbBloc assertionsEnabled
]

{ #category : #'debug - asserting' }
TTbDebug >> assert: aBlock [
	"Throw an assertion error if aBlock does not evaluates to true"
	
	self class assert: aBlock
]

{ #category : #'debug - asserting' }
TTbDebug >> assert: aBlock description: aStringOrBlock [
	"Throw an assertion error if aBlock does not evaluates to true."

	self class assert: aBlock description: aStringOrBlock
]
