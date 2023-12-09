Class {
	#name : #P2Sequence,
	#superclass : #Object,
	#instVars : [
		'data',
		'sequence'
	],
	#category : #'AOC2023-Puzzle9'
}

{ #category : #accessing }
P2Sequence >> data: aString [
	data := aString.
	self initializeSequence
]

{ #category : #accessing }
P2Sequence >> derivative [
	^ self class new
		sequence: sequence allButFirst - sequence allButLast;
		yourself
]

{ #category : #accessing }
P2Sequence >> derivatives [
	| current maxIterations derivatives |
	maxIterations := self maxIterations.
	current := self.
	derivatives := OrderedCollection with: current.
	[ maxIterations > 0 and: [ current isAllZero not ] ]
		whileTrue: [ maxIterations := maxIterations - 1.
			current := current derivative.
			derivatives addLast: current ].
	^ derivatives
]

{ #category : #accessing }
P2Sequence >> gtDerivativesFor: aView [
	<gtView>
	^ aView forward
		title: 'Derivatives';
		priority: 20;
		object: [ self derivatives ];
		view: #gtItemsFor:
]

{ #category : #accessing }
P2Sequence >> initializeSequence [
	sequence := (Character space split: data) collect: #asNumber
]

{ #category : #accessing }
P2Sequence >> isAllZero [
	^ sequence
		detect: [ :item | item ~= 0 ]
		ifFound: [ false ]
		ifNone: [ true ]
]

{ #category : #accessing }
P2Sequence >> maxIterations [
	"Stop computing derivatives if we seem to be going too far."

	^ 100
]

{ #category : #accessing }
P2Sequence >> printOn: aStream [
	aStream nextPutAll: data
]

{ #category : #accessing }
P2Sequence >> printSequence [
	^ Character space join: (sequence collect: #asString)
]

{ #category : #accessing }
P2Sequence >> sequence [
	^ sequence
]

{ #category : #accessing }
P2Sequence >> sequence: anOrderedCollectionOfNumbers [
	sequence := anOrderedCollectionOfNumbers.
	data := self printSequence
]
