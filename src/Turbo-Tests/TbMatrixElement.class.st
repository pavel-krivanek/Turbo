Class {
	#name : 'TbMatrixElement',
	#superclass : 'TbElement',
	#category : 'Turbo-Tests-Math',
	#package : 'Turbo-Tests',
	#tag : 'Math'
}

{ #category : 'as yet unclassified' }
TbMatrixElement >> drawOnTurboCanvas: aCanvas [

	aCanvas at: 1@1 write: '1234567890123456789012345678901234567890'.
	aCanvas at: 1@2 write: '1234567890123456789012345678901234567890'.
	aCanvas at: 1@3 write: '1234567890123456789012345678901234567890'.
	aCanvas at: 1@4 write: '1234567890123456789012345678901234567890'.
	aCanvas at: 1@5 write: '1234567890123456789012345678901234567890'.
	aCanvas at: 1@6 write: '1234567890123456789012345678901234567890'.
	aCanvas at: 1@7 write: '1234567890123456789012345678901234567890'.
	aCanvas at: 1@8 write: '1234567890123456789012345678901234567890'.
]
