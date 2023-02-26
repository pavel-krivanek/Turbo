Class {
	#name : #SpTextPresenterExample,
	#superclass : #SpPresenter,
	#category : #'Spec-Turbo-Examples'
}

{ #category : #specs }
SpTextPresenterExample class >> open [

	<script>
	| app aPresenter |
	app := SpApplication new.
	app useBackend: #Turbo.

	aPresenter := self newApplication: app.

	aPresenter open
]
