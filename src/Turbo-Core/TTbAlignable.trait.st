"
I add alignment api in both axis simultaneously.

My users are layout related classes
"
Trait {
	#name : #TTbAlignable,
	#category : #'Turbo-Core-Layouts-Support'
}

{ #category : #'api - alignment' }
TTbAlignable >> alignBottomCenter [
	self verticalAlignment: BlElementAlignment vertical end.
	self horizontalAlignment: BlElementAlignment horizontal center
]

{ #category : #'api - alignment' }
TTbAlignable >> alignBottomLeft [
	self verticalAlignment: BlElementAlignment vertical end.
	self horizontalAlignment: BlElementAlignment horizontal start
]

{ #category : #'api - alignment' }
TTbAlignable >> alignBottomRight [
	self verticalAlignment: BlElementAlignment vertical end.
	self horizontalAlignment: BlElementAlignment horizontal end
]

{ #category : #'api - alignment' }
TTbAlignable >> alignCenter [
	self verticalAlignment: BlElementAlignment vertical center.
	self horizontalAlignment: BlElementAlignment horizontal center
]

{ #category : #'api - alignment' }
TTbAlignable >> alignCenterLeft [
	self verticalAlignment: BlElementAlignment vertical center.
	self horizontalAlignment: BlElementAlignment horizontal start
]

{ #category : #'api - alignment' }
TTbAlignable >> alignCenterRight [
	self verticalAlignment: BlElementAlignment vertical center.
	self horizontalAlignment: BlElementAlignment horizontal end
]

{ #category : #'api - alignment' }
TTbAlignable >> alignTopCenter [
	self verticalAlignment: BlElementAlignment vertical start.
	self horizontalAlignment: BlElementAlignment horizontal center
]

{ #category : #'api - alignment' }
TTbAlignable >> alignTopLeft [
	self verticalAlignment: BlElementAlignment vertical start.
	self horizontalAlignment: BlElementAlignment horizontal start
]

{ #category : #'api - alignment' }
TTbAlignable >> alignTopRight [
	self verticalAlignment: BlElementAlignment vertical start.
	self horizontalAlignment: BlElementAlignment horizontal end
]

{ #category : #accessing }
TTbAlignable >> horizontalAlignment [
	<return: #BlElementAlignment>

	^ self explicitRequirement
]

{ #category : #accessing }
TTbAlignable >> horizontalAlignment: aBlElementAlignment [
	self explicitRequirement
]

{ #category : #accessing }
TTbAlignable >> verticalAlignment [
	<return: #BlElementAlignment>
	
	^ self explicitRequirement
]

{ #category : #accessing }
TTbAlignable >> verticalAlignment: aBlElementAlignment [
	self explicitRequirement
]
