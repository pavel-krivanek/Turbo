Trait {
	#name : 'TTbScrollable',
	#category : 'Turbo-Core-Utilities - Scrolling',
	#package : 'Turbo-Core',
	#tag : 'Utilities - Scrolling'
}

{ #category : 'api - scrolling overscroll' }
TTbScrollable >> absorbGlows: aVelocityPoint [
]

{ #category : 'api - scrolling overscroll' }
TTbScrollable >> awakenScrollBars [
	"Trigger the scrollbars to draw. When invoked this method starts an animation to fade the scrollbars out after a default delay.
	If scrolling is animated, the start delay should equal the duration of the scrolling animation
	Return true if the animation is played, false otherwise"
	<return: #Boolean>

	^ false
]

{ #category : 'api - scrolling testing' }
TTbScrollable >> canScrollHorizontally [
	"Return true if I can scroll the current contents horizontally, false otherwise"
	<return: #Boolean>

	^ true
]

{ #category : 'api - scrolling testing' }
TTbScrollable >> canScrollVertically [
	"Return true if I can scroll the current contents vertically, false otherwise"
	<return: #Boolean>

	^ true
]

{ #category : 'api - scrolling overscroll' }
TTbScrollable >> considerReleasingGlowsOnScroll: aDeltaPoint [
]

{ #category : 'api - scrolling notifying' }
TTbScrollable >> dispatchOnScrolled: aPoint [
	
	self onScrolled: aPoint.
	self notifyScrolled: aPoint
]

{ #category : 'api - scrolling notifying' }
TTbScrollable >> notifyScrolled: aPoint [
	"Notify all event handlers that InfiniteElemnet scrolled by a delta point"

	self fireEvent: (TbElementScrolledEvent delta: aPoint)
]

{ #category : 'hooks - scrolling' }
TTbScrollable >> onScrolled: aPoint [
	"Sent when the scroll position of this InfiniteElement changes. Subclasses should use
	this method to respond to scrolling within the datasource's data set instead of an explicit event handler.
	I will always be invoked before event handlers. If a subclass needs to perform any additional upkeep
	or bookkeeping after scrolling but before events fired, this is a good place to do so"
]

{ #category : 'api - scrolling accessing' }
TTbScrollable >> overScrollMode [
	^ TbOverScrollMode never
]

{ #category : 'api - scrolling accessing' }
TTbScrollable >> overScrollMode: aBlOverScrollMode [
	self explicitRequirement
]

{ #category : 'api - scrolling accessing' }
TTbScrollable >> scrollFlinger [
	<return: #BlScrollFlinger>

	^ self explicitRequirement
]

{ #category : 'api - scrolling' }
TTbScrollable >> scrollHorizontallyBy: aNumber [
	"Scroll horizontally by aNumber and return the distance traveled.
	The default implementation does nothing and returns 0."
	<return: #Number>

	^ 0
]

{ #category : 'api - scrolling geometry' }
TTbScrollable >> scrollMaximum [
	<return: #Point>
	
	^ Float infinity @ Float infinity
]

{ #category : 'api - scrolling geometry' }
TTbScrollable >> scrollMinimum [
	<return: #Point>
	
	^ Float negativeInfinity @ Float negativeInfinity
]

{ #category : 'api - scrolling geometry' }
TTbScrollable >> scrollOvershot [
	<return: #Point>
	
	^ 0@0
]

{ #category : 'api - scrolling geometry' }
TTbScrollable >> scrollPosition [
	<return: #Point>
	
	^ self explicitRequirement
]

{ #category : 'private - scrolling accessing' }
TTbScrollable >> scrollState [
	"Return the current scrolling state"
	<return: #Symbol>
	
	^ self explicitRequirement
]

{ #category : 'private - scrolling accessing' }
TTbScrollable >> scrollState: aScrollState [
	"Internal! Never set me directly"
	
	self explicitRequirement
]

{ #category : 'api - scrolling' }
TTbScrollable >> scrollVerticallyBy: aNumber [
	"Scroll vertically by aNumber and return the distance traveled.
	The default implementation does nothing and returns 0."
	<return: #Number>

	^ 0
]

{ #category : 'api - scrolling accessing' }
TTbScrollable >> smoothScroller [
	"Return currently used smooth scroller or nil if I am not in a smooth scrolling state"
	<return: #BlSmoothScroller or: nil>

	^ nil
]
