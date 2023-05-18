Class {
	#name : #TbFlowLayout,
	#superclass : #TbLayout,
	#traits : 'TTbAlignable',
	#classTraits : 'TTbAlignable classTrait',
	#instVars : [
		'measurer',
		'orientation',
		'horizontalAlignment',
		'verticalAlignment'
	],
	#category : #'Turbo-Layout-Flow'
}

{ #category : #constraints }
TbFlowLayout class >> constraints [
	^ TbFlowLayoutConstraints new
]

{ #category : #factory }
TbFlowLayout class >> horizontal [
	^ self new
		horizontal;
		yourself
]

{ #category : #factory }
TbFlowLayout class >> vertical [
	^ self new
		vertical;
		yourself
]

{ #category : #accessing }
TbFlowLayout >> alignment [
	^ self horizontalAlignment + self verticalAlignment
]

{ #category : #initialization }
TbFlowLayout >> defaultHorizontalAlignment [
	"By default alignment should not influence on layout process,
	so to not deal with nils use null object"
	<return: #BlNullAlignment>
	
	^ TbElementAlignment start horizontal
]

{ #category : #initialization }
TbFlowLayout >> defaultOrientation [
	^ TbLayoutOrientation horizontal
]

{ #category : #initialization }
TbFlowLayout >> defaultVerticalAlignment [
	"By default alignment should not influence on layout process,
	so to not deal with nils use null object"
	<return: #BlNullAlignment>
	
	^ TbElementAlignment start vertical
]

{ #category : #accessing }
TbFlowLayout >> horizontal [
	orientation := TbLayoutOrientation horizontal.
	measurer beHorizontal
]

{ #category : #accessing }
TbFlowLayout >> horizontalAlignment [

	<ignoreForCoverage>
	^ horizontalAlignment
]

{ #category : #accessing }
TbFlowLayout >> horizontalAlignment: anAlignment [
	horizontalAlignment := anAlignment
]

{ #category : #initialization }
TbFlowLayout >> initialize [
	super initialize.
	
	verticalAlignment := self defaultVerticalAlignment.
	horizontalAlignment := self defaultHorizontalAlignment.
	measurer := TbFlowLayoutMeasurer for: self.
	self orientation: self defaultOrientation
]

{ #category : #layout }
TbFlowLayout >> layout: anElement in: newBounds [
	measurer layout: anElement in: newBounds.
	self layoutIgnored: anElement
]

{ #category : #measure }
TbFlowLayout >> measure: anElement with: anExtentSpec [
	measurer measure: anElement with: anExtentSpec.
	self measureIgnored: anElement with: anExtentSpec
]

{ #category : #accessing }
TbFlowLayout >> orientation [
	<ignoreForCoverage>
	^ orientation
]

{ #category : #accessing }
TbFlowLayout >> orientation: aLayoutOrientation [
	"Dispatches to self horizontal or vertical"
	aLayoutOrientation of: self
]

{ #category : #accessing }
TbFlowLayout >> vertical [
	orientation := TbLayoutOrientation vertical.
	measurer beVertical
]

{ #category : #accessing }
TbFlowLayout >> verticalAlignment [

	<ignoreForCoverage>
	^ verticalAlignment
]

{ #category : #accessing }
TbFlowLayout >> verticalAlignment: anAlignment [
	verticalAlignment := anAlignment
]
