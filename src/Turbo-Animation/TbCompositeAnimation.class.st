Class {
	#name : #TbCompositeAnimation,
	#superclass : #TbBaseAnimation,
	#instVars : [
		'animations'
	],
	#category : #'Turbo-Animation-Basic'
}

{ #category : #'instance creation' }
TbCompositeAnimation class >> with: aCollectionOfAnimations [
	<return: #BlCompositeAnimation>

	^ self new addAll: aCollectionOfAnimations
]

{ #category : #adding }
TbCompositeAnimation >> add: anAnimation [
	anAnimation parent: self.
	anAnimation time: self time.

	animations add: anAnimation
]

{ #category : #adding }
TbCompositeAnimation >> addAll: theAnimations [
	theAnimations do: [ :anAnimation | self add: anAnimation ]
]

{ #category : #'api - accessing' }
TbCompositeAnimation >> animations [
	<return: #Collection of: #BlBaseAnimation>

	^ animations
]

{ #category : #'api - running' }
TbCompositeAnimation >> doStep [
	self subclassResponsibility
]

{ #category : #initialization }
TbCompositeAnimation >> initialize [
	super initialize.

	animations := OrderedCollection new
]

{ #category : #'api - running' }
TbCompositeAnimation >> stop [
	super stop.

	self stopChildren
]

{ #category : #'api - running' }
TbCompositeAnimation >> stopChildren [
	animations
		select: [ :anAnimation | anAnimation isRunning ]
		thenDo: [ :anAnimation | anAnimation stop ]
]

{ #category : #accessing }
TbCompositeAnimation >> time: aBlTime [
	super time: aBlTime.
	
	self animations do: [ :anAnimation | anAnimation time: aBlTime ]
]
