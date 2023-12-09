Class {
	#name : #P9SequenceSet,
	#superclass : #Object,
	#instVars : [
		'data',
		'sequences'
	],
	#category : #'AOC2023-Puzzle9'
}

{ #category : #accessing }
P9SequenceSet >> data: aString [
	data := aString.
	self initializeSequences
]

{ #category : #accessing }
P9SequenceSet >> gtSequencesFor: aView [
	<gtView>
	^ aView forward
		title: 'Sequences';
		priority: 10;
		object: [ sequences ];
		view: #gtItemsFor:
]

{ #category : #accessing }
P9SequenceSet >> initializeSequences [
	sequences := (data lines select: #notEmpty)
			collect: [ :each | P2Sequence new data: each ]
]

{ #category : #accessing }
P9SequenceSet >> nextEstimates [
	^ sequences collect: #next
]

{ #category : #accessing }
P9SequenceSet >> sequences [
	^ sequences
]
