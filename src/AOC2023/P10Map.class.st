Class {
	#name : #P10Map,
	#superclass : #Object,
	#instVars : [
		'grid',
		'void'
	],
	#category : #'AOC2023-Puzzle10'
}

{ #category : #accessing }
P10Map class >> from: aString [
	^ self new
		initializeGrid: aString;
		yourself
]

{ #category : #accessing }
P10Map >> at: aPoint [
	^ (aPoint > (0 @ 0) and: [ aPoint < (self topRight + (1 @ 1)) ])
		ifTrue: [ (grid at: aPoint y) at: aPoint x ]
		ifFalse: [ self void ]
]

{ #category : #querying }
P10Map >> furthestDistance [
	^ (self loop size - 1) / 2 roundUpTo: 1
]

{ #category : #accessing }
P10Map >> gtGridFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Grid';
		priority: 10;
		items: [ grid ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Item' text: [ :eachItem | String withAll: (eachItem collect: #char) ]
]

{ #category : #accessing }
P10Map >> initialize [
	super initialize.
	void := P10Tile voidIn: self
]

{ #category : #accessing }
P10Map >> initializeGrid: aString [
	grid := aString lines
			collectWithIndex: [ :line :row | 
				line asOrderedCollection
					collectWithIndex: [ :char :col | 
						P10Tile
							for: char
							at: col @ row
							in: self ] ]
]

{ #category : #querying }
P10Map >> loop [
	^ self startTile loop
]

{ #category : #accessing }
P10Map >> printOn: aStream [
	grid
		do: [ :row | 
			row do: [ :tile | aStream nextPut: tile char ].
			aStream nextPut: Character cr ]
]

{ #category : #accessing }
P10Map >> startTile [
	^ self tiles detect: #isStart
]

{ #category : #accessing }
P10Map >> tiles [
	^ grid flatten
]

{ #category : #accessing }
P10Map >> topRight [
	^ grid first size @ grid size
]

{ #category : #accessing }
P10Map >> void [
	^ void
]
