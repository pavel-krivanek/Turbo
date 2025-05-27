Class {
	#name : 'TbMockSurface',
	#superclass : 'Object',
	#instVars : [
		'writes'
	],
	#category : 'Turbo-Tests',
	#package : 'Turbo-Tests'
}

{ #category : 'initialization' }
TbMockSurface >> at: aPoint put: aChar textColor: textColor backgroundColor: bgColor attributes: attrs [ 
    writes at: aPoint put: { aChar. textColor. bgColor. attrs copy }.
]

{ #category : 'initialization' }
TbMockSurface >> initialize [ 
    super initialize.
    writes := Dictionary new.
]

{ #category : 'initialization' }
TbMockSurface >> writtenCharacterAt: aPoint [ 
    | entry |
    entry := self writtenEntryAt: aPoint.
    ^ entry isNil ifTrue: [ nil ] ifFalse: [ entry first ]
]

{ #category : 'initialization' }
TbMockSurface >> writtenEntryAt: aPoint [ 
    ^ writes at: aPoint ifAbsent: [ nil ]
]
