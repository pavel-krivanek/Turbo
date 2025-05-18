"
I define an interface that transformable objects should implement in order to support affine transformations
"
Trait {
	#name : 'TTbTransformable',
	#category : 'Turbo-Core-Basic-Transformations',
	#package : 'Turbo-Core',
	#tag : 'Basic-Transformations'
}

{ #category : 'transformations' }
TTbTransformable >> transform [
	<return: #BlTransformationBuilder>
	
	^ TbTransformationBuilder on: self
]

{ #category : 'transformations' }
TTbTransformable >> transformDo: aBlock [
	| aTransformationBuilder |

	aTransformationBuilder := self transform.
	aBlock value: aTransformationBuilder.
	aTransformationBuilder apply
]

{ #category : 'transformations' }
TTbTransformable >> transformation [
	"Return an object that represents a description of my transformation.
	It can either be a local transformation being a composition of affine transformations or
	and absolute transformation directly defined with matrix"
	<return: #BlElementTransformation>

	^ self explicitRequirement
]

{ #category : 'transformations' }
TTbTransformable >> transformation: anElementTransformation [
	self explicitRequirement
]
