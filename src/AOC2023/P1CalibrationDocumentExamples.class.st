Class {
	#name : #P1CalibrationDocumentExamples,
	#superclass : #Object,
	#category : #'AOC2023-Puzzle1'
}

{ #category : #accessing }
P1CalibrationDocumentExamples >> docClass [
	^ P1CalibrationDocument
]

{ #category : #accessing }
P1CalibrationDocumentExamples >> sampleDocument [
	<gtExample>
	| doc |
	doc := self docClass new data: self sampleInput.
	self
		assert: (doc lines collect: #number)
		equals: #(12 38 15 77) asOrderedCollection.
	self assert: doc sum equals: 142.
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
