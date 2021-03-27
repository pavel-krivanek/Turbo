Class {
	#name : #TbFlowLayoutInlineChild,
	#superclass : #TbFlowLayoutChild,
	#category : #'Turbo-Layout-Flow-Utilities'
}

{ #category : #adding }
TbFlowLayoutInlineChild >> addToLine: aLine [
	
	(self orientation isHorizontal and: [ self direction isRightToLeft ])
		ifTrue: [ aLine addInlineFirst: self ]
		ifFalse: [ aLine addInlineLast: self ]
]
