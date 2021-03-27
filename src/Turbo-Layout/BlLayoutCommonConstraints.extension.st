Extension { #name : #BlLayoutCommonConstraints }

{ #category : #'*Turbo-Layout' }
BlLayoutCommonConstraints >> flow [
	^ self at: BlFlowLayout
]

{ #category : #'*Turbo-Layout' }
BlLayoutCommonConstraints >> frame [
	^ self at: BlFrameLayout
]

{ #category : #'*Turbo-Layout' }
BlLayoutCommonConstraints >> grid [
	^ self at: BlGridLayout
]

{ #category : #'*Turbo-Layout' }
BlLayoutCommonConstraints >> linear [
	^ self at: BlLinearLayout
]
