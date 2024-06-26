Class {
	#name : #TbMorphicSpaceMorph,
	#superclass : #Morph,
	#instVars : [
		'hostSpace',
		'form'
	],
	#category : #'Turbo-Morphic'
}

{ #category : #examples }
TbMorphicSpaceMorph class >> example1 [

	<example>
	
	| e1 e2 e3 space universe host |
	
	e1 := TbFrameElement new.
	e1 size: 23@4.
	e2 := TbFrameElement new.
	e2 size: 20@6.
	e3 := TbHelloElement new.
	e3 size: 15@2.
	e3 relocate: 2@2.

	space := TbSpace new.
	space extent: 50@20.
	space root layout: TbFlowLayout new horizontal.
	space root relocate: 2@2.
	space root addChild: e1.
	space root addChild: e2.
	e2 addChild: e3.

	universe := TbUniverse new.
	universe pulseLoop: (TbPulseLoop2 new 
		universe: universe;
		yourself).

	host := TbMorphicHost new.
	space host: host.
	universe spaceManager addSpace: space.

	space host createHostSpaceFor: space.
	space hostSpace show.

	universe start.
	space dispatchEvent: (TbSpaceShownEvent new space: universe).


]

{ #category : #examples }
TbMorphicSpaceMorph class >> example2 [

	<example>
	
| e1 e2 e3 space universe host moved  clickHandler animation |
	
	e1 := TbFrameElement new.
	e1 size: 23@4.
	e2 := TbFrameElement new.
	e2 size: 20@6.
	e3 := TbHelloElement new.
	e3 size: 15@2.
	e3 relocate: 2@2.
	

	space := TbSpace new.
	space extent: 50@20.
	space root layout: TbFlowLayout new horizontal.
"	space root relocate: 2@2."
	space root addChild: e1.
	space root addChild: e2.
	e2 addChild: e3.

	universe := TbUniverse new.
	universe pulseLoop: (TbPulseLoop2 new 
		universe: universe;
		yourself).

	host := TbMorphicHost new.
	space host: host.
	universe spaceManager addSpace: space.

	space host createHostSpaceFor: space.
	space hostSpace show.
	
	
	moved := e2.
	clickHandler := TbEventHandler
		on: TbClickEvent
		do: [ :evt | 
				animation := TbTransformAnimation new.
	animation transform
		translateBy: (evt position - moved position );
		rotateBy: 0;
		apply.
	animation absolute.
	animation duration: 200 milliSeconds.
	moved addAnimation: animation.
			
			].
	space root addEventHandler: clickHandler.

	
	universe start.
	space dispatchEvent: (TbSpaceShownEvent new space: universe).


]

{ #category : #accessing }
TbMorphicSpaceMorph >> drawOn: aCanvas [

"	super drawOn: aCanvas."

	aCanvas clipBy: self fullBounds during: [ :aClippedCanvas |
		aClippedCanvas drawImage: form at: self position ] 
	
	"spaceForm := form.
	spaceForm isNull
		ifTrue: [ ^ self ].
	hostSpace ifNotNil: [ 
		hostSpace lock critical: [
			aCanvas clipBy: self fullBounds during: [ :aClippedCanvas |
				aClippedCanvas drawImage: spaceForm at: self position ] ] ]"
]

{ #category : #accessing }
TbMorphicSpaceMorph >> form [

	^ form
]

{ #category : #accessing }
TbMorphicSpaceMorph >> hostSpace [
	^ hostSpace
]

{ #category : #accessing }
TbMorphicSpaceMorph >> hostSpace: anObject [
	hostSpace := anObject
]

{ #category : #accessing }
TbMorphicSpaceMorph >> initialize [

	super initialize.
	form := Form extent: self extent depth: 32. 
]

{ #category : #accessing }
TbMorphicSpaceMorph >> layoutChanged [
	"Don't pass to owner, since the receiver doesn't care! Improves frame rate."
	
	super layoutChanged.
	form := form setExtent: self extent depth: 32.
	

]
