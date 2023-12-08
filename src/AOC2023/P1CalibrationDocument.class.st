Class {
	#name : #P1CalibrationDocument,
	#superclass : #Object,
	#instVars : [
		'data',
		'lines'
	],
	#category : #'AOC2023-Puzzle1'
}

{ #category : #accessing }
P1CalibrationDocument >> data: aString [
	data := aString.
	self initializeLines
]

{ #category : #accessing }
P1CalibrationDocument >> initializeLines [
	lines := ((Character lf split: data) select: #notEmpty)
			collect: [ :each | self lineClass new data: each ]
]

{ #category : #accessing }
P1CalibrationDocument >> lineClass [
	^ P1CalibrationLine
]

{ #category : #accessing }
P1CalibrationDocument >> lines [
	^ lines
]

{ #category : #accessing }
P1CalibrationDocument >> sum [
	^ (lines collect: #number) sum
]
