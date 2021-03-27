Class {
	#name : #TbKeyboardEvent,
	#superclass : #TbUIEvent,
	#instVars : [
		'scanCode',
		'repeat'
	],
	#category : #'Turbo-Core-Events'
}

{ #category : #accessing }
TbKeyboardEvent >> button [
	self shouldNotImplement
]

{ #category : #accessing }
TbKeyboardEvent >> button: anObject [
	self shouldNotImplement
]

{ #category : #accessing }
TbKeyboardEvent >> charCode [
	self 
		deprecated: 'Use charCode instead'
		on: 	'1 July 2017' 
		in: 'Pharo-6.0-60501-'.
	self halt
]

{ #category : #accessing }
TbKeyboardEvent >> charCode: anObject [ 
	self 
		deprecated: 'Use charCode: instead'
		on: 	'1 July 2017' 
		in: 'Pharo-6.0-60501-'.
	self halt
]

{ #category : #initialization }
TbKeyboardEvent >> initialize [
	super initialize.
	repeat := 0.
]

{ #category : #testing }
TbKeyboardEvent >> isKeyboard [
	^ true
]

{ #category : #accessing }
TbKeyboardEvent >> keyValue [
	self 
		deprecated: 'Use keyValue instead'
		on: 	'1 July 2017' 
		in: 'Pharo-6.0-60501-'.
	self halt
]

{ #category : #accessing }
TbKeyboardEvent >> keyValue: anObject [ 
	self 
		deprecated: 'Use key: instead'
		on: 	'1 July 2017' 
		in: 'Pharo-6.0-60501-'.
	self halt
]

{ #category : #accessing }
TbKeyboardEvent >> repeat [
	^ repeat
]

{ #category : #accessing }
TbKeyboardEvent >> repeat: anObject [
	repeat := anObject
]

{ #category : #'key - accessing' }
TbKeyboardEvent >> scanCode [
	"A scancode (or scan code) is the data that most computer keyboards send to a computer to report which keys have been pressed.
	A number, or sequence of numbers, is assigned to each key on the keyboard.
	https://en.wikipedia.org/wiki/Scancode"
	<return: #Number>

	^ scanCode
]

{ #category : #'key - accessing' }
TbKeyboardEvent >> scanCode: anObject [
	scanCode := anObject
]
