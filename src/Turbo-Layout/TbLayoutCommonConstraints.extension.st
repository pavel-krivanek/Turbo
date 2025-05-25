Extension { #name : 'TbLayoutCommonConstraints' }

{ #category : '*Turbo-Layout' }
TbLayoutCommonConstraints >> flow [
	^ self at: TbFlowLayout
]

{ #category : '*Turbo-Layout' }
TbLayoutCommonConstraints >> frame [
	^ self at: TbFrameLayout
]

{ #category : '*Turbo-Layout' }
TbLayoutCommonConstraints >> grid [
	^ self at: TbGridLayout
]

{ #category : '*Turbo-Layout' }
TbLayoutCommonConstraints >> linear [
	^ self at:TbLinearLayout
]
