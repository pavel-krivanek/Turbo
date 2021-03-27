"
I am helper builder class used to create composite ===BlKeyCombination===

Public API and Key Messages

- build finish combination creation and return result
- control add compulsory control key combination that alternatively matches both left and right control keys
- shift analog to control but adds shift
- meta analog to control but adds meta
- key: add compulsory combination consisting of a single Key
(advanced) cnf - resulting formula will be transformed to CNF (default)(https://en.wikipedia.org/wiki/Conjunctive_normal_form)
(advanced) dnf - resulting formula will be transformed to DNF (https://en.wikipedia.org/wiki/Disjunctive_normal_form)

Example:

   BlKeyCombinationBuilder new
	meta;
	shift;
	key: Key arrowUp;
	build
"
Class {
	#name : #TbKeyCombinationBuilder,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'combination',
		'converter'
	],
	#category : #'Turbo-Core-Events-KeyBinding'
}

{ #category : #'keys - letters' }
TbKeyCombinationBuilder >> a [
	combination with: (BlSingleKeyCombination new key: BlKeyboardKey a)
]

{ #category : #'keys - modifiers' }
TbKeyCombinationBuilder >> alt [
	| alt |

	alt := TbAlternativeCombination new
		key: TbKeyboardKey altLeft;
		key: TbKeyboardKey altRight;
		yourself.

	combination
		with: alt
]

{ #category : #'keys - navigation' }
TbKeyCombinationBuilder >> arrowDown [
	combination with: (BlSingleKeyCombination new key: BlKeyboardKey arrowDown)
]

{ #category : #'keys - navigation' }
TbKeyCombinationBuilder >> arrowLeft [
	combination with: (BlSingleKeyCombination new key: BlKeyboardKey arrowLeft)
]

{ #category : #'keys - navigation' }
TbKeyCombinationBuilder >> arrowRight [
	combination with: (BlSingleKeyCombination new key: BlKeyboardKey arrowRight)
]

{ #category : #'keys - navigation' }
TbKeyCombinationBuilder >> arrowUp [
	combination with: (BlSingleKeyCombination new key: BlKeyboardKey arrowUp)
]

{ #category : #'keys - letters' }
TbKeyCombinationBuilder >> b [
	combination with: (BlSingleKeyCombination new key: BlKeyboardKey b)
]

{ #category : #'keys - special' }
TbKeyCombinationBuilder >> backspace [
	combination
		with: (BlSingleKeyCombination new key: BlKeyboardKey backspace)
]

{ #category : #builder }
TbKeyCombinationBuilder >> build [
	^ self toNormalForm: combination
]

{ #category : #'keys - letters' }
TbKeyCombinationBuilder >> c [
	combination with: (BlSingleKeyCombination new key: BlKeyboardKey c)
]

{ #category : #builder }
TbKeyCombinationBuilder >> cnf [
	converter := BlKeyCombinationConverterCNF new
]

{ #category : #'keys - modifiers' }
TbKeyCombinationBuilder >> control [
	| control |

	control := TbAlternativeCombination new
		key: TbKeyboardKey controlLeft;
		key: TbKeyboardKey controlRight;
		yourself.

	combination
		with: control
]

{ #category : #'keys - letters' }
TbKeyCombinationBuilder >> d [
	combination with: (BlSingleKeyCombination new key: BlKeyboardKey d)
]

{ #category : #'keys - special' }
TbKeyCombinationBuilder >> delete [
	combination
		with: (BlSingleKeyCombination new key: BlKeyboardKey delete)
]

{ #category : #builder }
TbKeyCombinationBuilder >> dnf [
	converter := BlKeyCombinationConverterDNF new
]

{ #category : #'keys - letters' }
TbKeyCombinationBuilder >> e [
	combination with: (BlSingleKeyCombination new key: BlKeyboardKey e)
]

{ #category : #'keys - special' }
TbKeyCombinationBuilder >> escape [
	combination
		with: (BlSingleKeyCombination new key: BlKeyboardKey escape)
]

{ #category : #'keys - letters' }
TbKeyCombinationBuilder >> f [
	combination with: (BlSingleKeyCombination new key: BlKeyboardKey f)
]

{ #category : #'keys - letters' }
TbKeyCombinationBuilder >> g [
	combination with: (BlSingleKeyCombination new key: BlKeyboardKey g)
]

{ #category : #initialization }
TbKeyCombinationBuilder >> initialize [
	super initialize.
	
	combination := BlCompulsoryCombination new.
	converter := BlKeyCombinationConverterCNF new
]

{ #category : #accessing }
TbKeyCombinationBuilder >> key: aKey [

	combination
		with: (BlSingleKeyCombination new key: aKey)
]

{ #category : #'keys - letters' }
TbKeyCombinationBuilder >> m [
	combination with: (BlSingleKeyCombination new key: BlKeyboardKey m)
]

{ #category : #'keys - modifiers' }
TbKeyCombinationBuilder >> meta [
	| meta |

	meta := TbAlternativeCombination new
		key: TbKeyboardKey metaLeft;
		key: TbKeyboardKey metaRight;
		yourself.

	combination
		with: meta
]

{ #category : #'keys - letters' }
TbKeyCombinationBuilder >> n [
	combination with: (BlSingleKeyCombination new key: BlKeyboardKey n)
]

{ #category : #'keys - letters' }
TbKeyCombinationBuilder >> p [
	combination with: (BlSingleKeyCombination new key: BlKeyboardKey p)
]

{ #category : #'keys - modifiers' }
TbKeyCombinationBuilder >> primary [
	"I add a primary modifier to the key combination
	On Mac: Command (Meta).
	On Windows: Control
	On Linux: Control"
	
	combination with: OSPlatform current primaryModifier
]

{ #category : #'keys - letters' }
TbKeyCombinationBuilder >> r [
	combination with: (BlSingleKeyCombination new key: BlKeyboardKey r)
]

{ #category : #'keys - special' }
TbKeyCombinationBuilder >> return [
	combination
		with: (BlSingleKeyCombination new key: BlKeyboardKey return)
]

{ #category : #'keys - letters' }
TbKeyCombinationBuilder >> s [
	combination with: (BlSingleKeyCombination new key: BlKeyboardKey s)
]

{ #category : #'keys - modifiers' }
TbKeyCombinationBuilder >> secondary [
	"I add a secondary modifier to the key combination
	On Mac: Control (Meta).
	On Windows: Alt
	On Linux: Alt"

	combination with: OSPlatform current secondaryModifier
]

{ #category : #'keys - modifiers' }
TbKeyCombinationBuilder >> shift [
	| shift |

	shift := TbAlternativeCombination new
		key: TbKeyboardKey shiftLeft;
		key: TbKeyboardKey shiftRight;
		yourself.
		
	combination
		with: shift
]

{ #category : #'keys - special' }
TbKeyCombinationBuilder >> tab [
	combination
		with: (BlSingleKeyCombination new key: BlKeyboardKey tab)
]

{ #category : #private }
TbKeyCombinationBuilder >> toNormalForm: aKeyCombination [
	"Converts a given key combination to a normal form (CNF or DNF)
	(https://en.wikipedia.org/wiki/Conjunctive_normal_form)
	(https://en.wikipedia.org/wiki/Disjunctive_normal_form)"
	<return: #BlKeyCombination>

	^ aKeyCombination accept: converter
]

{ #category : #'keys - letters' }
TbKeyCombinationBuilder >> v [
	combination with: (TbSingleKeyCombination new key: TbKeyboardKey v)
]

{ #category : #'keys - letters' }
TbKeyCombinationBuilder >> w [
	combination with: (TbSingleKeyCombination new key: TbKeyboardKey w)
]

{ #category : #'keys - letters' }
TbKeyCombinationBuilder >> x [
	combination with: (TbSingleKeyCombination new key: TbKeyboardKey x)
]
