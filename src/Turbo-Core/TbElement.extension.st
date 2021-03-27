Extension { #name : #TbElement }

{ #category : #'*Bloc-Utilities - Pannable' }
TbElement >> asPannableElement [
	| pannable |
	self removeFromParent.
	pannable := TbPannableElement new.
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
	aScalableElement := TbScalableElement new.
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
	scrollable := TbScrollableElement new.
	scrollable constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	scrollable addChild: self.
	^ scrollable
]
