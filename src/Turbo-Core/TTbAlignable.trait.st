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
	self verticalAlignment: TbElementAlignment vertical end.
	self horizontalAlignment: TbElementAlignment horizontal center
]

{ #category : #'api - alignment' }
TTbAlignable >> alignBottomLeft [
	self verticalAlignment: TbElementAlignment vertical end.
	self horizontalAlignment: TbElementAlignment horizontal start
]

{ #category : #'api - alignment' }
TTbAlignable >> alignBottomRight [
	self verticalAlignment: TbElementAlignment vertical end.
	self horizontalAlignment: TbElementAlignment horizontal end
]

{ #category : #'api - alignment' }
TTbAlignable >> alignCenter [
	self verticalAlignment: TbElementAlignment vertical center.
	self horizontalAlignment: TbElementAlignment horizontal center
]

{ #category : #'api - alignment' }
TTbAlignable >> alignCenterLeft [
	self verticalAlignment: TbElementAlignment vertical center.
	self horizontalAlignment: TbElementAlignment horizontal start
]

{ #category : #'api - alignment' }
TTbAlignable >> alignCenterRight [
	self verticalAlignment: TbElementAlignment vertical center.
	self horizontalAlignment: TbElementAlignment horizontal end
]

{ #category : #'api - alignment' }
TTbAlignable >> alignTopCenter [
	self verticalAlignment: TbElementAlignment vertical start.
	self horizontalAlignment: TbElementAlignment horizontal center
]

{ #category : #'api - alignment' }
TTbAlignable >> alignTopLeft [
	self verticalAlignment: TbElementAlignment vertical start.
	self horizontalAlignment: TbElementAlignment horizontal start
]

{ #category : #'api - alignment' }
TTbAlignable >> alignTopRight [
	self verticalAlignment: TbElementAlignment vertical start.
	self horizontalAlignment: TbElementAlignment horizontal end
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
