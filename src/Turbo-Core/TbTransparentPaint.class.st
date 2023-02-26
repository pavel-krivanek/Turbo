"
I am a special transparent case of a color paint.

Most of the elements have transparent backgrounds or stroke.
It is prefereable to refer my unique instance, since I am stateless
"
Class {
	#name : #TbTransparentPaint,
	#superclass : #TbColorPaint,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Turbo-Core-Paint'
}

{ #category : #cleanup }
TbTransparentPaint class >> cleanUp [
	super cleanUp.
	
	uniqueInstance := nil
]

{ #category : #'instance creation' }
TbTransparentPaint class >> color: aColor [
	self shouldNotImplement
]

{ #category : #'instance creation' }
TbTransparentPaint class >> transparent [
	self shouldNotImplement
]

{ #category : #accessing }
TbTransparentPaint class >> uniqueInstance [
	"Return a unique instance of transparent paint.
	It is preferable to use unique instance than create a new every time"
	<return: #BlColorPaint>

	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #accessing }
TbTransparentPaint >> color: aColor [
	self shouldNotImplement
]

{ #category : #initialization }
TbTransparentPaint >> initialize [
	super initialize.
	
	color := Color transparent
]

{ #category : #testing }
TbTransparentPaint >> isTransparent [
	"I am transparent by definition and therefore always return true"
	<return: #Boolean>

	^ true
]
