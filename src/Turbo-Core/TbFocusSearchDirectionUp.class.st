Class {
	#name : #TbFocusSearchDirectionUp,
	#superclass : #TbFocusSearchDirectionAbsolute,
	#category : #'Turbo-Core-Utilities - Focus'
}

{ #category : #testing }
TbFocusSearchDirectionUp >> beamsOverlap: aBlBounds and: anotherBlBounds [
	<return: #Boolean>
	
	^ anotherBlBounds right >= aBlBounds left
		and: [ anotherBlBounds left <= aBlBounds right ]
]

{ #category : #focus }
TbFocusSearchDirectionUp >> initFocusedBounds: aFocusedBounds root: aFocusRootElement [
	aFocusedBounds
		left: aFocusRootElement width
		top: aFocusRootElement height
		right: aFocusRootElement width
		bottom: aFocusRootElement height
]

{ #category : #testing }
TbFocusSearchDirectionUp >> is: aDestinationBlBounds candidate: aSourceBlBounds [
	"Return if destination bounds are located (at least partially) in direction
	of a given source bounds depending on my direction type, false otherwise"
	<return: #Boolean>

	^ (aSourceBlBounds bottom > aDestinationBlBounds bottom
		or: [ aSourceBlBounds top >= aDestinationBlBounds bottom ])
			and: [ aSourceBlBounds top > aDestinationBlBounds top ]
]

{ #category : #testing }
TbFocusSearchDirectionUp >> is: aDestinationBlBounds inDirection: aSourceBlBounds [
	"In case of up direction destination bounds must be located below the source"
	<return: #Boolean>

	^ aSourceBlBounds top >= aDestinationBlBounds bottom
]

{ #category : #testing }
TbFocusSearchDirectionUp >> isHorizontal [
	"Return true if direction is horizontal, false otherwise"
	<return: #Boolean>
	
	^ false
]

{ #category : #geometry }
TbFocusSearchDirectionUp >> majorAxisDistance: aDestinationBlBounds and: aSourceBlBounds [
	"Return the distance along a major axis depending on the type of direction
	from the furthers source bounds' edge to the nearest edge of the destination bounds"
	<return: #Number>
	
	^ aSourceBlBounds top - aDestinationBlBounds bottom
]

{ #category : #geometry }
TbFocusSearchDirectionUp >> majorAxisDistanceToFarEdge: aDestinationBlBounds and: aSourceBlBounds [
	"Return the distance along a major axis depending on the type of direction
	from the furthers source bounds' edge to the far edge of the destination bounds"
	<return: #Number>
	
	^ aSourceBlBounds top - aDestinationBlBounds top
]

{ #category : #geometry }
TbFocusSearchDirectionUp >> minorAxisDistance: aDestinationBlBounds and: aSourceBlBounds [
	"Return the distance along a minor axis depending on the type of direction
	from source bounds to the nearest edge of the destination bounds"
	<return: #Number>
	
	^ (((aSourceBlBounds left + aSourceBlBounds width) / 2.0)
		- ((aDestinationBlBounds left + aDestinationBlBounds width) / 2.0)) abs
]

{ #category : #geometry }
TbFocusSearchDirectionUp >> offsetCandidateBounds: aCandidateBounds according: aFocusedBounds [
	"Offsets a given candidate bounds according to provided focused bounds based on direction type"

	aCandidateBounds
		translateX: 0
		Y: aFocusedBounds height + 1
]
