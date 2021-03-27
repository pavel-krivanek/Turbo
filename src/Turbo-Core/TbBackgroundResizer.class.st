"
I am an abstract background resizer.
My main responsibility is to adapt background to element's size.

My subclasses must implement adapt:to:
"
Class {
	#name : #TbBackgroundResizer,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#category : #'Turbo-Core-Basic-Background'
}

{ #category : #'instance creation' }
TbBackgroundResizer class >> exact: anExtent [
	"Return an instance of exact background resizer for a given extent as a point.
	anExtent must not be nil"
	<return: #BlBackgroundResizer>
	
	^ BlBackgroundExactResizer extent: anExtent
]

{ #category : #'instance creation' }
TbBackgroundResizer class >> match [
	"Return an instance of resizer that makes background be as big as owner element"
	<return: #BlBackgroundResizer>

	^ BlBackgroundMatchResizer uniqueInstance
]
