Class {
	#name : 'TbGridLayoutConstants',
	#superclass : 'SharedPool',
	#classVars : [
		'UNDEFINED'
	],
	#category : 'Turbo-Layout-Grid-Utilities',
	#package : 'Turbo-Layout',
	#tag : 'Grid-Utilities'
}

{ #category : 'class initialization' }
TbGridLayoutConstants class >> initialize [
	super initialize.
	
	UNDEFINED := ((-2147483648) / 2 + 1) rounded
]
