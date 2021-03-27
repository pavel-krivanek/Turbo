Extension { #name : #Color }

{ #category : #'*Turbo-Core' }
Color >> asBlBackground [
	^ TbBackground paint: self
]

{ #category : #'*Turbo-Core' }
Color >> asBlPaint [
	^ TbColorPaint color: self
]
