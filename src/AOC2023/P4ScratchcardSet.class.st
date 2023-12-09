Class {
	#name : #P4ScratchcardSet,
	#superclass : #Object,
	#instVars : [
		'data',
		'set'
	],
	#category : #'AOC2023-Puzzle4'
}

{ #category : #accessing }
P4ScratchcardSet >> data [
	^ data
]

{ #category : #accessing }
P4ScratchcardSet >> data: aString [
	data := aString.
	self initializeSet
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
P4ScratchcardSet >> initializeSet [
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
