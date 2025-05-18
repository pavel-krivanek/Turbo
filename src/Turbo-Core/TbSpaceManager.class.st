"
I am a Universe space manager.

I contain Bloc spaces, can add or remove them. I am also responsible for sending pulses(tick) messages to spaces I know.

I am used by Universe in order to provide support of multiple spaces within the Universe.

- addSpace: add a space
- removeSpace: remove a given space
- clear close all spaces
- pulse send pulse message to all spaces

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	spaces:		<Object>


    Implementation Points
"
Class {
	#name : 'TbSpaceManager',
	#superclass : 'Object',
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'spaces'
	],
	#category : 'Turbo-Core-Universe',
	#package : 'Turbo-Core',
	#tag : 'Universe'
}

{ #category : 'adding' }
TbSpaceManager >> addSpace: aSpace [

	self
		assert: [ (spaces includes: aSpace) not ]
		description: [ 'Can not add space that is already managed!' ].

	spaces := spaces copyWith: aSpace
]

{ #category : 'testing' }
TbSpaceManager >> hasSpace: aSpace [
	"Return true if a given space is registered, false otherwise"
	<return: #Boolean>

	^ self spaces includes: aSpace
]

{ #category : 'testing' }
TbSpaceManager >> hasSpaces [
	"Return true if there are registered spaces, false otherwise"
	<return: #Boolean>

	^ self spaces isNotEmpty
]

{ #category : 'initialization' }
TbSpaceManager >> initialize [
	super initialize.

	spaces := #()
]

{ #category : 'pulse' }
TbSpaceManager >> pulse [
	spaces do: [ :aSpace | aSpace pulse ]
]

{ #category : 'adding' }
TbSpaceManager >> removeSpace: aSpace [

	self
		assert: [ spaces includes: aSpace ]
		description: [ 'Can not remove space that is not managed!' ].

	spaces := spaces copyWithout: aSpace
]

{ #category : 'accessing' }
TbSpaceManager >> spaces [
	"Return a collection of all existing spaces"
	<return: #Array>

	^ spaces
]
