Class {
	#name : 'TbFlowLayoutMeasurer',
	#superclass : 'Object',
	#instVars : [
		'layout',
		'children',
		'lines',
		'orientation',
		'maxWidth',
		'maxHeight',
		'widthMode',
		'heightMode',
		'checkCanFit'
	],
	#category : 'Turbo-Layout-Flow-Utilities',
	#package : 'Turbo-Layout',
	#tag : 'Flow-Utilities'
}

{ #category : 'instance creation' }
TbFlowLayoutMeasurer class >> for: aLayout [
	^ self new
		layout: aLayout;
		yourself
]

{ #category : 'calculating' }
TbFlowLayoutMeasurer >> alignLine: aLine [
	| totalWeight lastChild excessLength excessOffset |
	aLine isEmpty
		ifTrue: [ ^ self ].

	totalWeight := aLine children
		inject: 0
		into: [ :aTotalWeight :aChild | aTotalWeight + aChild weight ].

	lastChild := aLine children last.
	excessLength := aLine length - (lastChild length + lastChild spacingLength + lastChild startLength).
	excessOffset := 0.

	aLine children do: [ :aChild |
		| extraLength childLength childBreadth allowedBounds origin alignment |
		extraLength := totalWeight isZero
			ifTrue: [ excessLength / aLine children size ]
			ifFalse: [ excessLength * aChild weight / totalWeight ].
		childLength := aChild length + aChild spacingLength.
		childBreadth := aChild breadth + aChild spacingBreadth.
	
		alignment := aChild alignment.
		alignment := alignment directed: self direction.
		alignment := self orientation isHorizontal
			ifTrue: [ alignment ]
			ifFalse: [ alignment inverted ].

		allowedBounds := 0 @ excessOffset extent: (childLength + extraLength) @ aLine breadth.
		origin := alignment translationOf: (0 @ excessOffset extent: childLength @ childBreadth) in: allowedBounds.
		excessOffset := excessOffset + extraLength.
		
		aChild startLength: origin x + aChild startLength.
		aChild startBreadth: origin y ]
]

{ #category : 'calculating' }
TbFlowLayoutMeasurer >> alignLines: theLines within: anExtent [
	| lastLine excessBreadth excessOffset |
	theLines
		ifEmpty: [ ^ self ].

	lastLine := theLines last.
	excessBreadth := (anExtent y - (lastLine breadth + lastLine startBreadth)) max: 0.
	excessOffset := 0.
	
	theLines do: [ :aLine |
		| extraBreadth lineLength lineBreadth allowedBounds origin alignment |
		extraBreadth := excessBreadth / theLines size.
		lineLength := aLine length.
		lineBreadth := aLine breadth.
		
		alignment := layout alignment.
		alignment := self orientation isHorizontal
			ifTrue: [ alignment ]
			ifFalse: [ 
				self direction isLeftToRight 
					ifTrue: [ alignment inverted ]
					ifFalse: [ alignment swap ] ].
		alignment := alignment directed: self direction.
	
		allowedBounds := 0 @ excessOffset extent: anExtent x @ (lineBreadth + extraBreadth).
		origin := alignment translationOf: (0 @ excessOffset extent: lineLength @ lineBreadth) in: allowedBounds.
		
		excessOffset := excessOffset + extraBreadth.
		aLine startLength: aLine startLength + origin x.
		aLine startBreadth: aLine startBreadth + origin y.
		
		self alignLine: aLine ]
]

{ #category : 'accessing' }
TbFlowLayoutMeasurer >> beHorizontal [
	orientation := TbFlowLayoutHorizontal new
]

{ #category : 'accessing' }
TbFlowLayoutMeasurer >> beVertical [
	orientation := TbFlowLayoutVertical new
]

{ #category : 'accessing' }
TbFlowLayoutMeasurer >> breadthMode [
	^ self orientation breadthModeOf: self
]

{ #category : 'calculating' }
TbFlowLayoutMeasurer >> calculatePositions: theLines [
	
	"theLines inject: 0 into: [ :totalBreadth :aLine |
		aLine startBreadth: totalBreadth.
		aLine children inject: 0 into: [ :totalLength :aChild |
			aChild startLength: totalLength.
			totalLength + aChild length + aChild spacingLength ].
		totalBreadth + aLine breadth ]"
]

{ #category : 'accessing' }
TbFlowLayoutMeasurer >> direction [
	^ layout direction
]

{ #category : 'calculating' }
TbFlowLayoutMeasurer >> fillLines: theLines with: theChildren [
	| currentLine floatingQueue lineLength availableSpace totalBreadth currentSpaceIndex currentSpace |
	self flag: 'This is something horrible!!!!'.
	self flag: 'REFACTOR ME!!!'.
	self flag: 'p.s. but first cover with unit tests :)'.
	
	currentLine := TbFlowLayoutLine for: self.
	theLines add: currentLine.

	floatingQueue := SortedCollection sortBlock: [ :a :b | a startLength < b startLength ].
	lineLength := 0.
	totalBreadth := 0.
	availableSpace := TbFlowLayoutLineSpace new initializeFor: floatingQueue maxLength: self maxLength.
	currentSpaceIndex := 1.
	currentSpace := availableSpace intervals at: currentSpaceIndex.

	theChildren do: [ :aChild |
		| newLine |
		[ (lineLength + aChild totalLength > currentSpace last)
			and: [ currentSpaceIndex <= availableSpace intervals size ] ]
			whileTrue: [
				currentSpaceIndex := currentSpaceIndex + 1.
				(currentSpaceIndex <= availableSpace intervals size)
					ifTrue: [
						currentSpace := availableSpace intervals at: currentSpaceIndex.
						lineLength := currentSpace first.
						currentLine length: lineLength ] ].
		
		newLine := aChild isNewLine or: [ self isCheckCanFit and: [ (currentLine canFit: aChild) not ] ].
		"we create and add new line to the list making it current one"
		newLine ifTrue: [ 
			| previousLine |
			previousLine := currentLine.
			(previousLine children allSatisfy: [ :aLineChild | aLineChild isFloating ])
				ifTrue: [
					previousLine breadth: (previousLine children inject: 0 into: [ :aTotalBreadth :aFloatingChild |
						aTotalBreadth max: aFloatingChild totalBreadth ]) ].
			totalBreadth := totalBreadth + previousLine breadth.
			"remove obsolete floating elements here"
			floatingQueue := floatingQueue select: [ :aFloatingChild |
				aFloatingChild excessBreadth > 0 ].
			availableSpace := TbFlowLayoutLineSpace new initializeFor: floatingQueue maxLength: self maxLength.
			currentSpaceIndex := 1.
			currentSpace := availableSpace intervals at: currentSpaceIndex.
			currentLine := TbFlowLayoutLine for: self.
			currentLine addTo: theLines.
			floatingQueue do: [ :aFloatingChild | aFloatingChild addToLine: currentLine ].
			currentLine startBreadth: totalBreadth.
			
			lineLength := 0.
			[ ((lineLength < currentSpace first) or: [ lineLength + aChild totalLength > currentSpace last ])
				and: [ currentSpaceIndex <= availableSpace intervals size ] ]
			whileTrue: [
				(currentSpaceIndex <= availableSpace intervals size)
					ifTrue: [
						currentSpace := availableSpace intervals at: currentSpaceIndex.
						lineLength := currentSpace first.
						currentLine length: lineLength ].
				currentSpaceIndex := currentSpaceIndex + 1 ].
			currentSpaceIndex > 1 ifTrue: [ currentSpaceIndex := currentSpaceIndex - 1 ].
			].

		aChild addToLine: currentLine.
		aChild startLength: lineLength.
		lineLength := lineLength + aChild length + aChild spacingLength.

		aChild isFloating
			ifTrue: [ floatingQueue add: aChild ] ]
]

{ #category : 'accessing' }
TbFlowLayoutMeasurer >> heightMode [
	^ heightMode
]

{ #category : 'initialization' }
TbFlowLayoutMeasurer >> initialize [
	super initialize.
	
	children := OrderedCollection new.
	lines := OrderedCollection new
]

{ #category : 'testing' }
TbFlowLayoutMeasurer >> isCheckCanFit [
	^ checkCanFit
]

{ #category : 'accessing' }
TbFlowLayoutMeasurer >> layout: aLayout [
	layout := aLayout
]

{ #category : 'layout' }
TbFlowLayoutMeasurer >> layout: anElement in: newBounds [
	lines do: [ :aLine |
		aLine children do: [ :aChild |
			| constraints left top width height |
			constraints := aChild element constraints.
			left := anElement padding left + aLine lineX + aChild inlineX + constraints margin left.
			top := anElement padding top + aLine lineY + aChild inlineY + constraints margin top.
			width := aChild width.
			height := aChild height.
			aChild element applyLayoutIn: (left @ top extent: width @ height) ] ]
]

{ #category : 'accessing' }
TbFlowLayoutMeasurer >> lengthMode [
	^ self orientation lengthModeOf: self
]

{ #category : 'accessing' }
TbFlowLayoutMeasurer >> maxBreadth [
	^ self orientation maxBreadthOf: self
]

{ #category : 'accessing' }
TbFlowLayoutMeasurer >> maxHeight [
	^ maxHeight
]

{ #category : 'accessing' }
TbFlowLayoutMeasurer >> maxLength [
	^ self orientation maxLengthOf: self
]

{ #category : 'accessing' }
TbFlowLayoutMeasurer >> maxWidth [
	^ maxWidth
]

{ #category : 'measure' }
TbFlowLayoutMeasurer >> measure: anElement with: anExtentSpec [
	| lastLine contentLength contentBreadth parentLength parentBreadth totalContentWidth totalContentHeight |
	
	children removeAll.
	lines removeAll.
	
	anElement children accountedByLayout do: [ :aChildElement |
		| child childConstraints childType |
		childConstraints := aChildElement constraints flow.
		layout measureChildWithMargins: aChildElement parentSpec: anExtentSpec.

		childType := childConstraints display isFloating
			ifTrue: [ TbFlowLayoutFloatingChild ]
			ifFalse: [ TbFlowLayoutInlineChild ].

		child := childType measurer: self element: aChildElement.
		child width: aChildElement measuredWidth.
		child height: aChildElement measuredHeight.
		child newLine: childConstraints isNewLine.
		child alignment: childConstraints alignment.
		child weight: childConstraints weight.
		child display: childConstraints display.
		child margin: aChildElement constraints margin.
		children add: child ].

	widthMode := anExtentSpec widthSpec.
	heightMode := anExtentSpec heightSpec.

	maxWidth := (widthMode size ifNil: [ Float infinity ]) - anElement padding width.
	maxHeight := (heightMode size ifNil: [ Float infinity ]) - anElement padding height.
	
	checkCanFit := self lengthMode isUnspecified not.
	
	self fillLines: lines with: children.
	self calculatePositions: lines.
	
	lastLine := lines last.
	
	contentLength := lines inject: 0 into: [ :aContentLength :aLine | aContentLength max: aLine length ].
	contentBreadth := lastLine startBreadth + lastLine breadth.
	
	parentLength := self size: contentLength max: self maxLength for: anExtentSpec widthSpec.
	parentBreadth := self size: contentBreadth max: self maxBreadth for: anExtentSpec heightSpec.
	
	self alignLines: lines within: parentLength @ parentBreadth.
	lines do: [ :aLine | self measureLine: aLine ].

	totalContentWidth := anElement padding width.
	totalContentHeight := anElement padding height.
	
	self orientation isHorizontal ifTrue: [ 
		totalContentWidth := totalContentWidth + contentLength.
		totalContentHeight := totalContentHeight + contentBreadth ].
	self orientation isVertical ifTrue: [ 
		totalContentWidth := totalContentWidth + contentBreadth.
		totalContentHeight := totalContentHeight + contentLength ].
	
	anElement measuredExtent: (anExtentSpec sizeFor: totalContentWidth @ totalContentHeight)
]

{ #category : 'calculating' }
TbFlowLayoutMeasurer >> measureLine: aLine [
	
	aLine children do: [ :aChild |
		| aRequestedExtent |
		aRequestedExtent := aChild width @ aChild height.
		aChild element measuredExtent = aRequestedExtent ifFalse: [ 
			aChild element measure: (TbExtentMeasurementSpec exact: aRequestedExtent) ] ]
]

{ #category : 'accessing' }
TbFlowLayoutMeasurer >> orientation [
	^ orientation
]

{ #category : 'calculating' }
TbFlowLayoutMeasurer >> size: aContentSize max: aMaxContentSize for: aMeasumentSpec [

	aMeasumentSpec isUnspecified
		ifTrue: [ ^ aContentSize ].
		
	aMeasumentSpec isAtMost 
		ifTrue: [ ^ aContentSize min: aMaxContentSize ].
		
	aMeasumentSpec isExact
		ifTrue: [ ^ aMaxContentSize ].
	
	^ aContentSize
]

{ #category : 'accessing' }
TbFlowLayoutMeasurer >> widthMode [
	^ widthMode
]
