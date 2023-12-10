Class {
	#name : #P4ScratchcardSet,
	#superclass : #Object,
	#instVars : [
		'set'
	],
	#category : #'AOC2023-Puzzle4'
}

{ #category : #accessing }
P4ScratchcardSet >> data: aString [
	self initializeSetFrom: aString
]

{ #category : #accessing }
P4ScratchcardSet >> gtScratchcardsFor: aView [
	<gtView>
	^ aView forward
		title: 'Scratchcards';
		priority: 10;
		object: [ set ];
		view: #gtItemsFor:
]

{ #category : #accessing }
P4ScratchcardSet >> initializeSetFrom: data [
	set := (data lines select: #notEmpty)
			collect: [ :each | P4Scratchcard new data: each ]
]

{ #category : #accessing }
P4ScratchcardSet >> points [
	^ set collect: #points
]

{ #category : #accessing }
P4ScratchcardSet >> set [
	^ set
]
