"
I define an API of an abstract event handler
"
Trait {
	#name : #TTbEventHandler,
	#category : #'Turbo-Core-Events-Handling'
}

{ #category : #events }
TTbEventHandler >> handleEvent: anEvent [
	"Handle a given event or dispatch it using #sendTo:"

	self explicitRequirement
]

{ #category : #testing }
TTbEventHandler >> hasOwner [
	<return: #Boolean>

	^ false
]

{ #category : #events }
TTbEventHandler >> wantsEvent: anEvent [
	"Return true if I am interested in a given event and want to handle it,
	false otherwise"
	<return: #Boolean>

	^ self explicitRequirement
]
