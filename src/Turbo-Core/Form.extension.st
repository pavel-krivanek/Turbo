Extension { #name : #Form }

{ #category : #'*Turbo-Core' }
Form >> asBlBackground [
	^ BlBackground image: self
]

{ #category : #'*Turbo-Core' }
Form >> asElement [
	^ BlElement new
		size: self extent;
		background: self;
		yourself
]

{ #category : #'*Turbo-Core' }
Form >> asForm [
	^ self
]

{ #category : #'*Turbo-Core' }
Form >> isSystemCursor [
	^ false
]
