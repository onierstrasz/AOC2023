Class {
	#name : #P1CalibrationDocumentExamples,
	#superclass : #Object,
	#category : #'AOC2023-Puzzle1'
}

{ #category : #accessing }
P1CalibrationDocumentExamples >> sampleDocument [
	<gtExample>
	| doc |
	doc := P1CalibrationDocument new data: self sampleInput.
	^ doc
]

{ #category : #accessing }
P1CalibrationDocumentExamples >> sampleInput [
	<gtExample>
	^ '1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet'
]
