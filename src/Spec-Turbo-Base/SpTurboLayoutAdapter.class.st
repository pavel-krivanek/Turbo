Class {
	#name : #SpTurboLayoutAdapter,
	#superclass : #SpTurboAbstractAdapter,
	#category : #'Spec-Turbo-Base'
}

{ #category : #adding }
SpTurboLayoutAdapter >> add: aPresenter constraints: constraints [

	aPresenter owner: self model. 
	self widgetDo: [ :aWidget | | childWidget |
		childWidget := self 
			basicAdd: aPresenter
			constraints: constraints 
			to: aWidget.
		self addWidgetAlignment: constraints to: childWidget.]
]

{ #category : #adding }
SpTurboLayoutAdapter >> addWidgetAlignment: constraints to: gtkWidget [

 
]

{ #category : #adding }
SpTurboLayoutAdapter >> basicAdd: aPresenter constraints: constraints to: aPanel [ 

	| childWidget | 

	childWidget := aPresenter buildWithSpec: constraints spec.
	aPanel addChild: childWidget.

	^ aPanel
]

{ #category : #adding }
SpTurboLayoutAdapter >> buildWithSpec [
	"This provides some polymorphism with regular presenters to allow composition of layouts."
	
	^ self widget
]

{ #category : #adding }
SpTurboLayoutAdapter >> buildWithSpec: aSpec [
	"This provides some polymorphism with regular presenters to allow composition of layouts."
	
	^ self widget
]
