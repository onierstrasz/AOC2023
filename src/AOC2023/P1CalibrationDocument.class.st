Class {
	#name : #P1CalibrationDocument,
	#superclass : #Object,
	#instVars : [
		'lines'
	],
	#category : #'AOC2023-Puzzle1'
}

{ #category : #accessing }
P1CalibrationDocument >> data: aString [
	self initializeLinesFrom: aString
]

{ #category : #accessing }
P1CalibrationDocument >> gtLinesFor: aView [
	<gtView>
	^ aView forward
		title: 'Lines';
		priority: 10;
		object: [ lines ];
		view: #gtItemsFor:
]

{ #category : #accessing }
P1CalibrationDocument >> initializeLinesFrom: data [
	lines := (data lines select: #notEmpty)
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
