Class {
	#name : #SpTextBlocCheckBoxExample,
	#superclass : #SpTextPresenterExample,
	#instVars : [
		'checkBox1',
		'checkBox2',
		'checkBox3',
		'button'
	],
	#category : #'Spec-TextBloc-Examples'
}

{ #category : #specs }
SpTextBlocCheckBoxExample class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: #checkBox1;
		add: #checkBox2;
		add: #checkBox3;
		add: #button.
]

{ #category : #specs }
SpTextBlocCheckBoxExample class >> open [ 

	<script>
	^ super open
]

{ #category : #accessing }
SpTextBlocCheckBoxExample >> initializePresenters [

	checkBox1 := self newCheckBox label: 'checkbox 1'; state: true.
	checkBox2 := self newCheckBox label: 'checkbox 2'; state: false.
	checkBox3 := self newCheckBox label: 'checkbox 3'; enabled: false.
	
	button := self newButton 
		label: 'Change label';
		action: [ checkBox1 label: 'changed label' ].

]
