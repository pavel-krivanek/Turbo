Class {
	#name : #TbGridLayoutConstraints,
	#superclass : #TbLayoutConstraints,
	#category : #'Turbo-Layout-Grid'
}

{ #category : #'as yet unclassified' }
TbGridLayoutConstraints >> columnSpec [
	"Column spec defined horizontal characteristics"
	<return: #BlGridLayoutSpec>

	^ self horizontal spec
]

{ #category : #'initialize-release' }
TbGridLayoutConstraints >> defaultHorizontal [
	^ BlGridLayoutConstraintsHorizontal new
]

{ #category : #'initialize-release' }
TbGridLayoutConstraints >> defaultVertical [
	^ BlGridLayoutConstraintsVertical new
]

{ #category : #'as yet unclassified' }
TbGridLayoutConstraints >> rowSpec [
	"Row spec defined vertical characteristics"
	<return: #BlGridLayoutSpec>

	^ self vertical spec
]
