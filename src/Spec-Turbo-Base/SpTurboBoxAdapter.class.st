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
SpTurboBoxAdapter >> basicAdd: aPresenter constraints: constraints to: asWidget [

	| childWidget |
	childWidget := aPresenter buildWithSelector: constraints spec.
	constraints isPlacedAtStart
		ifTrue: [ 
			asWidget
				packStart: childWidget
				expand: constraints isExpand
				fill: constraints isFill
				padding: constraints padding ]
		ifFalse: [ 
			asWidget
				reversePackEnd: childWidget
				expand: constraints isExpand
				fill: constraints isFill
				padding: constraints padding ].

	^ asWidget
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
		ifTrue: [ TbLinearLayout horizontal ]
		ifFalse: [ TbLinearLayout vertical ].
		
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
