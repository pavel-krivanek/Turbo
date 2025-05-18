Class {
	#name : 'TbFocusSearchDirectionRight',
	#superclass : 'TbFocusSearchDirectionAbsolute',
	#category : 'Turbo-Core-Utilities - Focus',
	#package : 'Turbo-Core',
	#tag : 'Utilities - Focus'
}

{ #category : 'testing' }
TbFocusSearchDirectionRight >> beamsOverlap: aBlBounds and: anotherBlBounds [
	"	
	Beams overlap:
	
	|------------|. . . . . . . . . . . . . . . . . . . . .   (
	|            |
	|  (first)   |...........|---------------|.............   [
	|            |           |               |              
	|____________|. . . . . .|   (another)   |. . . . . . .   )
	                         |               |
	.........................|_______________|.............   ]


	Don't overlap:

   |------------|. . . . . . . . . . . . . . . . . . . . .   (
	|            |
	|  (first)   |
	|            |
	|____________|. . . . . . . . . . . . . . . . . . . . .   )

	
	.........................|---------------|.............   [
	                         |               |              
	                         |   (another)   |
	                         |               |
	.........................|_______________|.............   ]
"
	<return: #Boolean>

	^ anotherBlBounds bottom >= aBlBounds top
		and: [ anotherBlBounds top <= aBlBounds bottom ]
]

{ #category : 'focus' }
TbFocusSearchDirectionRight >> initFocusedBounds: aFocusedBounds root: aFocusRootElement [
	aFocusedBounds
		left: 0
		top: 0
		right: 0
		bottom: 0
]

{ #category : 'testing' }
TbFocusSearchDirectionRight >> is: aDestinationBlBounds candidate: aSourceBlBounds [
	"Return if destination bounds are located (at least partially) in direction
	of a given source bounds depending on my direction type, false otherwise"
	<return: #Boolean>

	^ (aSourceBlBounds left < aDestinationBlBounds left
		or: [ aSourceBlBounds right <= aDestinationBlBounds left ])
			and: [ aSourceBlBounds right < aDestinationBlBounds right ]
]

{ #category : 'testing' }
TbFocusSearchDirectionRight >> is: aDestinationBlBounds inDirection: aSourceBlBounds [
	"In case of right direction destination bounds must be located to right from source"
	<return: #Boolean>

	^ aSourceBlBounds right <= aDestinationBlBounds left
]

{ #category : 'testing' }
TbFocusSearchDirectionRight >> isHorizontal [
	"Return true if direction is horizontal, false otherwise"
	<return: #Boolean>
	
	^ true
]

{ #category : 'geometry' }
TbFocusSearchDirectionRight >> majorAxisDistance: aDestinationBlBounds and: aSourceBlBounds [
	"Return the distance along a major axis depending on the type of direction
	from the furthers source bounds' edge to the nearest edge of the destination bounds"
	<return: #Number>
	
	^ aDestinationBlBounds left - aSourceBlBounds right
]

{ #category : 'geometry' }
TbFocusSearchDirectionRight >> majorAxisDistanceToFarEdge: aDestinationBlBounds and: aSourceBlBounds [
	"Return the distance along a major axis depending on the type of direction
	from the furthers source bounds' edge to the far edge of the destination bounds"
	<return: #Number>
	
	^ aDestinationBlBounds right - aSourceBlBounds right
]

{ #category : 'geometry' }
TbFocusSearchDirectionRight >> minorAxisDistance: aDestinationBlBounds and: aSourceBlBounds [
	"Return the distance along a minor axis depending on the type of direction
	from source bounds to the nearest edge of the destination bounds"
	<return: #Number>
	
	^ (((aSourceBlBounds top + aSourceBlBounds height) / 2.0)
		- ((aDestinationBlBounds top + aDestinationBlBounds height) / 2.0)) abs
]

{ #category : 'geometry' }
TbFocusSearchDirectionRight >> offsetCandidateBounds: aCandidateBounds according: aFocusedBounds [
	"Offsets a given candidate bounds according to provided focused bounds based on direction type"

	aCandidateBounds
		translateX: (aFocusedBounds width + 1) negated
		Y: 0
]
