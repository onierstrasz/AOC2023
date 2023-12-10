Class {
	#name : #P9SequenceSet,
	#superclass : #Object,
	#instVars : [
		'sequences'
	],
	#category : #'AOC2023-Puzzle9'
}

{ #category : #accessing }
P9SequenceSet >> data: aString [
	self initializeSequencesFrom: aString
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
P9SequenceSet >> initializeSequencesFrom: aString [
	sequences := (aString lines select: #notEmpty)
			collect: [ :each | P2Sequence new data: each ]
]

{ #category : #accessing }
P9SequenceSet >> nextEstimates [
	^ sequences collect: #next
]

{ #category : #accessing }
P9SequenceSet >> previousEstimates [
	^ sequences collect: #previous
]

{ #category : #accessing }
P9SequenceSet >> sequences [
	^ sequences
]
