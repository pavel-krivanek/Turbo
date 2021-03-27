Class {
	#name : #TbElementChangeRecordWithContext,
	#superclass : #TbElementChangeRecord,
	#instVars : [
		'context',
		'timestamp'
	],
	#category : #'Turbo-Core-Basic-Changes'
}

{ #category : #accessing }
TbElementChangeRecordWithContext >> context [
	^ context
]

{ #category : #accessing }
TbElementChangeRecordWithContext >> context: anObject [
	context := anObject
]

{ #category : #printing }
TbElementChangeRecordWithContext >> gtDisplayOn: aStream [
	super gtDisplayOn: aStream.
	
	aStream
		nextPutAll: ' | (';
		nextPutAll: self context asString;
		nextPutAll: ')';
		nextPutAll: ' | (';
		nextPutAll: timestamp asString;
		nextPutAll: ')'
]

{ #category : #initialization }
TbElementChangeRecordWithContext >> initialize [
	super initialize.
	
	timestamp := DateAndTime now
]

{ #category : #printing }
TbElementChangeRecordWithContext >> printOn: aStream [
	super printOn: aStream.
	
	aStream
		nextPutAll: ' | (';
		nextPutAll: self context asString;
		nextPutAll: ')';
		nextPutAll: ' | (';
		nextPutAll: timestamp asString;
		nextPutAll: ')'
]
