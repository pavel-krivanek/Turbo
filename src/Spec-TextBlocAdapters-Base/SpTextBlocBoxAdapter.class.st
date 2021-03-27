Class {
	#name : #SpTextBlocBoxAdapter,
	#superclass : #SpTextBlocLayoutAdapter,
	#category : #'Spec-TextBlocAdapters-Base'
}

{ #category : #adding }
SpTextBlocBoxAdapter >> addConstraits: constraints toChild: childWidget [
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
SpTextBlocBoxAdapter >> basicAdd: aPresenter constraints: constraints to: aWidget [
	| childWidget |

	childWidget := aPresenter buildWithSpec: constraints spec.
		
	childWidget constraintsDo: [ :c |
		c horizontal matchParent .
		c vertical matchParent ].
	
	self widget addChild: childWidget.

	^ aWidget
]

{ #category : #adding }
SpTextBlocBoxAdapter >> buildWidget [
	"We defer this until layout: (because then I will know what I have to create)"
	
	^ nil
]

{ #category : #adding }
SpTextBlocBoxAdapter >> layout: aLayout [

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
	widget layout: (BlGridLayout new columnCount: 1) vertical.
	widget layout cellSpacing: (self convert: aLayout spacing).

]

{ #category : #adding }
SpTextBlocBoxAdapter >> newHorizontal [

	^ SpTextBlocBoxWidget newHorizontal
]

{ #category : #adding }
SpTextBlocBoxAdapter >> newVertical [

	^ SpTextBlocBoxWidget newVertical
]
