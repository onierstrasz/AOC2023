Class {
	#name : #P9SequenceExamples,
	#superclass : #Object,
	#category : #'AOC2023-Puzzle9'
}

{ #category : #accessing }
P9SequenceExamples >> sampleInput [
	<gtExample>
	^ '0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45'
]

{ #category : #accessing }
P9SequenceExamples >> sequenceSet [
	<gtExample>
	|set|
	set := P9SequenceSet new data: self sampleInput.
	^ set
]

{ #category : #accessing }
P9SequenceExamples >> sequenceSetWithNextEstimates [
	<gtExample>
	| set estimates |
	set := self sequenceSet.
	estimates := set nextEstimates.
	self assert: estimates equals: #(18 28 68).
	self assert: estimates sum equals: 114.
	^ set
]

{ #category : #accessing }
P9SequenceExamples >> sequenceSetWithPreviousEstimates [
	<gtExample>
	| set estimates |
	set := self sequenceSet.
	estimates := set previousEstimates.
	self assert: estimates equals: #(-3 0 5).
	self assert: estimates sum equals: 2.
	^ set
]
