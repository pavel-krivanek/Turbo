Class {
	#name : #TbFocusSearchDirectionDown,
	#superclass : #TbFocusSearchDirectionAbsolute,
	#category : #'Turbo-Core-Utilities - Focus'
}

{ #category : #testing }
TbFocusSearchDirectionDown >> beamsOverlap: aBlBounds and: anotherBlBounds [
	<return: #Boolean>
	
	^ anotherBlBounds right >= aBlBounds left
		and: [ anotherBlBounds left <= aBlBounds right ]
]

{ #category : #focus }
TbFocusSearchDirectionDown >> initFocusedBounds: aFocusedBounds root: aFocusRootElement [
	aFocusedBounds
		left: 0
		top: 0
		right: 0
		bottom: 0
]

{ #category : #testing }
TbFocusSearchDirectionDown >> is: aDestinationBlBounds candidate: aSourceBlBounds [
	"Return if destination bounds are located (at least partially) in direction
	of a given source bounds depending on my direction type, false otherwise"
	<return: #Boolean>

	^ (aSourceBlBounds top < aDestinationBlBounds top
		or: [ aSourceBlBounds bottom <= aDestinationBlBounds top ])
			and: [ aSourceBlBounds bottom < aDestinationBlBounds bottom ]
]

{ #category : #testing }
TbFocusSearchDirectionDown >> is: aDestinationBlBounds inDirection: aSourceBlBounds [
	"In case of down direction destination bounds must be located below the source"
	<return: #Boolean>

	^ aSourceBlBounds bottom <= aDestinationBlBounds top
]

{ #category : #testing }
TbFocusSearchDirectionDown >> isHorizontal [
	"Return true if direction is horizontal, false otherwise"
	<return: #Boolean>
	
	^ false
]

{ #category : #geometry }
TbFocusSearchDirectionDown >> majorAxisDistance: aDestinationBlBounds and: aSourceBlBounds [
	"Return the distance along a major axis depending on the type of direction
	from the furthers source bounds' edge to the nearest edge of the destination bounds"
	<return: #Number>
	
	^ aDestinationBlBounds top - aSourceBlBounds bottom
]

{ #category : #geometry }
TbFocusSearchDirectionDown >> majorAxisDistanceToFarEdge: aDestinationBlBounds and: aSourceBlBounds [
	"Return the distance along a major axis depending on the type of direction
	from the furthers source bounds' edge to the far edge of the destination bounds"
	<return: #Number>
	
	^ aDestinationBlBounds bottom - aSourceBlBounds bottom
]

{ #category : #geometry }
TbFocusSearchDirectionDown >> minorAxisDistance: aDestinationBlBounds and: aSourceBlBounds [
	"Return the distance along a minor axis depending on the type of direction
	from source bounds to the nearest edge of the destination bounds"
	<return: #Number>
	
	^ (((aSourceBlBounds left + aSourceBlBounds width) / 2.0)
		- ((aDestinationBlBounds left + aDestinationBlBounds width) / 2.0)) abs
]

{ #category : #geometry }
TbFocusSearchDirectionDown >> offsetCandidateBounds: aCandidateBounds according: aFocusedBounds [
	"Offsets a given candidate bounds according to provided focused bounds based on direction type"

	aCandidateBounds
		translateX: 0
		Y: (aFocusedBounds height + 1) negated
]
