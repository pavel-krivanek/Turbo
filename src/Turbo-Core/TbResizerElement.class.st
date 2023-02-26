"
I am an overlay that provides the mechanism of resizing a referenceElement. I have eight resizing elements for which the dragging logic are defined in the ==BlResizerListener== hierarchy.

Users might want to specify that I should ==preventMouseEvents== in order to still allow the user to interact with the ==referenceElement== even when I am active.
"
Class {
	#name : #TbResizerElement,
	#superclass : #TbOverlayElement,
	#instVars : [
		'topLeft',
		'topCenter',
		'topRight',
		'middleLeft',
		'middleRight',
		'bottomLeft',
		'bottomCenter',
		'bottomRight',
		'resizerListeners'
	],
	#category : #'Turbo-Core-Utilities - Resizable'
}

{ #category : #'api - attaching / detaching' }
TbResizerElement >> attachTo: anElement [
	super attachTo: anElement.

	resizerListeners do: [ :aResizerListener | aResizerListener resizeTarget: anElement ] 
]

{ #category : #'api - accessing handles' }
TbResizerElement >> bottomCenter [
	<return: #BlElement>

	^ bottomCenter
]

{ #category : #'api - accessing handles' }
TbResizerElement >> bottomLeft [
	<return: #BlElement>

	^ bottomLeft
]

{ #category : #'api - accessing handles' }
TbResizerElement >> bottomRight [
	<return: #BlElement>

	^ bottomRight
]

{ #category : #initialization }
TbResizerElement >> defaultLayout [
	^ TbFrameLayout new
]

{ #category : #initialization }
TbResizerElement >> initialize [
	| topLeftResizer topCenterResizer topRightResizer middleLeftResizer middleRightListener bottomLeftListener bottomCenterResizer bottomRightListener |
	super initialize.
	
	self border: (TbBorder paint: (Color blue alpha: 0.1) width: 5).
	
	topLeft := self newHandle.
	topLeft constraintsDo: [ :c |
		c frame horizontal alignLeft.
		c frame vertical alignTop ].
	
	topLeftResizer := TbResizerTopLeftListener new.
	topLeft addEventHandler: topLeftResizer.
	
	topCenter := self newHandle.
	topCenter constraintsDo: [ :c |
		c frame horizontal alignCenter.
		c frame vertical alignTop ].
	
	topCenterResizer := TbResizerTopListener new.
	topCenter addEventHandler: topCenterResizer.
	
	topRight := self newHandle.
	topRight constraintsDo: [ :c |
		c frame horizontal alignRight.
		c frame vertical alignTop ].
	
	topRightResizer := TbResizerTopRightListener new.
	topRight addEventHandler: topRightResizer.
	
	middleLeft := self newHandle.
	middleLeft constraintsDo: [ :c |
		c frame horizontal alignLeft.
		c frame vertical alignCenter ].
	
	middleLeftResizer := TbResizerLeftListener new.
	middleLeft addEventHandler: middleLeftResizer.
	
	middleRight := self newHandle.
	middleRight constraintsDo: [ :c |
		c frame horizontal alignRight.
		c frame vertical alignCenter ].
	
	middleRightListener := TbResizerRightListener new.
	middleRight addEventHandler: middleRightListener.
	
	bottomLeft := self newHandle.
	bottomLeft constraintsDo: [ :c |
		c frame horizontal alignLeft.
		c frame vertical alignBottom ].
	
	bottomLeftListener := TbResizerBottomLeftListener new.
	bottomLeft addEventHandler: bottomLeftListener.
	
	bottomCenter := self newHandle.
	bottomCenter constraintsDo: [ :c |
		c frame horizontal alignCenter.
		c frame vertical alignBottom ].
	
	bottomCenterResizer := TbResizerBottomListener new.
	bottomCenter addEventHandler: bottomCenterResizer.
	
	bottomRight := self newHandle.
	bottomRight constraintsDo: [ :c |
		c frame horizontal alignRight.
		c frame vertical alignBottom ].

	bottomRightListener := TbResizerBottomRightListener new.
	bottomRight addEventHandler: bottomRightListener.
	
	resizerListeners := { topLeftResizer . topCenterResizer . topRightResizer . middleLeftResizer . middleRightListener . bottomLeftListener . bottomCenterResizer . bottomRightListener }.

	self addChildren: {
		topLeft . topCenter . topRight .
		middleLeft . middleRight .
		bottomLeft . bottomCenter . bottomRight .
	}
]

{ #category : #'api - accessing handles' }
TbResizerElement >> middleLeft [
	<return: #BlElement>

	^ middleLeft
]

{ #category : #'api - accessing handles' }
TbResizerElement >> middleRight [
	<return: #BlElement>

	^ middleRight
]

{ #category : #'instance creation' }
TbResizerElement >> newHandle [
	^ TbElement new
		opacity: 0.5;
		background: (Color white);
		border: (TbBorder paint: Color gray width: 1);
		size: 6@6
]

{ #category : #'api - accessing handles' }
TbResizerElement >> topCenter [
	<return: #BlElement>

	^ topCenter
]

{ #category : #'api - accessing handles' }
TbResizerElement >> topLeft [
	<return: #BlElement>

	^ topLeft
]

{ #category : #'api - accessing handles' }
TbResizerElement >> topRight [
	<return: #BlElement>

	^ topRight
]
