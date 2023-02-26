Class {
	#name : #TbScrollFlingerState,
	#superclass : #Object,
	#instVars : [
		'x',
		'y',
		'dX',
		'dY',
		'hResult',
		'vResult',
		'overscrollX',
		'overscrollY'
	],
	#category : #'Turbo-Core-Utilities - Scrolling Helpers'
}

{ #category : #accessing }
TbScrollFlingerState >> dX [
	^ dX
]

{ #category : #accessing }
TbScrollFlingerState >> dX: anObject [
	dX := anObject
]

{ #category : #accessing }
TbScrollFlingerState >> dY [
	^ dY
]

{ #category : #accessing }
TbScrollFlingerState >> dY: anObject [
	dY := anObject
]

{ #category : #testing }
TbScrollFlingerState >> didScroll [
	^ hResult isZero not or: [ vResult isZero not ]
]

{ #category : #accessing }
TbScrollFlingerState >> hResult [
	^ hResult
]

{ #category : #accessing }
TbScrollFlingerState >> hResult: anObject [
	hResult := anObject
]

{ #category : #accessing }
TbScrollFlingerState >> overscrollX [
	^ overscrollX
]

{ #category : #accessing }
TbScrollFlingerState >> overscrollX: anObject [
	overscrollX := anObject
]

{ #category : #accessing }
TbScrollFlingerState >> overscrollY [
	^ overscrollY
]

{ #category : #accessing }
TbScrollFlingerState >> overscrollY: anObject [
	overscrollY := anObject
]

{ #category : #accessing }
TbScrollFlingerState >> vResult [
	^ vResult
]

{ #category : #accessing }
TbScrollFlingerState >> vResult: anObject [
	vResult := anObject
]

{ #category : #accessing }
TbScrollFlingerState >> x [
	^ x
]

{ #category : #accessing }
TbScrollFlingerState >> x: anObject [
	x := anObject
]

{ #category : #accessing }
TbScrollFlingerState >> y [
	^ y
]

{ #category : #accessing }
TbScrollFlingerState >> y: anObject [
	y := anObject
]
