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
	^ TbIgnoredLayoutConstraintsHorizontal new
]

{ #category : #initialization }
TbIgnoredLayoutConstraints >> defaultVertical [
	^ TbIgnoredLayoutConstraintsVertical new
]
