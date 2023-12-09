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
P2Sequence >> initializeSequence [
	sequence := (Character space split: data) collect: #asNumber
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
