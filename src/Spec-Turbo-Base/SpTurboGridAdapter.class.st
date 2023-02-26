Class {
	#name : #SpTurboGridAdapter,
	#superclass : #SpTurboLayoutAdapter,
	#instVars : [
		'rows',
		'columns'
	],
	#category : #'Spec-Turbo-Base'
}

{ #category : #adding }
SpTurboGridAdapter >> basicAdd: aPresenter constraints: constraints to: aWidget [
	| childWidget  |

	columns := columns max: constraints position x.
	rows := rows max: constraints position y.
	
	self widget layout columnCount: columns; rowCount: rows.


	childWidget := aPresenter buildWithSpec: constraints spec.
		
	childWidget constraintsDo: [ :c |
		c horizontal matchParent .
		c vertical matchParent ].
	
	self widget addChild: childWidget.

	^ aWidget
]

{ #category : #adding }
SpTurboGridAdapter >> buildWidget [
	"We defer this until layout: (because then I will know what I have to create)"
	
	^ nil
]

{ #category : #adding }
SpTurboGridAdapter >> initialize [ 
		
	super initialize.
	
	columns := 1.
	rows := 1.
]

{ #category : #adding }
SpTurboGridAdapter >> layout: aLayout [

	widget := SpTurboGridWidget new.	
	widget constraintsDo: [ :c |
			c horizontal matchParent .
			c vertical matchParent ].
	widget layout: (TbGridLayout new) vertical.
	widget layout cellSpacing: (self convert: aLayout rowSpacing)
]

{ #category : #adding }
SpTurboGridAdapter >> newHorizontal [

	^ SpTurboBoxWidget newHorizontal
]

{ #category : #adding }
SpTurboGridAdapter >> newVertical [

	^ SpTurboBoxWidget newVertical
]
