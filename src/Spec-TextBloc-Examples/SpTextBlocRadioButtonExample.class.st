Class {
	#name : #SpTextBlocRadioButtonExample,
	#superclass : #SpTextPresenterExample,
	#instVars : [
		'button1',
		'button2',
		'button3',
		'button',
		'button4'
	],
	#category : #'Spec-TextBloc-Examples'
}

{ #category : #specs }
SpTextBlocRadioButtonExample class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: #button1;
		add: #button2;
		add: #button3;
		add: #button4;
		add: #button.
]

{ #category : #specs }
SpTextBlocRadioButtonExample class >> open [ 

	<script>
	^ super open
]

{ #category : #accessing }
SpTextBlocRadioButtonExample >> initializePresenters [

	button1 := self newRadioButton label: 'Button 1'.
	button2 := self newRadioButton label: 'Button 2'.
	button3 := self newRadioButton label: 'Button 3'.
	button4 := self newRadioButton label: 'Button 4'; enabled: false.
	
	button1 associatedRadioButtons: { button2. button3 }.
	
	button := self newButton 
		label: 'Change label';
		action: [ button1 label: 'changed label' ].

]
