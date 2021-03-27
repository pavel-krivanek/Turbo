Class {
	#name : #TbVT100,
	#superclass : #VTermOutputDriver,
	#category : #'Turbo-Terminal'
}

{ #category : #escaping }
TbVT100 >> csiEscape [
	"Control Sequence Introducer escape"
	outStream nextPutAll: (Character escape asString); nextPutAll: '['
]

{ #category : #escaping }
TbVT100 >> moveAt: aPoint [

	self csiEscape.
	outStream print: aPoint y asInteger; nextPutAll: ';'; print: aPoint x asInteger; nextPutAll: 'H'.
]

{ #category : #escaping }
TbVT100 >> reportAllMouse [

	self csiEscape.
	outStream nextPutAll: '?1003h'; flush.
	
]

{ #category : #escaping }
TbVT100 >> reportOnMouseButtonPress [

	self csiEscape.
	outStream nextPutAll: '?9h'; flush.
	
]

{ #category : #escaping }
TbVT100 >> reportOnMouseButtonPressAndRelease [

	self csiEscape.
	outStream nextPutAll: '?1000h'; flush.
	
]

{ #category : #escaping }
TbVT100 >> reportOnMouseHighlight [

	self csiEscape.
	outStream nextPutAll: '?1001h'; flush.
	
]

{ #category : #escaping }
TbVT100 >> reportOnMouseMovementsWhilePressed [

	self csiEscape.
	outStream nextPutAll: '?1002h'; flush.
	
]
