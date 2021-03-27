Class {
	#name : #SpTextPresenterExample,
	#superclass : #SpPresenter,
	#category : #'Spec-TextBloc-Examples'
}

{ #category : #specs }
SpTextPresenterExample class >> open [ 

	<script>
	
	| app aPresenter |
	app := SpApplication new.
	app useBackend: #TextBloc.

	aPresenter := self newApplication: app.

	aPresenter openWithSpec.
]
