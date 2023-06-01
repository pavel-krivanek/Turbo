Class {
	#name : #SpTurboBoxWidget,
	#superclass : #SpTurboWidget,
	#category : #'Spec-Turbo-Widgets'
}

{ #category : #'as yet unclassified' }
SpTurboBoxWidget class >> newHorizontal [

	^ self new initializeHorizontal
]

{ #category : #'as yet unclassified' }
SpTurboBoxWidget class >> newVertical [

	^ self new initializeVertical
]

{ #category : #'as yet unclassified' }
SpTurboBoxWidget >> initializeHorizontal [

	self layout: TbLinearLayout horizontal
]

{ #category : #'as yet unclassified' }
SpTurboBoxWidget >> initializeVertical [ 

	self layout: TbLinearLayout vertical.

]

{ #category : #'as yet unclassified' }
SpTurboBoxWidget >> packStart: child expand: expand fill: fill padding: padding [ 

	self addChild: child.
	child constraintsDo: [ :c |
      c horizontal matchParent.
      c vertical matchParent ].

	^ child
]

{ #category : #'as yet unclassified' }
SpTurboBoxWidget >> reversePackEnd: child expand: expand fill: fill padding: padding [ 

	self addChildFirst: child.

	^ child
]
