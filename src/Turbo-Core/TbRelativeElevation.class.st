"
I am the most commonly used elevation given in relative to the parent. It allows us to construct independent complex reusable visual components with support of inner elevation (a pyramid of elements).

Note: Relative elevation can be negative!
"
Class {
	#name : 'TbRelativeElevation',
	#superclass : 'TbElevation',
	#classInstVars : [
		'zero'
	],
	#category : 'Turbo-Core-Basic-Properties',
	#package : 'Turbo-Core',
	#tag : 'Basic-Properties'
}

{ #category : 'cleanup' }
TbRelativeElevation class >> cleanUp [
	super cleanUp.
	
	zero := nil
]

{ #category : 'instance creation' }
TbRelativeElevation class >> zero [
	<return: #BlGlobalElevation>

	^ zero ifNil: [ zero := self elevation: 0 ]
]

{ #category : 'accessing' }
TbRelativeElevation >> relatedTo: aNumber [
	"Resulting elevation is a sum of a given and my relative one"
	<return: #Number>

	^ aNumber + self elevation
]
