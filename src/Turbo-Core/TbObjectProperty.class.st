"
I am the concrete class for writable observable properties.
I am not specialized and i can be used as a generic value holder.
"
Class {
	#name : #TbObjectProperty,
	#superclass : #TbObservableProperty,
	#category : #'Turbo-Core-Property'
}

{ #category : #'instance creation' }
TbObjectProperty class >> on: anOwner named: aSymbol default: aValue [
	^ self new
		name: aSymbol;
		owner: anOwner;
		rawValue: aValue;
		yourself
]

{ #category : #initialization }
TbObjectProperty >> initialize [
	super initialize.
	isValid := true
]

{ #category : #accessing }
TbObjectProperty >> value: anObject [
	self rawValue = anObject ifTrue: [ ^ self ].
	self invalidateDuring: [ 
		self rawValue: anObject.
		self notifyValueChanged ]
]
