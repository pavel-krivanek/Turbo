Trait {
	#name : #TTbSpartaTransformable,
	#category : #'Turbo-Math'
}

{ #category : #transformations }
TTbSpartaTransformable >> multiplyBy: aMatrix [
	aMatrix spartaMultiplyWith: self transformation
]

{ #category : #transformations }
TTbSpartaTransformable >> rotateByDegrees: angle [

	self transformation rotateByDegrees: angle
]

{ #category : #transformations }
TTbSpartaTransformable >> rotateByRadians: angle [

	self transformation rotateByRadians: angle
]

{ #category : #transformations }
TTbSpartaTransformable >> scaleBy: aPointOrNumber [

	self transformation scaleBy: aPointOrNumber
]

{ #category : #transformations }
TTbSpartaTransformable >> scaleX: aX Y: aY [

	self transformation scaleX: aX Y: aY
]

{ #category : #accessing }
TTbSpartaTransformable >> transformation [
	<return: #TbSpartaMatrix>

	^ self explicitRequirement
]

{ #category : #transformations }
TTbSpartaTransformable >> translateBy: aPointOrNumber [

	self transformation translateBy: aPointOrNumber asPoint
]

{ #category : #transformations }
TTbSpartaTransformable >> translateX: aX Y: aY [

	self transformation translateX: aX Y: aY
]
