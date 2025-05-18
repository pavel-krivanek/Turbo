"
The event is being manually forwarded to other dispatchers
"
Class {
	#name : 'TbEventTraversalForwardingStep',
	#superclass : 'TbEventTraversalStep',
	#category : 'Turbo-Core-Events',
	#package : 'Turbo-Core',
	#tag : 'Events'
}

{ #category : 'accessing' }
TbEventTraversalForwardingStep >> type [
	<return: #String>
	
	^ 'Forwarded'
]
