Class {
	#name : 'TbMockTranslation',
	#superclass : 'Object',
	#instVars : [
		'offset'
	],
	#category : 'Turbo-Tests',
	#package : 'Turbo-Tests'
}

{ #category : 'instance creation' }
TbMockTranslation class >> by: aPoint [ 
    ^ self new offset: aPoint;
        yourself
]

{ #category : 'accessing' }
TbMockTranslation >> offset: aPoint [ 
    offset := aPoint
]

{ #category : 'accessing' }
TbMockTranslation >> transform: aPoint [
    ^ (aPoint + offset) rounded
]
