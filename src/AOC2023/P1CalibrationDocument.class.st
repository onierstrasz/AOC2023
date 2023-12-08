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
			collect: [ :each | P1CalibrationLine new data: each ]
]

{ #category : #accessing }
P1CalibrationDocument >> sum [
	^ (lines collect: #number) sum
]
