Class {
	#name : #P4Scratchcard,
	#superclass : #Object,
	#instVars : [
		'data',
		'name',
		'winners',
		'scratched'
	],
	#category : #'AOC2023-Puzzle4'
}

{ #category : #accessing }
P4Scratchcard >> data: aString [
	"We keep the raw data for the printString"

	data := aString.
	self initializeData
]

{ #category : #accessing }
P4Scratchcard >> initialize [
	name := 'unknown'.
	winners := #().
	scratched := #()
]

{ #category : #accessing }
P4Scratchcard >> initializeData [
	| numbers |
	name := ($: split: data) first.
	numbers := $| split: ($: split: data) second.
	winners := numbers first substrings collect: #asNumber.
	scratched := numbers second substrings collect: #asNumber
]

{ #category : #accessing }
P4Scratchcard >> points [
	| winning |
	winning := winners asSet intersection: scratched.
	^ winning ifEmpty: [ 0 ] ifNotEmpty: [ 2 raisedToInteger: winning size - 1 ]
]

{ #category : #accessing }
P4Scratchcard >> printOn: aStream [
	aStream nextPutAll: data
]
