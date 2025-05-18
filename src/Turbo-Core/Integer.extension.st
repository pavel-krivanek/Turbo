Extension { #name : 'Integer' }

{ #category : '*Turbo-Core' }
Integer >> ceilingTicks: aNumber [
	"Round me to the tick closest to positive infinity on the scale [0...1] that has aNumber of ticks"
	<return: #Float>
	
	^ self asFloat
]

{ #category : '*Turbo-Core' }
Integer >> floorTicks: aNumber [
	"Round me to the tick closest to negative infinity on the scale [0...1] that has aNumber of ticks"
	<return: #Float>
	
	^ self asFloat
]

{ #category : '*Turbo-Core' }
Integer >> roundTicks: aNumber [
	"Round me to the closest tick on the scale [0...1] that has aNumber of ticks"
	<return: #Float>
	
	^ self asFloat
]
