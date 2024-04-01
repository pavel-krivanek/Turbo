"
I transform composite key combination formula into a CNF (https://en.wikipedia.org/wiki/Conjunctive_normal_form)
"
Class {
	#name : #TbKeyCombinationConverterCNF,
	#superclass : #TbKeyCombinationVisitor,
	#category : #'Turbo-Core-Events-KeyBinding'
}

{ #category : #visiting }
TbKeyCombinationConverterCNF >> visitAlternative: aBlAlternativeCombination [
	| combinations pairedCompulsories alternative |

	"every element in combinations set is compulsory,
	however there is a logical OR between all of them"
	combinations := aBlAlternativeCombination combinations
		collect: [ :aCombination | aCombination accept: self ].

	self
		assert: [ combinations isNotEmpty ]
		description: [ 'Combinations can not be empty!' ].

	combinations size = 1
		ifTrue: [ ^ combinations first ].

	pairedCompulsories := combinations pairsCollect: [ :left :right |
		TbCompulsoryCombination new withAll: (left combinations collect: [ :eachLeft |
			right combinations collect: [ :eachRight |
				TbAlternativeCombination new withAll: { eachLeft . eachRight } ] ]) flattened ].
	
	combinations size = 2
		ifTrue: [ ^ pairedCompulsories first ].
	
	alternative := TbAlternativeCombination new.
	alternative withAll: pairedCompulsories. 
	combinations size odd
		ifTrue: [ alternative with: combinations last ].	
	
	^ alternative accept: self.
]

{ #category : #visiting }
TbKeyCombinationConverterCNF >> visitCompulsory: aBlCompulsoryCombination [
	| compulsory |

	compulsory := TbCompulsoryCombination new.

	aBlCompulsoryCombination combinations do: [ :aCombination |
		compulsory withAll: (aCombination accept: self) combinations ].
	
	^ compulsory
]

{ #category : #visiting }
TbKeyCombinationConverterCNF >> visitKey: aBlKeyCodeCombination [
	^ TbCompulsoryCombination new with: aBlKeyCodeCombination
]
