Extension { #name : #Color }

{ #category : #'*Turbo-Core' }
Color >> asBlBackground [
	^ BlBackground paint: self
]

{ #category : #'*Turbo-Core' }
Color >> asBlPaint [
	^ BlColorPaint color: self
]
