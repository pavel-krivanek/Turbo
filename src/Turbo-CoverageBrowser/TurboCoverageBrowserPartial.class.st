Class {
	#name : #TurboCoverageBrowserPartial,
	#superclass : #CoverageBrowser,
	#category : #'Turbo-CoverageBrowser'
}

{ #category : #'instance creation' }
TurboCoverageBrowserPartial class >> open [ 

	<script>
	self new open
]

{ #category : #accessing }
TurboCoverageBrowserPartial >> classes [

	^ { TbFlowLayoutTest }
]

{ #category : #accessing }
TurboCoverageBrowserPartial >> methods [ 

 	 ^ TbFlowLayout methods, TbFlowLayout class methods
]

{ #category : #accessing }
TurboCoverageBrowserPartial >> suite [ 

	| suite |
	
	suite := TestSuite named: self class name.
	suite addTests: (self classes flatCollect: [:aTestClass | aTestClass suite tests]).
	
	^ suite

]
