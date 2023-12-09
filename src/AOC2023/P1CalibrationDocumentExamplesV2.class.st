Class {
	#name : #P1CalibrationDocumentExamplesV2,
	#superclass : #P1CalibrationDocumentExamples,
	#category : #'AOC2023-Puzzle1'
}

{ #category : #accessing }
P1CalibrationDocumentExamplesV2 >> docClass [
	^ P1CalibrationDocumentV2
]

{ #category : #accessing }
P1CalibrationDocumentExamplesV2 >> sampleDocument [
	<gtExample>
	| doc |
	doc := self docClass new data: self sampleInput.
	self
		assert: (doc lines collect: #number)
		equals: #(29 83 13 24 42 14 76).
	self assert: doc sum equals: 281.
	^ doc
]

{ #category : #accessing }
P1CalibrationDocumentExamplesV2 >> sampleInput [
	<gtExample>
	^ 'two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen'
]
