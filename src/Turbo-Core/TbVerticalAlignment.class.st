Class {
	#name : #TbVerticalAlignment,
	#superclass : #TbElementAlignment,
	#classInstVars : [
		'bottom',
		'center',
		'top'
	],
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #factory }
TbVerticalAlignment class >> bottom [
	^ bottom
]

{ #category : #factory }
TbVerticalAlignment class >> center [
	^ center
]

{ #category : #factory }
TbVerticalAlignment class >> directed: aBlLayoutDirection [
	^ aBlLayoutDirection of: self
]

{ #category : #factory }
TbVerticalAlignment class >> end [
	^ self bottom
]

{ #category : #'class initialization' }
TbVerticalAlignment class >> initialize [
	super initialize.
	
	top := BlTopAlignment new.
	center := BlVerticalCenterAlignment new.
	bottom := BlBottomAlignment new
]

{ #category : #factory }
TbVerticalAlignment class >> leftToRight [
	^ self subclassResponsibility
]

{ #category : #factory }
TbVerticalAlignment class >> null [
	^ BlElementAlignment null vertical
]

{ #category : #factory }
TbVerticalAlignment class >> rightToLeft [
	^ self subclassResponsibility
]

{ #category : #factory }
TbVerticalAlignment class >> start [
	^ self top
]

{ #category : #factory }
TbVerticalAlignment class >> top [
	^ top
]

{ #category : #composition }
TbVerticalAlignment >> + aHorizontalAlignment [
	^ BlCompositeAlignment horizontal: aHorizontalAlignment vertical: self
]

{ #category : #factory }
TbVerticalAlignment >> center [
	^ self class center
]

{ #category : #factory }
TbVerticalAlignment >> directed: aBlLayoutDirection [
	^ self class directed: aBlLayoutDirection
]

{ #category : #factory }
TbVerticalAlignment >> end [
	^ self class end
]

{ #category : #factory }
TbVerticalAlignment >> leftToRight [
	^ self class leftToRight
]

{ #category : #factory }
TbVerticalAlignment >> null [
	^ self class null
]

{ #category : #factory }
TbVerticalAlignment >> rightToLeft [
	^ self class rightToLeft
]

{ #category : #factory }
TbVerticalAlignment >> start [
	^ self class start
]
