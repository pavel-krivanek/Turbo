Class {
	#name : #TbOvershootingSplineBasedScroller,
	#superclass : #Object,
	#traits : 'TTbDebug',
	#classTraits : 'TTbDebug classTrait',
	#instVars : [
		'startPosition',
		'currentPosition',
		'finalPosition',
		'startVelocity',
		'currentVelocity',
		'deceleration',
		'startTime',
		'updateTime',
		'duration',
		'splineDuration',
		'splineDistance',
		'isFinished',
		'overshotDistance',
		'physicalCoefficient',
		'time',
		'currentStep',
		'friction',
		'ppi',
		'shouldRound',
		'mode'
	],
	#pools : [
		'TbScrollerConstants'
	],
	#category : #'Turbo-Core-Utilities - Scrolling'
}

{ #category : #'private - physics' }
TbOvershootingSplineBasedScroller >> adjustDuration: aDuration start: aStart final: aNewFinal previousFinal: anOldFinal [
	<return: #Duration>
	| anOldDistance aNewDistance anX anIndex anIndexPlusOne aNewDuration |

	aNewDuration := aDuration.
	
	anOldDistance := anOldFinal - aStart.
	aNewDistance := aNewFinal - aStart.
	anX := (aNewDistance / anOldDistance) asFloat abs.
	anIndex := self truncated: (self nbSamples * anX).
	anIndexPlusOne := anIndex + 1.

	(anIndex < self nbSamples)
		ifTrue: [ 
			| xInf xSup tInf tSup timeCoeff|
			xInf := (anIndex / self nbSamples) asFloat.
			xSup := (anIndexPlusOne / self nbSamples) asFloat.
			tInf := self splineTime at: anIndexPlusOne.
			tSup := self splineTime at: anIndexPlusOne + 1.
			timeCoeff := tInf + ( (anX - xInf) / (xSup - xInf) * (tSup - tInf) ).
			"duration must not be fractional"
			aNewDuration := (self truncated: (aDuration * timeCoeff) asMilliSeconds) milliSeconds ].
		
	^ aNewDuration
]

{ #category : #'api - configuration' }
TbOvershootingSplineBasedScroller >> bePrecise [
	"Do not round or truncate values. Computations will be precise, not suitable for actual use,
	however, can be used to create nice visualisations and graphs of scrolling behaviour"

	shouldRound := false
]

{ #category : #'api - configuration' }
TbOvershootingSplineBasedScroller >> beRounded [
	"Round or truncate values to produce integer results (default)"

	shouldRound := true
]

{ #category : #'private - lifecycle' }
TbOvershootingSplineBasedScroller >> continue [
	"Let scrolling decide whether animation should continue even though we reached our
	destination or animation duration is over. #continue allows scroller to support
	spring back or fling animations and nicely handle overshot. If false is returned,
	animation is treated as finished.
	Returns true if animation should continue, false otherwise"
	<return: #Boolean>
	| shouldContinue |
	
	shouldContinue := self mode continueOn: self.
	shouldContinue
		"perform an update if we continue, because it is skipped during #run step"
		ifTrue: [ self update ].

	^ shouldContinue
]

{ #category : #'api - accessing' }
TbOvershootingSplineBasedScroller >> currentPosition [
	<return: #Number>

	^ currentPosition
]

{ #category : #'private - accessing' }
TbOvershootingSplineBasedScroller >> currentPosition: aNumber [
	
	self
		assert: [ aNumber isNotNil ]
		description: [ 'Position can not be nil!' ].
	
	currentPosition := aNumber
]

{ #category : #'api - accessing' }
TbOvershootingSplineBasedScroller >> currentStep [
	<return: #BlSplineOverScrollerStep>

	^ currentStep
]

{ #category : #'api - accessing' }
TbOvershootingSplineBasedScroller >> currentVelocity [
	<return: #Number>

	^ currentVelocity
]

{ #category : #'private - accessing' }
TbOvershootingSplineBasedScroller >> currentVelocity: aNumber [
	
	self
		assert: [ aNumber isNotNil ]
		description: [ 'Velocity can not be nil!' ].
	
	currentVelocity := aNumber
]

{ #category : #'api - physics' }
TbOvershootingSplineBasedScroller >> deceleration [
	"Return constant current deceleration"
	<return: #Number>
	
	^ deceleration
]

{ #category : #'private - accessing' }
TbOvershootingSplineBasedScroller >> deceleration: aNumber [
	deceleration := aNumber
]

{ #category : #'private - physics' }
TbOvershootingSplineBasedScroller >> decelerationFor: aVelocity [
	"Return a signed deceleration that will reduce the velocity"
	<return: #Number>

	^ aVelocity > 0
		ifTrue: [ Gravity negated ]
		ifFalse: [ Gravity ]
]

{ #category : #'api - physics' }
TbOvershootingSplineBasedScroller >> decelerationRate [
	<return: #Number>
	
	^ DecelerationRate
]

{ #category : #accessing }
TbOvershootingSplineBasedScroller >> duration [
	"Return animation duration"
	<return: #Duration>

	^ duration
]

{ #category : #'private - accessing' }
TbOvershootingSplineBasedScroller >> duration: aDuration [

	duration := aDuration
]

{ #category : #'api - physics' }
TbOvershootingSplineBasedScroller >> endTension [
	<return: #Number>
	
	^ EndTension
]

{ #category : #accessing }
TbOvershootingSplineBasedScroller >> finalPosition [
	<return: #Number>

	^ finalPosition
]

{ #category : #'private - accessing' }
TbOvershootingSplineBasedScroller >> finalPosition: aNumber [
	finalPosition := aNumber
]

{ #category : #'private - lifecycle' }
TbOvershootingSplineBasedScroller >> finish [
	"Finish animation and perform the necessary cleanup"

	self mode finishOn: self
]

{ #category : #'private - physics' }
TbOvershootingSplineBasedScroller >> fitOnBounceCurveFor: aVelocity start: aStart end: anEnd [
	| aDurationToApex aDistanceToApex aDistanceToEdge aSquaredVelocity aTotalDuration |
	
	"Simulate a bounce that started from edge"
	aDurationToApex := aVelocity negated / deceleration.
	aSquaredVelocity := aVelocity * aVelocity.
	aDistanceToApex := (aSquaredVelocity / 2.0) / deceleration abs.
	aDistanceToEdge := (anEnd - aStart) abs.
	
	aTotalDuration := (2.0 * (aDistanceToApex + aDistanceToEdge) / deceleration abs ) sqrt.
	
	"Update values"
	startTime := startTime - (self truncated: (1000 * (aTotalDuration - aDurationToApex))) milliSeconds.
	startPosition := anEnd.
	currentPosition := anEnd.
	startVelocity := self truncated: (deceleration negated * aTotalDuration).
]

{ #category : #'api - scrolling' }
TbOvershootingSplineBasedScroller >> fling: aVelocity start: aStart min: aMin max: aMax over: anOvershotDistance [
	
	self flag: 'refactor'.
	
	(self isBallistic and: [ aVelocity abs > self currentVelocity abs and: [ aVelocity abs <  self startVelocity abs ] ])
		ifTrue: [ ^ self ].

	(self isCubic and: [ self isFinished not and: [ self currentVelocity isZero not and: [ aVelocity sign ~~ self startVelocity sign ] ] ])
		ifTrue: [ ^ self ].
		
	self mode: (BlSplineOverScrollerFlingMode new
		velocity: aVelocity;
		startPosition: aStart;
		minPosition: aMin;
		maxPosition: aMax;
		overshotDistance: anOvershotDistance)
]

{ #category : #'api - physics' }
TbOvershootingSplineBasedScroller >> friction [
	"Return the amount of friction applied to scrolls and flings.
	It is a scalar dimensionless value representing the coefficient of friction."
	<return: #Number>

	^ friction
]

{ #category : #accessing }
TbOvershootingSplineBasedScroller >> friction: aNumber [
	friction := aNumber
]

{ #category : #'api - physics' }
TbOvershootingSplineBasedScroller >> inflexion [
	<return: #Number>

	^ Inflexion
]

{ #category : #initialization }
TbOvershootingSplineBasedScroller >> initialize [
	super initialize.

	time := BlTime real.
	
	currentPosition := 0.0.
	currentVelocity := 0.0.
	currentStep := Spline.
	mode := BlSplineOverScrollerNoneMode new.
	
	splineDistance := 0.0.
	splineDuration := 0 milliSeconds.

	friction := 0.015.
	deceleration := 0.0.
	ppi := 96.0.
	shouldRound := true.
	
	isFinished := true.
]

{ #category : #'api - testing' }
TbOvershootingSplineBasedScroller >> isBallistic [
	<return: #Boolean>

	^ currentStep = Ballistic
]

{ #category : #'api - testing' }
TbOvershootingSplineBasedScroller >> isCubic [
	<return: #Boolean>

	^ currentStep = Cubic
]

{ #category : #'api - testing' }
TbOvershootingSplineBasedScroller >> isFinished [
	<return: #Boolean>

	^ isFinished
]

{ #category : #'private - accessing' }
TbOvershootingSplineBasedScroller >> isFinished: aBoolean [
	isFinished := aBoolean
]

{ #category : #'api - testing' }
TbOvershootingSplineBasedScroller >> isSpline [
	<return: #Boolean>

	^ currentStep = Spline
]

{ #category : #'api - configuration' }
TbOvershootingSplineBasedScroller >> mode [
	<return: #BlSplineOverScrollerMode>

	^ mode
]

{ #category : #'api - configuration' }
TbOvershootingSplineBasedScroller >> mode: aBlSplineScrollerMode [
	"Switch current scroller mode"

	mode := aBlSplineScrollerMode.
	mode initializeOn: self
]

{ #category : #'api - physics' }
TbOvershootingSplineBasedScroller >> nbSamples [
	<return: #Number>

	^ NbSamples
]

{ #category : #'private - scrolling' }
TbOvershootingSplineBasedScroller >> notifyEdgeReached: anOvershotDistance start: aStart end: anEnd [
	
	currentStep = Spline
		ifTrue: [ 
			overshotDistance := anOvershotDistance.
			startTime := self time now.
			"We were in fling/scroll mode before: current velocity is such that distance to
			edge is increasing. This ensures that startAfterEdge will not start a new fling."
			self startAfterEdgeFor: self currentVelocity start: aStart min: anEnd max: anEnd ]
]

{ #category : #hooks }
TbOvershootingSplineBasedScroller >> onEdgeReached [
	| aSquaredVelocity aDistance |
	"startPosition, startVelocity and startTime were adjusted to their values when edge was reached"
	
	aSquaredVelocity := startVelocity * startVelocity.
	aDistance := aSquaredVelocity / (2.0 * deceleration abs).
	
	(aDistance > overshotDistance)
		ifTrue: [ 
			"Default deceleration is not sufficient to slow us down before boundary"
			deceleration := (startVelocity sign negated * aSquaredVelocity ) / (2.0 * overshotDistance).
			aDistance := overshotDistance	].
	
	"overshot distance must not contain fractional numbers"
	overshotDistance := self truncated: aDistance.
	
	currentStep := BlSplineOverScrollerStep ballistic.
	finalPosition := startPosition + (self truncated: (startVelocity > 0
		ifTrue: [ aDistance ]
		ifFalse: [ aDistance negated ])).
	
	duration := (self truncated: (1000 * startVelocity / deceleration)) negated milliSeconds
]

{ #category : #accessing }
TbOvershootingSplineBasedScroller >> overshotDistance [
	<return: #Number>

	^ overshotDistance
]

{ #category : #'private - accessing' }
TbOvershootingSplineBasedScroller >> overshotDistance: aNumber [

	overshotDistance := aNumber
]

{ #category : #'api - physics' }
TbOvershootingSplineBasedScroller >> physicalCoefficient [
	<return: #Number>

	^ GravityEarth
		* 39.37 "inch/meter"
		* self ppi  "ppi"
		* 0.84. "look and feel tuning"
]

{ #category : #accessing }
TbOvershootingSplineBasedScroller >> ppi [
	<return: #Number>

	^ ppi
]

{ #category : #accessing }
TbOvershootingSplineBasedScroller >> ppi: aNumber [
	ppi := aNumber
]

{ #category : #'private - rounding' }
TbOvershootingSplineBasedScroller >> rounded: aNumber [
	"Round a given number according to my current rounding precision"
	<return: #Number>
	
	^ self shouldRound
		ifTrue: [ aNumber rounded ]
		ifFalse: [ aNumber ]
]

{ #category : #'api - running' }
TbOvershootingSplineBasedScroller >> run [
	"Run a simulation step and return true if animation is not finished"
	<return: #Boolean>

	self isFinished
		ifTrue: [ ^ false ].

	self update
		ifTrue: [ ^ true ].

	self continue
		ifTrue: [ ^ true ].

	self finish.
	^ false
]

{ #category : #'api - configuration' }
TbOvershootingSplineBasedScroller >> shouldRound [
	"Return true if I round values and produce integer results, false otherwise"
	<return: #Boolean>
	
	^ shouldRound
]

{ #category : #'private - physics' }
TbOvershootingSplineBasedScroller >> splineDecelerationFor: aVelocity [
	<return: #Number>

	^ ((self inflexion * aVelocity abs) / (self friction * self physicalCoefficient)) ln
]

{ #category : #accessing }
TbOvershootingSplineBasedScroller >> splineDistance [
	"Distance to travel along spline animation"
	<return: #Number>

	^ splineDistance
]

{ #category : #'private - accessing' }
TbOvershootingSplineBasedScroller >> splineDistance: aNumber [
	splineDistance := aNumber
]

{ #category : #accessing }
TbOvershootingSplineBasedScroller >> splineDuration [
	"Duration to complete spline component of animation"
	<return: #Duration>

	^ splineDuration
]

{ #category : #'private - accessing' }
TbOvershootingSplineBasedScroller >> splineDuration: aDuration [

	splineDuration := aDuration
]

{ #category : #'private - physics' }
TbOvershootingSplineBasedScroller >> splineFlingDistanceFor: aVelocity [
	<return: #Number>
	| aSplineDeceleration |

	aSplineDeceleration := self splineDecelerationFor: aVelocity.
	^ (self friction * self physicalCoefficient * (self decelerationRate / (self decelerationRate - 1) * aSplineDeceleration ) exp)
]

{ #category : #'private - physics' }
TbOvershootingSplineBasedScroller >> splineFlingDurationFor: aVelocity [
	"Return the duration, expressed in milliseconds"
	<return: #Duration>
	| aSplineDeceleration |
	
	aSplineDeceleration := self splineDecelerationFor: aVelocity.
	"we explicitely truncate, not round to be in sync with original implementation of the algorithm"
	^ (self truncated: (1000.0 * (aSplineDeceleration / ( DecelerationRate - 1 ) ) exp)) milliSeconds
]

{ #category : #'api - physics' }
TbOvershootingSplineBasedScroller >> splineTime [
	<return: #Array of: #Number>

	^ SplineTime
]

{ #category : #'private - scrolling' }
TbOvershootingSplineBasedScroller >> springback: aStart min: aMin max: aMax [
	
	isFinished := true.
	startPosition := aStart.
	finalPosition := aStart.
	currentPosition := aStart.
	startVelocity := 0.
	
	startTime := self time now.
	duration := 0 milliSeconds.

	aStart < aMin
		ifTrue: [ self startSpringbackFor: 0 start: aStart end: aMin ]
		ifFalse: [ aStart > aMax
			ifTrue: [ self startSpringbackFor: 0 start: aStart end: aMax ] ].
		
	^ isFinished not
]

{ #category : #'private - scrolling' }
TbOvershootingSplineBasedScroller >> startAfterEdgeFor: aVelocity start: aStart min: aMin max: aMax [
	| isPositive anEdge anOverDistance shouldKeepInscreasing |
	
	(aStart > aMin and: [ aStart < aMax ])
		"Position is already valid, return"
		ifTrue: [ isFinished := true. ^ self ].
	
	isPositive := aStart > aMax.
	anEdge := isPositive
		ifTrue: [ aMax ]
		ifFalse: [ aMin ].
	
	anOverDistance := aStart - anEdge.
	shouldKeepInscreasing := (anOverDistance * aVelocity) >= 0.
	
	shouldKeepInscreasing
		"Will result in a bounce or a to_boundary depending on velocity."
		ifTrue: [ self startBounceAfterEdgeFor: aVelocity start: aStart end: anEdge ]
		ifFalse: [ 
			| aTotalDistance |
			aTotalDistance := self splineFlingDistanceFor: aVelocity.
			(aTotalDistance > anOverDistance abs)
				ifTrue: [ self
					fling: aVelocity
					start: aStart
					min: (isPositive ifTrue: [ aMin ] ifFalse: [ aStart ] )
					max: (isPositive ifTrue: [ aStart ] ifFalse: [ aMax ] )
					over: overshotDistance ]
				ifFalse: [ self startSpringbackFor: aVelocity start: aStart end: anEdge ] ]
]

{ #category : #'private - scrolling' }
TbOvershootingSplineBasedScroller >> startBounceAfterEdgeFor: aVelocity start: aStart end: anEnd [

	deceleration := self decelerationFor: ( aVelocity isZero
		ifTrue: [ aStart - anEnd ]
		ifFalse: [ aVelocity ] ).
		
	self fitOnBounceCurveFor: aVelocity start: aStart end: anEnd.
	self onEdgeReached
]

{ #category : #accessing }
TbOvershootingSplineBasedScroller >> startPosition [
	<return: #Number>

	^ startPosition
]

{ #category : #'private - accessing' }
TbOvershootingSplineBasedScroller >> startPosition: aNumber [
	startPosition := aNumber
]

{ #category : #'api - scrolling' }
TbOvershootingSplineBasedScroller >> startScrollBy: aDistance from: aStartPosition during: aDuration interpolator: anInterpolator [
	
	self mode: (BlSplineOverScrollerScrollMode new
		distance: aDistance;
		startPosition: aStartPosition;
		duration: aDuration;
		interpolator: anInterpolator)
]

{ #category : #'private - scrolling' }
TbOvershootingSplineBasedScroller >> startSpringbackFor: aVelocity start: aStartPosition end: anEndPosition [
	| aDelta |
	
	"mStartTime has been set"
	isFinished := false.
	currentStep := Cubic.
	startPosition := aStartPosition.
	currentPosition := aStartPosition.
	finalPosition := anEndPosition.
	
	aDelta := aStartPosition - anEndPosition.
	deceleration := self decelerationFor: aDelta.
	startVelocity := aDelta negated.
	overshotDistance := aDelta abs.
	duration := (self truncated: (1000 * (-2.0 * aDelta / deceleration) sqrt)) milliSeconds
]

{ #category : #'api - physics' }
TbOvershootingSplineBasedScroller >> startTension [
	<return: #Number>
	
	^ StartTension
]

{ #category : #accessing }
TbOvershootingSplineBasedScroller >> startTime [
	"Return animation starting time"
	<return: #DateAndTime>

	^ startTime
]

{ #category : #'private - accessing' }
TbOvershootingSplineBasedScroller >> startTime: aDateAndTime [
	startTime := aDateAndTime
]

{ #category : #accessing }
TbOvershootingSplineBasedScroller >> startVelocity [
	<retrun: #Number>

	^ startVelocity
]

{ #category : #'private - accessing' }
TbOvershootingSplineBasedScroller >> startVelocity: aNumber [
	startVelocity := aNumber
]

{ #category : #'private - steps' }
TbOvershootingSplineBasedScroller >> switchToBallistic [
	currentStep := BlSplineOverScrollerStep ballistic
]

{ #category : #'private - steps' }
TbOvershootingSplineBasedScroller >> switchToCubic [
	currentStep := BlSplineOverScrollerStep cubic
]

{ #category : #'private - steps' }
TbOvershootingSplineBasedScroller >> switchToSpline [
	currentStep := BlSplineOverScrollerStep spline
]

{ #category : #accessing }
TbOvershootingSplineBasedScroller >> time [
	<return: #BlTime>
	
	^ time
]

{ #category : #accessing }
TbOvershootingSplineBasedScroller >> time: aBlTime [
	"Set a new time provider"
	
	time == aBlTime
		ifTrue: [ ^ self ].
	
	time := aBlTime.
	self startTime: self time now
]

{ #category : #'private - rounding' }
TbOvershootingSplineBasedScroller >> truncated: aNumber [
	"Truncate a given number according to my current rounding precision"
	<return: #Number>

	^ self shouldRound
		ifTrue: [ aNumber truncated ]
		ifFalse: [ aNumber ]
]

{ #category : #'private - lifecycle' }
TbOvershootingSplineBasedScroller >> update [
	"Update the current position and velocity for current time.
	Returns true if update has been done and false if animation duration has been reached."
	<return: #Boolean>
	
	updateTime := self time now.
	
	^ self mode updateOn: self
]

{ #category : #'private - updating' }
TbOvershootingSplineBasedScroller >> updateBallistic: aDeltaTime [
	"r = vt + at^2 / 2, r - distance, t - delta time, a - acceleration (constant)
	https://en.wikipedia.org/wiki/Acceleration#Uniform_acceleration"
	| aTimeInSeconds |

	aTimeInSeconds := aDeltaTime asMilliSeconds / 1000.0.
	
	self currentVelocity: startVelocity + (self deceleration * aTimeInSeconds).
	
	^ (startVelocity * aTimeInSeconds) + (self deceleration * aTimeInSeconds * aTimeInSeconds / 2.0)
]

{ #category : #'private - updating' }
TbOvershootingSplineBasedScroller >> updateCubic: aDeltaTime [
	| aTime aSquaredTime aSign |
	
	aTime := (aDeltaTime / self duration) asFloat.
	aSquaredTime := aTime * aTime.
	aSign := startVelocity sign.
	
	self currentVelocity: aSign * overshotDistance * 6.0 * (aSquaredTime - aTime).
	
	^ aSign * overshotDistance * ((3.0 * aSquaredTime) - (2 * aTime * aSquaredTime))
]

{ #category : #'private - updating' }
TbOvershootingSplineBasedScroller >> updateSpline: aDeltaTime [
	| aTime anIndex aDistanceCoef aVelocityCoef |
	
	aTime := aDeltaTime / self splineDuration.
	anIndex := (NbSamples * aTime) asInteger.
	aVelocityCoef := 0.0.
	aDistanceCoef := 1.0.
	
	anIndex < NbSamples
		ifTrue: [
			| tInf tSup dInf dSup |
			tInf := anIndex / NbSamples.
			tSup := (anIndex + 1) / NbSamples.
			dInf := SplinePosition at: anIndex + 1.
			dSup := SplinePosition at: anIndex + 2.
			aVelocityCoef := (dSup - dInf) / (tSup - tInf).
			aDistanceCoef := dInf + ((aTime - tInf) * aVelocityCoef) ].

	self currentVelocity: (aVelocityCoef * splineDistance / self splineDuration asMilliSeconds) * 1000.0.

	^ aDistanceCoef * splineDistance
]

{ #category : #accessing }
TbOvershootingSplineBasedScroller >> updateTime [
	"Return last update time"
	<return: #DateAndTime>

	^ updateTime
]

{ #category : #accessing }
TbOvershootingSplineBasedScroller >> updateTime: aDateAndTime [
	updateTime := aDateAndTime
]
