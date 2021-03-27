Extension { #name : #TbLayoutCommonConstraints }

{ #category : #'*Turbo-Layout' }
TbLayoutCommonConstraints >> flow [
	^ self at: BlFlowLayout
]

{ #category : #'*Turbo-Layout' }
TbLayoutCommonConstraints >> frame [
	^ self at: BlFrameLayout
]

{ #category : #'*Turbo-Layout' }
TbLayoutCommonConstraints >> grid [
	^ self at: BlGridLayout
]

{ #category : #'*Turbo-Layout' }
TbLayoutCommonConstraints >> linear [
	^ self at: BlLinearLayout
]
