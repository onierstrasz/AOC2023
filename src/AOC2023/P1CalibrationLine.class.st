Class {
	#name : #P1CalibrationLine,
	#superclass : #Object,
	#instVars : [
		'data'
	],
	#category : #'AOC2023-Puzzle1'
}

{ #category : #accessing }
P1CalibrationLine >> data: aString [
	data := aString
]

{ #category : #accessing }
P1CalibrationLine >> firstDigit [
	^ data at: (data findFirst: #isDigit)
]

{ #category : #accessing }
P1CalibrationLine >> gtSummaryFor: aView [
	<gtView>
	^ aView forward
		title: 'Summary';
		priority: 10;
		object: [ {'Data' -> data.
				'First digit' -> self firstDigit asString.
				'Last digit' -> self lastDigit asString} asOrderedDictionary ];
		view: #gtItemsFor:
]

{ #category : #accessing }
P1CalibrationLine >> lastDigit [
	^ data at: (data findLast: #isDigit)
]

{ #category : #accessing }
P1CalibrationLine >> number [
	^ (self firstDigit asString , self lastDigit asString) asNumber
]

{ #category : #accessing }
P1CalibrationLine >> printOn: aStream [
	aStream nextPutAll: data
]
