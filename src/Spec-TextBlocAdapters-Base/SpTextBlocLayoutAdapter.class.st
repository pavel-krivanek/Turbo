Class {
	#name : #SpTextBlocLayoutAdapter,
	#superclass : #SpTextBlocAbstractAdapter,
	#category : #'Spec-TextBlocAdapters-Base'
}

{ #category : #adding }
SpTextBlocLayoutAdapter >> add: aPresenter constraints: constraints [
 
	self widgetDo: [ :gtkWidget | 
		self 
			basicAdd: aPresenter 
			constraints: constraints 
			to: gtkWidget ]
]

{ #category : #adding }
SpTextBlocLayoutAdapter >> basicAdd: aPresenter constraints: constraints to: aPanel [ 

	| childWidget | 

	childWidget := aPresenter buildWithSpec: constraints spec.
	aPanel layout: BlFlowLayout new horizontal.
	aPanel addChild: childWidget.

	^ aPanel
]

{ #category : #adding }
SpTextBlocLayoutAdapter >> buildWithSpec [
	"This provides some polymorphism with regular presenters to allow composition of layouts."
	
	^ self widget
]

{ #category : #adding }
SpTextBlocLayoutAdapter >> buildWithSpec: aSpec [
	"This provides some polymorphism with regular presenters to allow composition of layouts."
	
	^ self widget
]
