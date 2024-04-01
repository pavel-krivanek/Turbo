Class {
	#name : #TbEventHandlerAnnouncementDeliveryCondition,
	#superclass : #Object,
	#instVars : [
		'eventHandler'
	],
	#category : #'Turbo-Core-Events-Handling'
}

{ #category : #accessing }
TbEventHandlerAnnouncementDeliveryCondition >> eventHandler [
	^ eventHandler
]

{ #category : #accessing }
TbEventHandlerAnnouncementDeliveryCondition >> eventHandler: anObject [
	eventHandler := anObject
]

{ #category : #testing }
TbEventHandlerAnnouncementDeliveryCondition >> handlesAnnouncement: anEvent [
	^ self eventHandler wantsEvent: anEvent
]
