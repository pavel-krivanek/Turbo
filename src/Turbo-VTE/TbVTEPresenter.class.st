Class {
	#name : #TbVTEPresenter,
	#superclass : #VteTerminalPresenter,
	#category : #'Turbo-VTE'
}

{ #category : #initialization }
TbVTEPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'TUrbo';
		initialExtent: 800@600
]
