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
	combination with: (TbSingleKeyCombination new key: TbKeyboardKey a)
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
	combination with: (TbSingleKeyCombination new key: TbKeyboardKey arrowDown)
]

{ #category : #'keys - navigation' }
TbKeyCombinationBuilder >> arrowLeft [
	combination with: (TbSingleKeyCombination new key: TbKeyboardKey arrowLeft)
]

{ #category : #'keys - navigation' }
TbKeyCombinationBuilder >> arrowRight [
	combination with: (TbSingleKeyCombination new key: TbKeyboardKey arrowRight)
]

{ #category : #'keys - navigation' }
TbKeyCombinationBuilder >> arrowUp [
	combination with: (TbSingleKeyCombination new key: TbKeyboardKey arrowUp)
]

{ #category : #'keys - letters' }
TbKeyCombinationBuilder >> b [
	combination with: (TbSingleKeyCombination new key: TbKeyboardKey b)
]

{ #category : #'keys - special' }
TbKeyCombinationBuilder >> backspace [
	combination
		with: (TbSingleKeyCombination new key: TbKeyboardKey backspace)
]

{ #category : #builder }
TbKeyCombinationBuilder >> build [
	^ self toNormalForm: combination
]

{ #category : #'keys - letters' }
TbKeyCombinationBuilder >> c [
	combination with: (TbSingleKeyCombination new key: TbKeyboardKey c)
]

{ #category : #builder }
TbKeyCombinationBuilder >> cnf [
	converter := TbKeyCombinationConverterCNF new
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
	combination with: (TbSingleKeyCombination new key: TbKeyboardKey d)
]

{ #category : #'keys - special' }
TbKeyCombinationBuilder >> delete [
	combination
		with: (TbSingleKeyCombination new key: TbKeyboardKey delete)
]

{ #category : #builder }
TbKeyCombinationBuilder >> dnf [
	converter := TbKeyCombinationConverterDNF new
]

{ #category : #'keys - letters' }
TbKeyCombinationBuilder >> e [
	combination with: (TbSingleKeyCombination new key: TbKeyboardKey e)
]

{ #category : #'keys - special' }
TbKeyCombinationBuilder >> escape [
	combination
		with: (TbSingleKeyCombination new key: TbKeyboardKey escape)
]

{ #category : #'keys - letters' }
TbKeyCombinationBuilder >> f [
	combination with: (TbSingleKeyCombination new key: TbKeyboardKey f)
]

{ #category : #'keys - letters' }
TbKeyCombinationBuilder >> g [
	combination with: (TbSingleKeyCombination new key: TbKeyboardKey g)
]

{ #category : #initialization }
TbKeyCombinationBuilder >> initialize [
	super initialize.
	
	combination := TbCompulsoryCombination new.
	converter := TbKeyCombinationConverterCNF new
]

{ #category : #accessing }
TbKeyCombinationBuilder >> key: aKey [

	combination
		with: (TbSingleKeyCombination new key: aKey)
]

{ #category : #'keys - letters' }
TbKeyCombinationBuilder >> m [
	combination with: (TbSingleKeyCombination new key: TbKeyboardKey m)
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
	combination with: (TbSingleKeyCombination new key: TbKeyboardKey n)
]

{ #category : #'keys - letters' }
TbKeyCombinationBuilder >> p [
	combination with: (TbSingleKeyCombination new key: TbKeyboardKey p)
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
	combination with: (TbSingleKeyCombination new key: TbKeyboardKey r)
]

{ #category : #'keys - special' }
TbKeyCombinationBuilder >> return [
	combination
		with: (TbSingleKeyCombination new key: TbKeyboardKey return)
]

{ #category : #'keys - letters' }
TbKeyCombinationBuilder >> s [
	combination with: (TbSingleKeyCombination new key: TbKeyboardKey s)
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
		with: (TbSingleKeyCombination new key: TbKeyboardKey tab)
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
