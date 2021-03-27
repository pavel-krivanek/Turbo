Class {
	#name : #BlFrameLayoutConstraints,
	#superclass : #TbLayoutConstraints,
	#category : #'Turbo-Layout-Frame'
}

{ #category : #accessing }
BlFrameLayoutConstraints >> alignment [
	^ self horizontal alignment + self vertical alignment
]

{ #category : #initialization }
BlFrameLayoutConstraints >> defaultHorizontal [
	^ BlFrameLayoutConstraintsHorizontal new
]

{ #category : #initialization }
BlFrameLayoutConstraints >> defaultVertical [
	^ BlFrameLayoutConstraintsVertical new
]
