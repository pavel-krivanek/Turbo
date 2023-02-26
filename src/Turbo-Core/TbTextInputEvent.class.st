"
I am an event that it is fired when the user types some text.

I usually represent a single character, but I can be composed of multiples code points, specially for complex writing systems as Chinese.
"
Class {
	#name : #TbTextInputEvent,
	#superclass : #TbUIEvent,
	#instVars : [
		'text'
	],
	#category : #'Turbo-Core-Events'
}

{ #category : #testing }
TbTextInputEvent >> isTextInput [
	^ true
]

{ #category : #sending }
TbTextInputEvent >> sendTo: anObject [
	anObject textInputEvent: self
]

{ #category : #accessing }
TbTextInputEvent >> text [
	^ text
]

{ #category : #accessing }
TbTextInputEvent >> text: anObject [
	text := anObject
]
