Class {
	#name : #SpTurboCheckBoxExample,
	#superclass : #SpTextPresenterExample,
	#instVars : [
		'checkBox1',
		'checkBox2',
		'checkBox3',
		'button'
	],
	#category : #'Spec-Turbo-Examples'
}

{ #category : #layout }
SpTurboCheckBoxExample class >> defaultLayout [

	^ SpBoxLayout newVertical
		add: #checkBox1;
		add: #checkBox2;
		add: #checkBox3;
		add: #button.
]

{ #category : #specs }
SpTurboCheckBoxExample class >> open [ 

	<script>
	^ super open
]

{ #category : #accessing }
SpTurboCheckBoxExample >> initializePresenters [

	checkBox1 := self newCheckBox label: 'checkbox 1'; state: true.
	checkBox2 := self newCheckBox label: 'checkbox 2'; state: false.
	checkBox3 := self newCheckBox label: 'checkbox 3'; enabled: false.
	
	button := self newButton 
		label: 'Change label';
		action: [ checkBox1 label: 'changed label' ].

]
