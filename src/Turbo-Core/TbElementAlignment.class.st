"
I represent alignment layout property.

I calculate needed horizontal and vertical translation of BlElement to be aligned to the left, middle or to the right within allowed bounds.

I may be used by layout strategies that support alignment, for example Frame Layout

Public API and Key Messages

- horizontalTranslationFor: elementBounds in: allowedBounds calculate horizontal translation
- verticalTranslationFor: elementBounds in: allowedBounds calculate vertical translation
- #new to create instances.
 
Internal Representation and Key Implementation Points.
both element and allowed bounds should be in element's parent coordinate system
"
Class {
	#name : 'TbElementAlignment',
	#superclass : 'Object',
	#classInstVars : [
		'end',
		'horizontal',
		'middle',
		'null',
		'start',
		'vertical'
	],
	#category : 'Turbo-Core-Layouts-Support',
	#package : 'Turbo-Core',
	#tag : 'Layouts-Support'
}

{ #category : 'factory' }
TbElementAlignment class >> bottom [
	^ self vertical end
]

{ #category : 'factory' }
TbElementAlignment class >> center [
	^ self middle
]

{ #category : 'factory' }
TbElementAlignment class >> end [
	^ end
]

{ #category : 'factory' }
TbElementAlignment class >> horizontal [
	^ horizontal
]

{ #category : 'class initialization' }
TbElementAlignment class >> initialize [
	super initialize.
	
	start := TbStartAlignment new.
	middle := TbMiddleAlignment new.
	end := TbEndAlignment new.
	null := TbNullAlignment new.
	horizontal := TbHorizontalAlignment new.
	vertical := TbVerticalAlignment new
]

{ #category : 'factory' }
TbElementAlignment class >> left [
	^ self horizontal class left
]

{ #category : 'factory' }
TbElementAlignment class >> null [
	^ null
]

{ #category : 'factory' }
TbElementAlignment class >> right [
	^ self horizontal class right
]

{ #category : 'factory' }
TbElementAlignment class >> start [
	^ start
]

{ #category : 'factory' }
TbElementAlignment class >> top [
	^ self vertical start
]

{ #category : 'factory' }
TbElementAlignment class >> vertical [
	^ vertical
]

{ #category : 'composition' }
TbElementAlignment >> + anElementAlignment [
	^ self subclassResponsibility
]

{ #category : 'comparing' }
TbElementAlignment >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	^ self class = anObject class
]

{ #category : 'comparing' }
TbElementAlignment >> hash [
	^ self class hash
]

{ #category : 'testing' }
TbElementAlignment >> ifNotNull: aBlock [
	aBlock value
]

{ #category : 'testing' }
TbElementAlignment >> ifNull: aBlock [
	"not null"
]

{ #category : 'initialization' }
TbElementAlignment >> initialize [
	super initialize.
	
	
]

{ #category : 'translation' }
TbElementAlignment >> translationOf: aBounds in: aContainerBounds [
	^ self subclassResponsibility
]
