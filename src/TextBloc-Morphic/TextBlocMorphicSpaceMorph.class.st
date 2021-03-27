Class {
	#name : #TextBlocMorphicSpaceMorph,
	#superclass : #Morph,
	#instVars : [
		'hostSpace',
		'form'
	],
	#category : #'TextBloc-Morphic'
}

{ #category : #examples }
TextBlocMorphicSpaceMorph class >> example1 [

	<example>
	
	| e1 e2 e3 space universe host |
	
	e1 := TextBlocFrameElement new.
	e1 size: 23@4.
	e2 := TextBlocFrameElement new.
	e2 size: 20@6.
	e3 := TextBlocHelloElement new.
	e3 size: 15@2.
	e3 relocate: 2@2.

	space := BlSpace new.
	space extent: 50@20.
	space root layout: BlFlowLayout new horizontal.
	space root relocate: 2@2.
	space root addChild: e1.
	space root addChild: e2.
	e2 addChild: e3.

	universe := BlUniverse new.
	universe pulseLoop: (TextBlocPulseLoop new 
		universe: universe;
		yourself).

	host := TextBlocMorphicHost new.
	space host: host.
	universe spaceManager addSpace: space.

	space host createHostSpaceFor: space.
	space hostSpace show.

	universe start.
	space dispatchEvent: (BlSpaceShownEvent new space: universe).


]

{ #category : #examples }
TextBlocMorphicSpaceMorph class >> example2 [

	<example>
	
| e1 e2 e3 space universe host moved  clickHandler animation |
	
	e1 := TextBlocFrameElement new.
	e1 size: 23@4.
	e2 := TextBlocFrameElement new.
	e2 size: 20@6.
	e3 := TextBlocHelloElement new.
	e3 size: 15@2.
	e3 relocate: 2@2.
	

	space := BlSpace new.
	space extent: 50@20.
	space root layout: BlFlowLayout new horizontal.
"	space root relocate: 2@2."
	space root addChild: e1.
	space root addChild: e2.
	e2 addChild: e3.

	universe := BlUniverse new.
	universe pulseLoop: (TextBlocPulseLoop new 
		universe: universe;
		yourself).

	host := TextBlocMorphicHost new.
	space host: host.
	universe spaceManager addSpace: space.

	space host createHostSpaceFor: space.
	space hostSpace show.
	
	
	moved := e2.
	clickHandler := BlEventHandler
		on: BlClickEvent
		do: [ :evt |
				animation := BlTransformAnimation new.
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
	space dispatchEvent: (BlSpaceShownEvent new space: universe).


]

{ #category : #accessing }
TextBlocMorphicSpaceMorph >> drawOn: aCanvas [

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
TextBlocMorphicSpaceMorph >> form [

	^ form
]

{ #category : #accessing }
TextBlocMorphicSpaceMorph >> hostSpace [
	^ hostSpace
]

{ #category : #accessing }
TextBlocMorphicSpaceMorph >> hostSpace: anObject [
	hostSpace := anObject
]

{ #category : #accessing }
TextBlocMorphicSpaceMorph >> initialize [

	super initialize.
	form := Form extent: self extent depth: 32. 
]

{ #category : #accessing }
TextBlocMorphicSpaceMorph >> layoutChanged [
	"Don't pass to owner, since the receiver doesn't care! Improves frame rate."
	
	super layoutChanged.
	form := form setExtent: self extent depth: 32.
	

]
