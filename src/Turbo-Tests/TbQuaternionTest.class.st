Class {
	#name : 'TbQuaternionTest',
	#superclass : 'TestCase',
	#category : 'Turbo-Tests',
	#package : 'Turbo-Tests'
}

{ #category : 'tests' }
TbQuaternionTest >> testCreateWithComponents [
    | q |
    q := TbQuaternion x: 1 y: 2 z: 3 w: 4.
    self assert: (q isKindOf: TbQuaternion).
    self assert: q x equals: 1.
    self assert: q y equals: 2.
    self assert: q z equals: 3.
    self assert: q w equals: 4.
]

{ #category : 'tests' }
TbQuaternionTest >> testDefaultInitialize [
    | q |
    q := TbQuaternion new.
    self assert: q x equals: 0.
    self assert: q y equals: 0.
    self assert: q z equals: 0.
    self assert: q w equals: 1.
]

{ #category : 'tests' }
TbQuaternionTest >> testLengthOfDefault [
    | q |
    q := TbQuaternion new.
    self assert: q length equals: 1.
]

{ #category : 'tests' }
TbQuaternionTest >> testMultiplicationOrthogonal [
    | q1 q2 r |
    q1 := TbQuaternion x: 1 y: 0 z: 0 w: 0.
    q2 := TbQuaternion x: 0 y: 1 z: 0 w: 0.
    r := q1 * q2.
    self assert: r x equals: 0.
    self assert: r y equals: 0.
    self assert: r z equals: 1.
    self assert: r w equals: 0.
]

{ #category : 'tests' }
TbQuaternionTest >> testNormalizeInPlace [
    | q |
    q := TbQuaternion x: 2 y: 0 z: 0 w: 0.
    q normalize.
    self assert: q x equals: 1.
    self assert: q y equals: 0.
    self assert: q z equals: 0.
    self assert: q w equals: 0.
]

{ #category : 'tests' }
TbQuaternionTest >> testNormalizedReturnsNewInstance [
    | q q2 |
    q := TbQuaternion x: 0 y: 3 z: 0 w: 0.
    q2 := q normalized.
    self deny: q identicalTo: q2.
    self assert: q2 x equals: 0.
    self assert: q2 y equals: 1.
    self assert: q2 z equals: 0.
    self assert: q2 w equals: 0.
]

{ #category : 'tests' }
TbQuaternionTest >> testPrintOn [
    | q stream |
    q := TbQuaternion x: 1 y: -2 z: 3 w: -4.
    stream := WriteStream on: String new.
    q printOn: stream.
    self assert: stream contents equals: '(1, -2, 3, -4)'.
]

{ #category : 'tests' }
TbQuaternionTest >> testRotationAxisAngle [
    | q |
    "Rotation of 180° (pi radians) about X-axis yields quaternion (1,0,0,0)"
    q := TbQuaternion x: 1 y: 0 z: 0 angle: Float pi.
    self assert: q x equals: 1.
    self assert: q y equals: 0.
    self assert: q z equals: 0.
    self assert: q w equals: 0.
]

{ #category : 'tests' }
TbQuaternionTest >> testRotationZeroAxisError [
    self should: [ TbQuaternion x: 0 y: 0 z: 0 angle: 1 ] 
        raise: Error.
]
