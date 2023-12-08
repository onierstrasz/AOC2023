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
P1CalibrationLine >> lastDigit [
	^ data at: (data findLast: #isDigit)
]

{ #category : #accessing }
P1CalibrationLine >> number [
	^ (self firstDigit asString , self lastDigit asString) asNumber
]
