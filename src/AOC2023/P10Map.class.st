Class {
	#name : #P10Map,
	#superclass : #Object,
	#instVars : [
		'grid'
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
P10Map >> initializeGrid: aString [
	grid := aString lines
			collectWithIndex: [ :line :row | 
				line asOrderedCollection
					collectWithIndex: [ :char :col | 
						P10Tile
							for: char
							at: row @ col
							in: self ] ]
]

{ #category : #accessing }
P10Map >> startTile [
	^ self tiles detect: #isStart
]

{ #category : #accessing }
P10Map >> tiles [
	^ grid flatten
]
