Class {
	#name : #SpTurboBoxAdapter,
	#superclass : #SpTurboLayoutAdapter,
	#category : #'Spec-Turbo-Base'
}

{ #category : #adding }
SpTurboBoxAdapter >> addConstraits: constraints toChild: childWidget [
	"adds constraits by child."
	
	constraints isExpand ifFalse: [
		| min |
		min := childWidget preferredSizeMinimum.
		constraints width ifNotNil: [ :w | 
			childWidget sizeRequest: w@min y ].
		constraints height ifNotNil: [ :h | 
			childWidget sizeRequest: min x@h ] ].

	^ childWidget
]

{ #category : #adding }
SpTurboBoxAdapter >> addWidgetAlignment: constraints to: gtkWidget [


]

{ #category : #adding }
SpTurboBoxAdapter >> basicAdd: aPresenter constraints: constraints to: aWidget [

	| childWidget |
	childWidget := aPresenter buildWithSelector: constraints spec.

	childWidget constraintsDo: [ :c | 
		"c horizontal matchParent."
	"	c horizontal matchParent .
		c vertical matchParent" ].

	aWidget addChild: childWidget.

	^ aWidget
]

{ #category : #adding }
SpTurboBoxAdapter >> buildWidget [
	"We defer this until layout: (because then I will know what I have to create)"

	
	^ nil
]

{ #category : #adding }
SpTurboBoxAdapter >> layout: aLayout [

	| directionLayout |
	
	directionLayout := aLayout isHorizontal
		ifTrue: [ TbFlowLayout new horizontal ]
		ifFalse: [ TbFlowLayout new vertical ].
		
	"directionLayout := TbGridLayout new columnCount: 1."
		
	"build of widget was differed up to here (to know what is the direction)"
"	widget := aLayout direction newWidgetOn: self.
	widget 
		homogeneous: aLayout isHomogeneous;
		spacing: aLayout spacing;
		borderWidth: aLayout borderWidth."

	widget := aLayout direction newWidgetOn: self.	
	widget constraintsDo: [ :c |
			c horizontal matchParent .
			c vertical matchParent ].
	widget layout: directionLayout.
"	widget layout cellSpacing: (self convert: aLayout spacing).
"
]

{ #category : #adding }
SpTurboBoxAdapter >> newHorizontal [

	^ SpTurboBoxWidget newHorizontal
]

{ #category : #adding }
SpTurboBoxAdapter >> newVertical [

	^ SpTurboBoxWidget newVertical
]
