"
The event has arrived at the event's target. Event listeners registered for this phase are called at this time. If BlEvent>>#canBePropagated  is false, processing the event is finished after this phase is complete.
"
Class {
	#name : #TbEventTraversalTargetStep,
	#superclass : #TbEventTraversalStep,
	#category : #'Turbo-Core-Events'
}

{ #category : #accessing }
TbEventTraversalTargetStep >> type [
	<return: #String>
	
	^ 'Arrived'
]
