Extension { #name : #Interval }

{ #category : #'*Turbo-Layout' }
Interval >> inversed [
	^ self class from: stop to: start by: step
]
