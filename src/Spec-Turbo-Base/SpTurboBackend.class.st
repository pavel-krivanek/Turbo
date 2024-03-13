Class {
	#name : #SpTurboBackend,
	#superclass : #SpApplicationBackend,
	#category : #'Spec-Turbo-Base'
}

{ #category : #accessing }
SpTurboBackend class >> backendName [

	^ #Turbo
]

{ #category : #private }
SpTurboBackend >> adapterBindingsClass [

	^ SpTurboAdapterBindings
]

{ #category : #private }
SpTurboBackend >> defaultConfigurationFor: anApplication [

	"At this point, we get informed about the application, let's create Turbo space"
	
	self ensureSpaceFor: anApplication.

	^ SpMockConfiguration new
]

{ #category : #private }
SpTurboBackend >> ensureSpaceFor: anApplication [

	anApplication propertyAt: #turboSpace ifAbsentPut: [ self newSpace ]
]

{ #category : #private }
SpTurboBackend >> newSpace [

	| space universe host |

	space := TbSpace2 new.
	space extent: 80@25.
	space root size: 80@25.	
	
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
	
	^ space.


]
