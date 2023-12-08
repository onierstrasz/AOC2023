Class {
	#name : #P2CubeSet,
	#superclass : #Object,
	#instVars : [
		'data',
		'count'
	],
	#category : #'AOC2023-Puzzle2'
}

{ #category : #accessing }
P2CubeSet >> < other [
	(other isKindOf: P2CubeSet) ifFalse: [ ^ false ].
	count
		keysAndValuesDo: [ :key :val | (val > other count at: key) ifTrue: [ ^ false ] ].
	^ true
]

{ #category : #accessing }
P2CubeSet >> count [
	^ count
]

{ #category : #accessing }
P2CubeSet >> count: aDictionary [
	"If we set the count explicitly, enter a fake data string"

	count := aDictionary.
	data := self printString
]

{ #category : #accessing }
P2CubeSet >> data: aString [
	data := aString.
	self updateCount.
]

{ #category : #accessing }
P2CubeSet >> emptyCount [
	^ count := {'red' -> 0.
			'green' -> 0.
			'blue' -> 0} asDictionary
]

{ #category : #accessing }
P2CubeSet >> gtCountFor: aView [
	<gtView>
	^ aView forward
		title: 'Count';
		priority: 10;
		object: self count;
		view: #gtItemsFor:
]

{ #category : #accessing }
P2CubeSet >> initialize [
	super initialize.
	data := '0 red'.
	self initializeCount
]

{ #category : #accessing }
P2CubeSet >> initializeCount [
	count := {'red' -> 0.
			'green' -> 0.
			'blue' -> 0} asDictionary
]

{ #category : #accessing }
P2CubeSet >> max: other [
	^ self class new
		count: (count associations
				collect: [ :each | each key -> (each value max: (other count at: each key)) ])
				asDictionary
]

{ #category : #accessing }
P2CubeSet >> power [
	^ count values inject: 1 into: [ :product :each | product * each ]
]

{ #category : #accessing }
P2CubeSet >> printOn: aStream [
	aStream
		nextPutAll: (', '
				join: (count associations collect: [ :each | each value asString , ' ' , each key ]))
]

{ #category : #accessing }
P2CubeSet >> updateCount [
	self initializeCount.
	^ (($, split: data) collect: #substrings)
		do: [ :each | count at: each second put: each first asNumber ]
]
