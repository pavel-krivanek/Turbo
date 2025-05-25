Class {
	#name : 'TbElementTest',
	#superclass : 'TestCase',
	#instVars : [
		'element'
	],
	#category : 'Turbo-Tests-Basic',
	#package : 'Turbo-Tests',
	#tag : 'Basic'
}

{ #category : 'system startup' }
TbElementTest >> setUp [ 
	
	super setUp.

	element := TbElement new.
]

{ #category : 'system startup' }
TbElementTest >> testAccessOpacity [ 
	
	element opacity: 0.5.
	self assert: element opacity equals: 0.5.

	element opacity: -1.
	self assert: element opacity equals: 0.0.

	element opacity: 2.
	self assert: element opacity equals: 1.0.
	
	element opacity: 0.0001.
	self assert: element opacity equals: 0.0. "Closeness to 0"
	
	element opacity: 0.9999.
	self assert: element opacity equals: 1.0. "Closeness to 1"
]

{ #category : 'system startup' }
TbElementTest >> testAddChild [
	self assert: (TbElement new addChild: (TbElement new size: 50@50; background: Color red lighter)) childrenCount equals: 1.
]

{ #category : 'system startup' }
TbElementTest >> testAddChildAs [
	| parent child |
	parent := TbElement new size: 100@100; background: Color veryVeryLightGray.
	child := TbElement new size: 50@50; background: Color red lighter.
	parent addChild: child as: #container.
	self assert: (child userData at: #blocContainer) equals: #container.
]

{ #category : 'system startup' }
TbElementTest >> testAddChildAt [
	| parent child |
	parent := TbElement new size: 100@100; background: Color veryVeryLightGray.
	child := TbElement new size: 50@50; background: Color red lighter.
	parent addChild: child at: 1.
	self assert: parent children first equals: child.
]

{ #category : 'system startup' }
TbElementTest >> testAddChildAtAs [
	| parent child |
	parent := TbElement new size: 100@100; background: Color veryVeryLightGray.
	child := TbElement new size: 50@50; background: Color red lighter.
	parent addChild: child at: 1 as: #container.
	self assert: (child userData at: #blocContainer) equals: #container.
]

{ #category : 'system startup' }
TbElementTest >> testAddChildFirst [
	| parent child |
	parent := TbElement new size: 100@100; background: Color veryVeryLightGray.
	child := TbElement new size: 50@50; background: Color red lighter.
	parent addChildFirst: child.
	self assert: parent children first equals: child.
]

{ #category : 'system startup' }
TbElementTest >> testAddChildIn [
	| parent child container |
	parent := TbElement new size: 100@100; background: Color veryVeryLightGray.
	container := TbElement new size: 50@50; background: Color blue lighter.
	child := TbElement new size: 25@25; background: Color red lighter.
	parent addChild: container as: #container.
	parent addChild: child in: #container.
	self assert: container children first equals: child.
]

{ #category : 'system startup' }
TbElementTest >> testAddChildInAs [
	| parent child container |
	parent := TbElement new size: 100@100; background: Color veryVeryLightGray.
	container := TbElement new size: 50@50; background: Color blue lighter.
	child := TbElement new size: 25@25; background: Color red lighter.
	parent addChild: container as: #container.
	parent addChild: child in: #container as: #childContainer.
	self assert: (child userData at: #blocContainer) equals: #childContainer.
]

{ #category : 'system startup' }
TbElementTest >> testAddChildren [
	| parent children |
	parent := TbElement new size: 100@100; background: Color veryVeryLightGray.
	children := { (TbElement new size: 50@50; background: Color red lighter).
	              (TbElement new size: 50@50; background: Color blue lighter) }.
	parent addChildren: children.
	self assert: parent childrenCount equals: 2.
]

{ #category : 'system startup' }
TbElementTest >> testAddChildrenIn [
	| parent children container |
	parent := TbElement new size: 100@100; background: Color veryVeryLightGray.
	container := TbElement new size: 50@50; background: Color blue lighter.
	children := { (TbElement new size: 25@25; background: Color red lighter).
	              (TbElement new size: 25@25; background: Color green lighter) }.
	parent addChild: container as: #container.
	parent addChildren: children in: #container.
	self assert: container childrenCount equals: 2.
]

{ #category : 'system startup' }
TbElementTest >> testAllChildrenBreadthFirstDo [ 
	| p c1 c11 c2 collected |
	p := TbElement new.
	c1 := TbElement new.
	c11 := TbElement new.
	c2 := TbElement new.
	p addChild: c1.
	c1 addChild: c11.
	p addChild: c2.
	
	collected := OrderedCollection new.
	p allChildrenBreadthFirstDo: [ :each | collected add: each ].
	self assertCollection: collected asArray equals: { c1. c2. c11 }
]

{ #category : 'system startup' }
TbElementTest >> testAsElement [
	| newElement |
	newElement := element asElement.
	self assert: newElement equals: element
]

{ #category : 'system startup' }
TbElementTest >> testAsScalableElement [ 

	| oldParent scalable | 
	oldParent := TbElement new.
	oldParent addChild: element.
	
	scalable := element asScalableElement.
	self deny: element parent equals: oldParent.
	self assert: element parent equals: scalable.
	self assert: scalable constraints horizontal resizer isMatchParent.
	self assert: scalable constraints vertical resizer isMatchParent.
	
	

]

{ #category : 'system startup' }
TbElementTest >> testBorder [ 

	self assert: element border paint equals: TbPaint transparent.
	self assert: element border width equals: 0.
]

{ #category : 'system startup' }
TbElementTest >> testChildrenAreEmpty [

	self assert: element children isEmpty
]

{ #category : 'system startup' }
TbElementTest >> testClipChildren [ 
	self assert: element clipChildren.
	element clipChildren: false. "no event activated"
	self deny: element clipChildren.

]

{ #category : 'system startup' }
TbElementTest >> testCopyShouldNotImplement [
	self should: [ element copy ] raise: ShouldNotImplement.
]

{ #category : 'system startup' }
TbElementTest >> testDeepCopyShouldNotImplement [
	self should: [ element deepCopy ] raise: ShouldNotImplement.
]

{ #category : 'system startup' }
TbElementTest >> testDefaultVisibility [ 

	self assert: element defaultVisibility equals: TbVisibility visible 
]

{ #category : 'system startup' }
TbElementTest >> testElevation [ 
	
	self assert: element elevation equals: TbRelativeElevation zero.

	element zIndex: 1.
	
 	self assert: element elevation elevation equals: 1.
]

{ #category : 'system startup' }
TbElementTest >> testEmptyBorder [

	self assert: element border width equals: 0
]

{ #category : 'system startup' }
TbElementTest >> testEmptyBounds [ 

	self assert: element bounds position equals: 0@0	.
	self assert: element bounds extent equals: 0@0
]

{ #category : 'system startup' }
TbElementTest >> testEmptyMeasuredBounds [

	self assert: element measuredBounds position equals: 0@0.
	self assert: element measuredBounds extent equals: 0@0
]

{ #category : 'system startup' }
TbElementTest >> testHasParent [
	| p c1 c11 c2 |
	p := TbElement new.
	c1 := TbElement new.
	c11 := TbElement new.
	c2 := TbElement new.
	p addChild: c1.
	c1 addChild: c11.
	p addChild: c2.
	
	self deny: p hasOwner.
	self assert: c1 hasOwner.
	self assert: c2 hasOwner.
	self assert: c11 hasOwner.
	
]

{ #category : 'system startup' }
TbElementTest >> testInitializeDefaults [ 
	self assert: element background notNil.
	self assert: element background isTransparent. "Default is TbBackground transparent"
	self assert: element border notNil.
	self assert: element border width equals: 0. "Default is TbBorder empty"
	self assert: element opacity equals: 1.0.
	self assert: element geometry class equals: TbRectangleGeometry.
	self assert: element layout class equals: TbBasicLayout.
	self assert: element elevation equals: TbRelativeElevation zero.
	self assert: element visibility equals: TbVisibility visible.
	self assert: element constraints notNil.
	self assert: element children isEmpty.
	self assert: element transformation notNil.
	self assert: element eventDispatcher notNil.
	self assert: element shouldHandleMouseEvents.
	self assert: element shouldChildrenHandleMouseEvents.
	self assert: element taskQueue tasks isEmpty.
	self assert: element errorHandler notNil.
	self assert: element bounds extent equals: (0@0). "Default size"
	self assert: element position equals: (0@0).

]

{ #category : 'system startup' }
TbElementTest >> testIsAttachedToSceneGraph [ 

	| space |
	space := TbSpace new.
	self deny: element isAttachedToSceneGraph.
	element space: space.
	self assert: element isAttachedToSceneGraph.
	
	element onRemovedFromSceneGraph. "Simulates removal effect"
	self deny: element isAttachedToSceneGraph.
]

{ #category : 'system startup' }
TbElementTest >> testIsOpaque [

	element opacity: 0.
	self deny: element isOpaque.
	
	element opacity: 0.5.
	self deny: element isOpaque.

	element opacity: 1.
	self assert: element isOpaque.

	element opacity: 2.
	self deny: element isTranslucent.

]

{ #category : 'system startup' }
TbElementTest >> testIsRoot [

	| space child |
	child := TbElement new.
	element addChild: child.
	space := TbSpace new.
	self deny: element isRoot.

	space root: element.

	self assert: element isRoot.
	self deny: child isRoot
]

{ #category : 'system startup' }
TbElementTest >> testIsTranslucent [

	element opacity: 0.
	self deny: element isTranslucent.
	
	element opacity: 0.5.
	self assert: element isTranslucent.

	element opacity: 1.
	self deny: element isTranslucent.

	element opacity: 2.
	self deny: element isTranslucent.

]

{ #category : 'system startup' }
TbElementTest >> testLabeledAndGtDisplay [
	| str |
	element labeled: 'MyLabel'.
	
	str := String streamContents: [ :stream |
		element gtDisplayOn: stream. ].
	self assert: str equals: 'MyLabel'.
]

{ #category : 'system startup' }
TbElementTest >> testOwnerIsNil [

	self assert: element owner isNil
]

{ #category : 'system startup' }
TbElementTest >> testParentIsNIl [

	self assert: element parent isNil
]

{ #category : 'system startup' }
TbElementTest >> testPositionExtentDefaults [
    self assert: element position equals: 0@0.
    self assert: element extent equals: 0@0.
]

{ #category : 'system startup' }
TbElementTest >> testRemoveChild [
	| parent child |
	parent := TbElement new size: 100@100; background: Color veryVeryLightGray.
	child := TbElement new size: 50@50; background: Color red lighter.
	parent addChild: child.
	parent removeChild: child.
	self assert: parent childrenCount equals: 0.
]

{ #category : 'system startup' }
TbElementTest >> testRemoveChildAt [
	| parent child |
	parent := TbElement new size: 100@100; background: Color veryVeryLightGray.
	child := TbElement new size: 50@50; background: Color red lighter.
	parent addChild: child.
	parent removeChildAt: 1.
	self assert: parent childrenCount equals: 0.
]

{ #category : 'system startup' }
TbElementTest >> testRemoveChildNamed [
	| parent child container |
	parent := TbElement new size: 100@100; background: Color veryVeryLightGray.
	container := TbElement new size: 50@50; background: Color blue lighter.
	child := TbElement new size: 25@25; background: Color red lighter.
	parent addChild: container as: #container.
	parent addChild: child in: #container.
	parent removeChildNamed: #container.
	self assert: parent childrenCount equals: 0.
]

{ #category : 'system startup' }
TbElementTest >> testRemoveChildren [
	| parent children |
	parent := TbElement new size: 100@100; background: Color veryVeryLightGray.
	children := { (TbElement new size: 50@50; background: Color red lighter).
	              (TbElement new size: 50@50; background: Color blue lighter) }.
	parent addChildren: children.
	parent removeChildren.
	self assert: parent childrenCount equals: 0.
]

{ #category : 'system startup' }
TbElementTest >> testRemoveChildrenIn [
	| parent children container |
	parent := TbElement new size: 100@100; background: Color veryVeryLightGray.
	container := TbElement new size: 50@50; background: Color blue lighter.
	children := { (TbElement new size: 25@25; background: Color red lighter).
	              (TbElement new size: 25@25; background: Color green lighter) }.
	parent addChild: container as: #container.
	parent addChildren: children in: #container.
	parent removeChildrenIn: #container.
	self assert: container childrenCount equals: 0.
]

{ #category : 'system startup' }
TbElementTest >> testReplaceChild [
	| parent child newChild |
	parent := TbElement new size: 100@100; background: Color veryVeryLightGray.
	child := TbElement new size: 50@50; background: Color red lighter.
	newChild := TbElement new size: 50@50; background: Color blue lighter.
	parent addChild: child.
	parent replaceChild: child with: newChild.
	self assert: parent children first equals: newChild.
]

{ #category : 'system startup' }
TbElementTest >> testReplaceChildAs [
	| parent child newChild |
	parent := TbElement new size: 100@100; background: Color veryVeryLightGray.
	child := TbElement new size: 50@50; background: Color red lighter.
	newChild := TbElement new size: 50@50; background: Color blue lighter.
	parent addChild: child.
	parent replaceChild: child with: newChild as: #newContainer.
	self assert: (newChild userData at: #blocContainer) equals: #newContainer.
]

{ #category : 'system startup' }
TbElementTest >> testRequestFocusWhenAttached [ 

	| space eventFired |
	eventFired := false.
	space := TbSpace new.
	"element space: space."
	space root: element.
	element when: TbFocusInEvent do: [ :evt | eventFired := true ].
	element requestFocus.
	self assert: eventFired
]

{ #category : 'system startup' }
TbElementTest >> testRequestFocusWhenNotAttached [

	| eventFired |
	eventFired := false.
	self deny: element isFocused.
	element when: TbFocusInEvent do: [ :evt | eventFired := true. ].
	element requestFocus.
	self assert: element isFocused. 
	
	self deny: eventFired  "when an element is not attached to a space, the focue event is not fired"
]

{ #category : 'system startup' }
TbElementTest >> testSetBorder [ 

	| firedEvent |
	
	firedEvent := nil.

	element when: TbElementBorderChangedEvent do: [ :evt | firedEvent := evt ].

	element border: (TbBorder paint: (TbColorPaint color: Color red) width: 1).	
	self assert: (firedEvent isKindOf: TbElementBorderChangedEvent).	
	self assert: element border paint color equals: Color red.
	self assert: element border width equals: 1.
]

{ #category : 'system startup' }
TbElementTest >> testSize [ 
    element size: 100@200.
    self assert: element constraints horizontal resizer isExact.
    self assert: element constraints horizontal resizer size equals: 100.
    self assert: element constraints vertical resizer isExact.
    self assert: element constraints vertical resizer size equals: 200.
]

{ #category : 'system startup' }
TbElementTest >> testTransformationOwner [ 

	self assert: element transformation owner equals: element
]

{ #category : 'system startup' }
TbElementTest >> testUserData [
	self assert: element userData isEmpty.
	element userData at: #foo put: #bar.
	self assert: (element userData at: #foo) equals: #bar.
]

{ #category : 'system startup' }
TbElementTest >> testVisibilityChange [

	| storedArgument |

	self assert: element isVisible.
	
	element visibilityProperty onChangedDo: [ :newValue |
		storedArgument := newValue  ].
	
	element visibility: TbVisibility hidden.
	self assert: storedArgument isHidden.
	self deny: element isVisible.
	
]
