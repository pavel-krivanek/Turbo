Class {
	#name : #TbScrollableElement,
	#superclass : #TbElement,
	#traits : 'TTbScrollable + TTbAlignable',
	#classTraits : 'TTbScrollable classTrait + TTbAlignable classTrait',
	#instVars : [
		'scrollState',
		'scrollFlinger',
		'scrollPosition',
		'scrollAlignment',
		'horizontalAlignment',
		'verticalAlignment'
	],
	#category : #'Turbo-Core-Utilities - Scrolling'
}

{ #category : #conversion }
TbScrollableElement >> asScrollableElement [
	^ self
]

{ #category : #accessing }
TbScrollableElement >> contentElement [
	self 
		deprecated: 'Use contentElement instead'
		on: 	'8 May 2018' 
		in: 'Pharo-6.0-60540-'.
	^ self contentElement
]

{ #category : #initialization }
TbScrollableElement >> defaultHorizontalAlignment [
	"By default alignment should not influence on layout process,
	so to not deal with nils use null object"
	<return: #BlNullAlignment>
	
	^ TbElementAlignment null horizontal
]

{ #category : #initialization }
TbScrollableElement >> defaultLayout [
	^ TbFrameLayout new
]

{ #category : #initialization }
TbScrollableElement >> defaultVerticalAlignment [
	"By default alignment should not influence on layout process,
	so to not deal with nils use null object"
	<return: #BlNullAlignment>
	
	^ TbElementAlignment null vertical
]

{ #category : #scrolling }
TbScrollableElement >> flingBy: aVelocityPoint [
	self scrollFlinger flingBy: aVelocityPoint
]

{ #category : #accessing }
TbScrollableElement >> horizontalAlignment [
	<return: #BlElementAlignment>

	^ horizontalAlignment
]

{ #category : #accessing }
TbScrollableElement >> horizontalAlignment: aBlElementAlignment [
	horizontalAlignment := aBlElementAlignment.
	self requestLayout
]

{ #category : #initialization }
TbScrollableElement >> initialize [
	super initialize.

	scrollFlinger := TbScrollFlinger on: self.
	scrollPosition := 0@0.
	scrollState := #idle.
	horizontalAlignment := self defaultHorizontalAlignment.
	verticalAlignment := self defaultVerticalAlignment.

	self addEventHandler: TbScrollableElementEventHandler new
]

{ #category : #layout }
TbScrollableElement >> layoutApplyAlignment [
	| aContent |
	
	aContent := self scrolledElement.
	
	(aContent measuredWidth < self width)
		ifTrue: [
			| aHorizontalTranslation |
			aHorizontalTranslation := (self horizontalAlignment translationOf: aContent measuredBounds bounds in: self bounds inLocal bounds) x.
			scrollPosition := scrollPosition + (aHorizontalTranslation @ 0) ].
		
	(aContent measuredHeight < self height)
		ifTrue: [
			| aVerticalTranslation |
			aVerticalTranslation := (self verticalAlignment translationOf: aContent measuredBounds bounds in: self bounds inLocal bounds) y.
			scrollPosition := scrollPosition + (0 @ aVerticalTranslation) ].
	
	aContent measuredBounds position: scrollPosition
]

{ #category : #layout }
TbScrollableElement >> layoutClampPosition [
	| aCurrentPositionX aContent aMinPositionX aMaxPositionX aNewClampedPositionX aCurrentPositionY aMinPositionY aMaxPositionY aNewClampedPositionY |
	
	aContent := self scrolledElement.
	
	aCurrentPositionX := scrollPosition x.
	aMinPositionX := (self width - aContent measuredWidth) min: 0.
	aMaxPositionX := 0.
	aNewClampedPositionX := (aCurrentPositionX max: aMinPositionX) min: aMaxPositionX.
	
	aCurrentPositionY := scrollPosition y.
	aMinPositionY := (self height - aContent measuredHeight) min: 0.
	aMaxPositionY := 0.
	aNewClampedPositionY := (aCurrentPositionY max: aMinPositionY) min: aMaxPositionY.
	scrollPosition := aNewClampedPositionX @ aNewClampedPositionY.

	aContent measuredBounds position: scrollPosition.
]

{ #category : #layout }
TbScrollableElement >> layoutFixGap [
	| aContent aGapX aGapY |
	
	aContent := self scrolledElement.
	
	aGapX := (self width - aContent measuredBounds bounds right) max: 0.
	scrollPosition x < 0
		ifTrue: [
			| aNewX |
			aNewX := (scrollPosition x + aGapX) min: 0.
			scrollPosition := aNewX @ scrollPosition y ].
	
	aGapY := (self height - aContent measuredBounds bounds bottom) max: 0.	
	scrollPosition y < 0
		ifTrue: [
			| aNewY |
			aNewY := (scrollPosition y + aGapY) min: 0.
			scrollPosition := scrollPosition x @ aNewY ].

	aContent measuredBounds position: scrollPosition
]

{ #category : #layout }
TbScrollableElement >> onLayout: aBounds [
	self scrollFlinger isIdle
		ifFalse: [ ^ super onLayout: aBounds ].
	
	"first we fix a gap"	
	self layoutFixGap.

	"now clamp position"
	self layoutClampPosition.
	
	"then we allign content if it is smaller than the scrollpane"
	self layoutApplyAlignment.

	super onLayout: aBounds
]

{ #category : #scrolling }
TbScrollableElement >> scrollBy: aPoint [
	"Instant scroll by the given amount of pixels along either axis.
	Return true if a scroll happens."
	<return: #Boolean>
	| aContent dX dY |

	aContent := self children first.

	dX := aPoint x negated.
	dY := aPoint y.
	
	self canScrollHorizontally
		ifTrue: [
			| aNewPosition aMinPosition aMaxPosition aNewClampedPosition |
			
			aNewPosition := self scrollPosition x + dX.
			aMinPosition := (self width - aContent width) min: 0.
			aMaxPosition := 0.
			aNewClampedPosition := (aNewPosition max: aMinPosition) min: aMaxPosition.
			
			dX := aNewClampedPosition - self scrollPosition x ]
		ifFalse: [ dX := 0 ].
	
	self canScrollVertically
		ifTrue: [
			| aNewPosition aMinPosition aMaxPosition aNewClampedPosition |
			
			aNewPosition := self scrollPosition y + dY.
			aMinPosition := (self height - aContent height) min: 0.
			aMaxPosition := 0.
			aNewClampedPosition := (aNewPosition max: aMinPosition) min: aMaxPosition.
			
			dY := aNewClampedPosition - self scrollPosition y ]
		ifFalse: [ dY := 0 ].
	
	dX isZero
		ifFalse: [self scrollHorizontallyBy: dX  ].

	dY isZero
		ifFalse: [ self scrollVerticallyBy: dY ].
		
	^ ((dX isZero not) or: [ dY isZero not ])
]

{ #category : #'api - scrolling accessing' }
TbScrollableElement >> scrollFlinger [
	<return: #BlScrollFlinger>

	^ scrollFlinger
]

{ #category : #'api - scrolling' }
TbScrollableElement >> scrollHorizontallyBy: aNumber [
	"Scroll horizontally by aNumber and return the distance traveled.
	The default implementation does nothing and returns 0."
	<return: #Number>
	| aContent |
	
	aContent := self children first.
	scrollPosition := scrollPosition + (aNumber @ 0).
	aContent relocate: scrollPosition.

	^ aNumber
]

{ #category : #'api - scrolling geometry' }
TbScrollableElement >> scrollMaximum [
	<return: #Point>
	
	^ 0@0
]

{ #category : #'api - scrolling geometry' }
TbScrollableElement >> scrollMinimum [
	<return: #Point>
	
	^ (self extent - self scrolledElement extent) min: 0@0
]

{ #category : #'api - scrolling geometry' }
TbScrollableElement >> scrollOvershot [
	<return: #Point>
	
	^ self extent / 2.0
]

{ #category : #'api - scrolling geometry' }
TbScrollableElement >> scrollPosition [
	<return: #Point>
	
	^ scrollPosition
]

{ #category : #'private - scrolling accessing' }
TbScrollableElement >> scrollState [
	"Return the current scrolling state"
	<return: #Symbol>
	
	^ scrollState
]

{ #category : #'private - scrolling accessing' }
TbScrollableElement >> scrollState: aScrollState [
	"Internal! Never set me directly"
	
	scrollState := aScrollState
]

{ #category : #'api - scrolling' }
TbScrollableElement >> scrollVerticallyBy: aNumber [
	"Scroll vertically by aNumber and return the distance traveled.
	The default implementation does nothing and returns 0."
	<return: #Number>
	| aContent |
	
	aContent := self children first.
	scrollPosition := scrollPosition + (0 @ aNumber).
	aContent relocate: scrollPosition.

	^ aNumber
]

{ #category : #accessing }
TbScrollableElement >> scrolledElement [
	<return: #BlElement>

	^ self children first
]

{ #category : #scrolling }
TbScrollableElement >> smoothScrollBy: aPoint [
	"Animate a scroll by the given amount of pixels along either axis"
	| dX dY |
	
	dX := aPoint x.
	dY := aPoint y.
	
	self canScrollHorizontally
		ifFalse: [ dX := 0 ].
	
	self canScrollVertically
		ifFalse: [ dY := 0 ].
	
	(dX isZero and: [ dY isZero ])
		ifFalse: [ scrollFlinger smoothScrollBy: dX @ dY ]
]

{ #category : #accessing }
TbScrollableElement >> verticalAlignment [
	<return: #BlElementAlignment>
	
	^ verticalAlignment
]

{ #category : #accessing }
TbScrollableElement >> verticalAlignment: aBlElementAlignment [
	verticalAlignment := aBlElementAlignment.
	self requestLayout
]
