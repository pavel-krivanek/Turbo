Extension { #name : #TbElement }

{ #category : #'*Bloc-Utilities - Pannable' }
TbElement >> asPannableElement [
	| pannable |
	self removeFromParent.
	pannable := BlPannableElement new.
	pannable constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	pannable contentElement: self.
	^ pannable
]

{ #category : #'*Bloc-Utilities - Pannable' }
TbElement >> asScalableElement [
	| aScalableElement |
	
	self removeFromParent.
	aScalableElement := BlScalableElement new.
	aScalableElement constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	aScalableElement addChild: self.

	^ aScalableElement
]

{ #category : #'*Bloc-Utilities - Scrolling' }
TbElement >> asScrollableElement [
	| scrollable |
	self removeFromParent.
	scrollable := BlScrollableElement new.
	scrollable constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	scrollable addChild: self.
	^ scrollable
]
