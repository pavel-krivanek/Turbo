Class {
	#name : #TbHorizontalAlignment,
	#superclass : #TbElementAlignment,
	#classInstVars : [
		'center',
		'left',
		'right'
	],
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #factory }
TbHorizontalAlignment class >> center [
	^ center
]

{ #category : #factory }
TbHorizontalAlignment class >> directed: aBlLayoutDirection [
	^ aBlLayoutDirection of: self
]

{ #category : #'class initialization' }
TbHorizontalAlignment class >> initialize [
	super initialize.
	
	left := BlLeftAlignment new.
	right := BlRightAlignment new.
	center := BlHorizontalCenterAlignment new.
	start := BlHorizontalStartAlignment new.
	end := BlHorizontalEndAlignment new.
]

{ #category : #factory }
TbHorizontalAlignment class >> left [
	^ left
]

{ #category : #factory }
TbHorizontalAlignment class >> leftToRight [
	^ self subclassResponsibility
]

{ #category : #factory }
TbHorizontalAlignment class >> null [
	^ BlElementAlignment null horizontal
]

{ #category : #factory }
TbHorizontalAlignment class >> right [
	^ right
]

{ #category : #factory }
TbHorizontalAlignment class >> rightToLeft [
	^ self subclassResponsibility
]

{ #category : #composition }
TbHorizontalAlignment >> + aVerticalAlignment [
	^ BlCompositeAlignment horizontal: self vertical: aVerticalAlignment
]

{ #category : #factory }
TbHorizontalAlignment >> center [
	^ self class center
]

{ #category : #factory }
TbHorizontalAlignment >> directed: aBlLayoutDirection [
	^ self class directed: aBlLayoutDirection
]

{ #category : #factory }
TbHorizontalAlignment >> end [
	^ self class end
]

{ #category : #factory }
TbHorizontalAlignment >> leftToRight [
	^ self class leftToRight
]

{ #category : #factory }
TbHorizontalAlignment >> null [
	^ self class null
]

{ #category : #factory }
TbHorizontalAlignment >> rightToLeft [
	^ self class rightToLeft
]

{ #category : #factory }
TbHorizontalAlignment >> start [
	^ self class start
]
