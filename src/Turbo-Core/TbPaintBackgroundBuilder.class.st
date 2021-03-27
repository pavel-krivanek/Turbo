Class {
	#name : #TbPaintBackgroundBuilder,
	#superclass : #TbBackgroundBuilder,
	#instVars : [
		'paint'
	],
	#category : #'Turbo-Core-Basic-Background'
}

{ #category : #building }
TbPaintBackgroundBuilder >> build [
	<return: #BlBackground>

	^ (BlPaintBackground paint: self paint) opacity: self opacity
]

{ #category : #accessing }
TbPaintBackgroundBuilder >> paint [
	^ paint
]

{ #category : #accessing }
TbPaintBackgroundBuilder >> paint: aBlPaint [
	paint := aBlPaint
]
