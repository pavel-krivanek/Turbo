Extension { #name : #Character }

{ #category : #'*Turbo-Core' }
Character >> isLineBreak [
	^ self = self class cr or: [ self = self class lf ]
]

{ #category : #'*Turbo-Core' }
Character >> isPureSeparator [
	^ self isSeparator and: [ self isLineBreak not ]
]
