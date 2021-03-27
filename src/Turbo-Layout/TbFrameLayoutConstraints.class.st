Class {
	#name : #TbFrameLayoutConstraints,
	#superclass : #TbLayoutConstraints,
	#category : #'Turbo-Layout-Frame'
}

{ #category : #accessing }
TbFrameLayoutConstraints >> alignment [
	^ self horizontal alignment + self vertical alignment
]

{ #category : #initialization }
TbFrameLayoutConstraints >> defaultHorizontal [
	^ TbFrameLayoutConstraintsHorizontal new
]

{ #category : #initialization }
TbFrameLayoutConstraints >> defaultVertical [
	^ TbFrameLayoutConstraintsVertical new
]
