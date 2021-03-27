"
I am the abstract class for a Host.
I define an environment that can be used to provide actual screen spaces and rendering.
An Host can be compared to a driver that communicate with native multimedia API.
"
Class {
	#name : #TbHost,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#category : #'Turbo-Core-Universe'
}

{ #category : #'driver selection' }
TbHost class >> availableHostClasses [
	"Return all available bloc host classes sorted by their priority"
	<return: #Collection>

	^ (self allSubclasses select: [ :aHostClass | aHostClass isSupported ])
		sort: [ :a :b | a priority < b priority ]
]

{ #category : #'driver selection' }
TbHost class >> defaultHostClass [
	"Find a default bloc host among all available.
	Return a special null one if there are no available hosts"
	<return: #'BlHost class'>

	^ self availableHostClasses
		"There are no availbale hosts, return a null one"
		ifEmpty: [ TbHeadlessHost ]
		ifNotEmpty: [ :theHostClasses | theHostClasses first ]
]

{ #category : #'driver selection' }
TbHost class >> isSupported [
	^ false
]

{ #category : #'driver selection' }
TbHost class >> label [
	"Return a host name that we can refer to. May be used for settings"
	<return: #String>

	^ self subclassResponsibility
]

{ #category : #'driver selection' }
TbHost class >> pickHost [
	"Find and instantiate a first supported host.
	Return a special null one if there are no available hosts"
	<return: #BlHost>
	
	"If setting is not set dispatches to back to me returning #defaultHostClass"
	^ TbBloc preferableHostClass new
]

{ #category : #'driver selection' }
TbHost class >> priority [
	"Return host priority as positive number which influences host order
	and selection of a default host.
	Lower value - more likely host becomes a default"
	<return: #Number>
	
	^ self subclassResponsibility
]

{ #category : #'host - api' }
TbHost >> createHostSpaceFor: aSpace [
	self subclassResponsibility 
]

{ #category : #'host - api' }
TbHost >> destroyHostSpaceFor: aSpace [
	"Destroys host space window of a given space.
	Note: in most cases under 'destroy host space' we mean 'close host window' and unregister it"
	
	self subclassResponsibility
]

{ #category : #'host - api' }
TbHost >> isRunning [
	"Return true if host is initialized and running"
	<return: #Boolean>

	^ self subclassResponsibility
]

{ #category : #'host - api' }
TbHost >> mainLoopPriority [
	^ Processor userSchedulingPriority - 1
]

{ #category : #'host - api' }
TbHost >> start [
	self subclassResponsibility
]

{ #category : #'host - api' }
TbHost >> stop [
	self subclassResponsibility
]

{ #category : #'host - testing' }
TbHost >> supportsBufferSurface [
	"Return true if this host can work with buffer surface, false otherwise"
	<return: #Boolean>
	
	^ false
]

{ #category : #'host - testing' }
TbHost >> supportsFormSurface [
	"Return true if this host can work with form surface, false otherwise"
	<return: #Boolean>
	
	^ false
]

{ #category : #'host - testing' }
TbHost >> supportsOpenGLSurface [
	"Return true if this host can work with OpenGL surface, false otherwise"
	<return: #Boolean>
	
	^ false
]
