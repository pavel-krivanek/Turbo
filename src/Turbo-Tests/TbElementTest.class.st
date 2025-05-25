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
TbElementTest >> testAddAnimation [
	| animation |
	element := TbElement new.
	animation := TbAnimation new.
	element addAnimation: animation.
	self assert: (element taskQueue tasks includes: animation).
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
TbElementTest >> testAllChildrenBreadthFirstDetectIfFound [
	| child1 child2 child3 child4 |
	element := TbElement new.
	child1 := TbElement new.
	child2 := TbElement new.
	child3 := TbElement new.
	child4 := TbElement new.
	element addChild: child1.
	element addChild: child2.
	child1 addChild: child3.
	child1 addChild: child4.

	self assert: (element allChildrenBreadthFirstDetect: [ :each | each == child3 ] ifFound: [ :found | found ]) equals: child3.
	self assert: (element allChildrenBreadthFirstDetect: [ :each | each == child4 ] ifFound: [ :found | found ]) equals: child4.
	self assert: (element allChildrenBreadthFirstDetect: [ :each | each == child2 ] ifFound: [ :found | found ]) equals: child2.
	self assert: (element allChildrenBreadthFirstDetect: [ :each | each == child1 ] ifFound: [ :found | found ]) equals: child1.
	self assert: (element allChildrenBreadthFirstDetect: [ :each | each == element ] ifFound: [ :found | #found ]) equals: nil.
	self assert: (element allChildrenBreadthFirstDetect: [ :each | each == (TbElement new) ] ifFound: [ :found | found ]) isNil.
]

{ #category : 'system startup' }
TbElementTest >> testAllChildrenBreadthFirstDetectIfFoundIfNone [
	| child1 child2 child3 |
	child1 := TbElement new.
	child2 := TbElement new.
	child3 := TbElement new.
	element addChild: child1.
	element addChild: child2.
	child1 addChild: child3.

	self assert: (element allChildrenBreadthFirstDetect: [ :each | each == child3 ] ifFound: [ :found | found ] ifNone: [ nil ]) equals: child3.
	self assert: (element allChildrenBreadthFirstDetect: [ :each | each == child2 ] ifFound: [ :found | found ] ifNone: [ nil ]) equals: child2.
	self assert: (element allChildrenBreadthFirstDetect: [ :each | each == child1 ] ifFound: [ :found | found ] ifNone: [ nil ]) equals: child1.
	self assert: (element allChildrenBreadthFirstDetect: [ :each | each == element ] ifFound: [ :found | #found ] ifNone: [ #notFound ]) equals: #notFound.
	self assert: (element allChildrenBreadthFirstDetect: [ :each | each == (TbElement new) ] ifFound: [ :found | found ] ifNone: [ nil ]) isNil.
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
TbElementTest >> testAllParentsDetectIfFoundIfNone [
	| parent1 parent2 parent3 |
	
	parent1 := TbElement new.
	parent2 := TbElement new.
	parent3 := TbElement new.

	parent1 addChild: parent2.
	parent2 addChild: parent3.
	parent3 addChild: element.

	self assert: (element allParentsDetect: [ :each | each == parent2 ] ifFound: [ :found | found ] ifNone: [ nil ]) equals: parent2.
	self assert: (element allParentsDetect: [ :each | each == parent1 ] ifFound: [ :found | found ] ifNone: [ nil ]) equals: parent1.
	self assert: (element allParentsDetect: [ :each | each == parent3 ] ifFound: [ :found | found ] ifNone: [ nil ]) equals: parent3.
	self assert: (element allParentsDetect: [ :each | each == element ] ifFound: [ :found | #found ] ifNone: [ #notFound ]) equals: #notFound.
	self assert: (element allParentsDetect: [ :each | each == (TbElement new) ] ifFound: [ :found | found ] ifNone: [ nil ]) equals: nil.
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
TbElementTest >> testAttachChildAt [
	| parent child |
	parent := TbElement new.
	child := TbElement new.
	parent attachChild: child at: 1.
	self assert: (parent children asArray includes: child).
	self assert: child parent equals: parent.
	self assert: (parent children indexOf: child) equals: 1.
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
TbElementTest >> testDequeueTask [
	| task |
	task := TbTask new.
	element enqueueTask: task.
	self deny: element taskQueue tasks isEmpty.
	element dequeueTask: task.
	self assert: element taskQueue tasks isEmpty.
]

{ #category : 'system startup' }
TbElementTest >> testDispatchRemovedFromSceneGraph [
	| parent |
	parent := TbElement new.
	parent addChild: element.
	element removeFromParent.
	self assert: element parent equals: nil.
	self assert: element isAttachedToSceneGraph equals: false.
]

{ #category : 'system startup' }
TbElementTest >> testEffect [
	| effect |
	effect := TbClipOutEffect new.
	element effect: effect.
	self assert: element effect equals: effect.
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
TbElementTest >> testEnqueueTask [
	| task |
	task := TbTask new.
	element enqueueTask: task.
	self assert: (element taskQueue tasks includes: task).
]

{ #category : 'system startup' }
TbElementTest >> testGeometryResizer [
	| geometryResizer |
	element geometryResizer: (geometryResizer := TbGeometryResizer match).
	self assert: element geometryResizer equals: geometryResizer.
]

{ #category : 'system startup' }
TbElementTest >> testHasChild [
	| child | 
	child := TbElement new.
	element addChild: child.
	self assert: (element hasChild: child).
	element removeChild: element children first.
	self deny: (element hasChild: child).
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
TbElementTest >> testLocalPointToParent [
	| parent child pointInChild originInParent |
	parent := TbElement new.
	child := TbElement new.
	parent addChild: child.
	pointInChild := 10@10.
	originInParent := 20@20.
	child position: originInParent extent: 20@10.
	self assert: (child localPointToParent: pointInChild) equals: (originInParent + pointInChild)
]

{ #category : 'system startup' }
TbElementTest >> testOutskirts [
	| outskirts space |
	
	space := TbSpace new.
	space root: element.
	
	outskirts := TbOutskirts outside.
	element outskirts: outskirts.
	self assert: element outskirts equals: outskirts.
	

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
TbElementTest >> testPrintOn [
	
	self assert: (element printString includesSubstring: 'TbElement') description: 'The printString should include the class name'.
	self assert: (element printString includesSubstring: ' @ ') description: 'The printString should include the identity hash'.
	self assert: (element printString includesSubstring: element identityHash asString) description: 'The printString should include the identity hash'.
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
TbElementTest >> testShouldChildrenHandleMouseEvents [

	self assert: element shouldChildrenHandleMouseEvents.
	self assert: element shouldHandleMouseEvents.

	element preventMeAndChildrenMouseEvents.
	
	self deny: element shouldChildrenHandleMouseEvents.
	self deny: element shouldHandleMouseEvents.
	
	element allowMouseEvents.
	element allowChildrenMouseEvents.
	
	self assert: element shouldChildrenHandleMouseEvents.
	self assert: element shouldHandleMouseEvents.
	
	element preventMouseEvents.
	element preventChildrenMouseEvents.
	
	self deny: element shouldChildrenHandleMouseEvents.
	self deny: element shouldHandleMouseEvents.

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

{ #category : 'system startup' }
TbElementTest >> testWithAllChildrenBreadthFirst [
	| child1 child2 child3 child4 |
	element := TbElement new.
	child1 := TbElement new.
	child2 := TbElement new.
	child3 := TbElement new.
	child4 := TbElement new.
	element addChild: child1.
	element addChild: child2.
	child1 addChild: child3.
	child1 addChild: child4.

	self assertCollection: (element withAllChildrenBreadthFirst) asArray equals: {element. child1. child2. child3. child4}.
]

{ #category : 'system startup' }
TbElementTest >> testWithAllParents [
	| parent grandParent greatGrandParent result sideParent |
	parent := TbElement new.
	grandParent := TbElement new.
	greatGrandParent := TbElement new.
	sideParent := TbElement new.
	
	element addChild: parent.
	element addChild: sideParent.
	parent addChild: grandParent.
	grandParent addChild: greatGrandParent.

	result := greatGrandParent withAllParents.

	self assert: (result includes: parent).
	self assert: (result includes: grandParent).
	self assert: (result includes: greatGrandParent).
	self assert: (result includes: element).
	self assert: result size equals: 4.
]
