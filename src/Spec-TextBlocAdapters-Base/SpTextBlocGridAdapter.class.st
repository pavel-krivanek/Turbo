Class {
	#name : #SpTextBlocGridAdapter,
	#superclass : #SpTextBlocLayoutAdapter,
	#instVars : [
		'rows',
		'columns'
	],
	#category : #'Spec-TextBlocAdapters-Base'
}

{ #category : #adding }
SpTextBlocGridAdapter >> basicAdd: aPresenter constraints: constraints to: aWidget [
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
SpTextBlocGridAdapter >> buildWidget [
	"We defer this until layout: (because then I will know what I have to create)"
	
	^ nil
]

{ #category : #adding }
SpTextBlocGridAdapter >> initialize [ 
		
	super initialize.
	
	columns := 1.
	rows := 1.
]

{ #category : #adding }
SpTextBlocGridAdapter >> layout: aLayout [

	widget := SpTextBlocGridWidget new.	
	widget constraintsDo: [ :c |
			c horizontal matchParent .
			c vertical matchParent ].
	widget layout: (BlGridLayout new) vertical.
	widget layout cellSpacing: (self convert: aLayout rowSpacing)
]

{ #category : #adding }
SpTextBlocGridAdapter >> newHorizontal [

	^ SpTextBlocBoxWidget newHorizontal
]

{ #category : #adding }
SpTextBlocGridAdapter >> newVertical [

	^ SpTextBlocBoxWidget newVertical
]
