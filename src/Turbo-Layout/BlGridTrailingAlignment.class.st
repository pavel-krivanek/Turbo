Class {
	#name : #BlGridTrailingAlignment,
	#superclass : #BlGridAlignment,
	#category : #'Turbo-Layout-Grid-Utilities'
}

{ #category : #alignment }
BlGridTrailingAlignment >> alignmentValue: anElement viewSize: viewSize [
	^ viewSize
]

{ #category : #alignment }
BlGridTrailingAlignment >> gravityOffset: anElement cellDelta: cellDelta [
	^ cellDelta
]
