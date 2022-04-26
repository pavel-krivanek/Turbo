Class {
	#name : #SpTextBlocLayoutAdapter,
	#superclass : #SpTextBlocAbstractAdapter,
	#category : #'Spec-Turbo-Base'
}

{ #category : #adding }
SpTextBlocLayoutAdapter >> add: aPresenter constraints: constraints [

	aPresenter owner: self model. 
	self widgetDo: [ :aWidget | | childWidget |
		childWidget := self 
			basicAdd: aPresenter
			constraints: constraints 
			to: aWidget.
		self addWidgetAlignment: constraints to: childWidget.]
]

{ #category : #adding }
SpTextBlocLayoutAdapter >> addWidgetAlignment: constraints to: gtkWidget [

 
]

{ #category : #adding }
SpTextBlocLayoutAdapter >> basicAdd: aPresenter constraints: constraints to: aPanel [ 

	| childWidget | 

	childWidget := aPresenter buildWithSpec: constraints spec.
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
