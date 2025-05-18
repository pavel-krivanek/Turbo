Class {
	#name : 'TbBasicLayoutWithPadding',
	#superclass : 'TbBasicLayout',
	#instVars : [
		'topLeftPadding',
		'bottomRightPadding'
	],
	#category : 'Turbo-Core-Layouts-Basic',
	#package : 'Turbo-Core',
	#tag : 'Layouts-Basic'
}

{ #category : 'accessing' }
TbBasicLayoutWithPadding >> bottomRightPadding [

	^ bottomRightPadding
]

{ #category : 'accessing' }
TbBasicLayoutWithPadding >> bottomRightPadding: anObject [

	bottomRightPadding := anObject
]

{ #category : 'protected' }
TbBasicLayoutWithPadding >> initialize [ 

	super initialize.
	topLeftPadding := 0@0.
	bottomRightPadding := 0@0.
]

{ #category : 'protected' }
TbBasicLayoutWithPadding >> layout: anElement in: aRectangle [

	anElement children accountedByLayout do: [ :child |
		child applyLayoutIn: (child measuredBounds asRectangle translateBy: topLeftPadding) ].

	self layoutIgnored: anElement
]

{ #category : 'protected' }
TbBasicLayoutWithPadding >> measureChild: anElement parentSpec: parentSpec widthUsed: widthUsed heightUsed: heightUsed [

	^ super measureChild: anElement parentSpec: parentSpec widthUsed: widthUsed + (topLeftPadding x + bottomRightPadding x) heightUsed: heightUsed + (topLeftPadding y + bottomRightPadding y)
]

{ #category : 'accessing' }
TbBasicLayoutWithPadding >> topLeftPadding [

	^ topLeftPadding
]

{ #category : 'accessing' }
TbBasicLayoutWithPadding >> topLeftPadding: anObject [

	topLeftPadding := anObject
]
