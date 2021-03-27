Class {
	#name : #TbIgnoredLayoutConstraints,
	#superclass : #TbLayoutConstraints,
	#category : #'Turbo-Core-Layouts-Basic'
}

{ #category : #accessing }
TbIgnoredLayoutConstraints >> alignment [
	^ self horizontal alignment + self vertical alignment
]

{ #category : #initialization }
TbIgnoredLayoutConstraints >> defaultHorizontal [
	^ BlIgnoredLayoutConstraintsHorizontal new
]

{ #category : #initialization }
TbIgnoredLayoutConstraints >> defaultVertical [
	^ BlIgnoredLayoutConstraintsVertical new
]
