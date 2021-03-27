"
SpecBindings value: TextBlocAdapterBindings during: [ 
		| aPresenter labels index first layout |
		aPresenter := SpecTextBlocSimpleDemo new.
	
		aPresenter openWithSpec.
		aPresenter .
 ].

"
Class {
	#name : #SpTextBlocButtonDemo,
	#superclass : #SpTextPresenterExample,
	#instVars : [
		'button1',
		'button2',
		'button3',
		'button4',
		'button5'
	],
	#category : #'Spec-TextBloc-Examples'
}

{ #category : #specs }
SpTextBlocButtonDemo class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: #button1;
		add: #button2;
		add: #button3;
		add: #button4;
		add: #button5.
		
]

{ #category : #specs }
SpTextBlocButtonDemo class >> open [ 

	<script>
	^ super open
]

{ #category : #accessing }
SpTextBlocButtonDemo >> initializePresenters [

	button1 := self newButton label: 'Button 1'.
	button2 := self newButton label: 'Button 2'; enabled: false.	
	button3 := self newButton label: 'Button 3'; state: true.	
	button4 := self newButton label: 'Button 4'; color: Color red; yourself.
	button5 := self newButton label: 'Button 5'; icon: (self iconNamed: #add); yourself.

]
