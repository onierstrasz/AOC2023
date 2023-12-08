Class {
	#name : #P1CalibrationLineV2,
	#superclass : #P1CalibrationLine,
	#classInstVars : [
		'digitStringTable'
	],
	#category : #'AOC2023-Puzzle1'
}

{ #category : #accessing }
P1CalibrationLineV2 class >> digitStringTable [
	^ digitStringTable
		ifNil: [ digitStringTable := (#(zero one two three four five six seven eight nine)
					collectWithIndex: [ :each :n | each asString -> (n - 1) asString ])
					copyWithAll: ((0 to: 9) collect: [ :each | each asString -> each asString ]) ]
]

{ #category : #accessing }
P1CalibrationLineV2 >> digitStringTable [
	^ self class digitStringTable
]

{ #category : #accessing }
P1CalibrationLineV2 >> firstDigit [
	^ ((self digitStringTable
		collect: [ :assoc | (data findString: assoc key) -> assoc value ])
		select: [ :each | each key > 0 ]) sorted first value
]

{ #category : #accessing }
P1CalibrationLineV2 >> lastDigit [
	^ ((self digitStringTable
		collect: [ :assoc | (data findLastOccurrenceOfString: assoc key startingAt: 1) -> assoc value ])
		select: [ :each | each key > 0 ]) sorted last value
]
