"
Extends the stroke to where the edges on each side bisect.
This is the initial value.

See BlStrokeLineJoin for other types
"
Class {
	#name : #TbStrokeLineMiterJoin,
	#superclass : #TbStrokeLineJoin,
	#category : #'Turbo-Core-Paint-Support'
}

{ #category : #accessing }
TbStrokeLineMiterJoin class >> joinName [
	^ 'Miter'
]
