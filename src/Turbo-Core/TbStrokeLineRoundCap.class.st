"
Adds a radius that smooths out the start and end points, which is controlled by the stroke width.

See BlStrokeLineCap for other types
"
Class {
	#name : 'TbStrokeLineRoundCap',
	#superclass : 'TbStrokeLineCap',
	#category : 'Turbo-Core-Paint-Support',
	#package : 'Turbo-Core',
	#tag : 'Paint-Support'
}

{ #category : 'accessing' }
TbStrokeLineRoundCap class >> capName [
	^ 'Round'
]
