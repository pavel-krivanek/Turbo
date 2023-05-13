Class {
	#name : #TurboCoverageBrowser,
	#superclass : #CoverageBrowser,
	#category : #'Turbo-CoverageBrowser'
}

{ #category : #'instance creation' }
TurboCoverageBrowser class >> open [ 

	<script>
	self new open
]

{ #category : #accessing }
TurboCoverageBrowser >> methods [ 

 	 ^ 'Turbo-Core' asPackage methods.
]

{ #category : #accessing }
TurboCoverageBrowser >> suite [ 

	^ 'Turbo-Tests' asPackage testSuite
]
