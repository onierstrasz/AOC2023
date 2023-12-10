Class {
	#name : #P10Tile,
	#superclass : #Object,
	#instVars : [
		'char',
		'position',
		'map'
	],
	#category : #'AOC2023-Puzzle10'
}

{ #category : #accessing }
P10Tile class >> for: aCharacter at: aPoint in: aMap [
	^ self new
		char: aCharacter;
		position: aPoint;
		map: aMap;
		yourself
]

{ #category : #accessing }
P10Tile >> char [
	^ char
]

{ #category : #accessing }
P10Tile >> char: aCharacter [
	char := aCharacter
]

{ #category : #accessing }
P10Tile >> isGround [
	^ char == $.
]

{ #category : #accessing }
P10Tile >> isPipe [
	^ self pipeChars includes: char
]

{ #category : #accessing }
P10Tile >> isStart [
	^ char == $S
]

{ #category : #accessing }
P10Tile >> map: aMap [
	map := aMap
]

{ #category : #accessing }
P10Tile >> pipeChars [
	^ '|-LJ7F'
]

{ #category : #accessing }
P10Tile >> position [
	^ position
]

{ #category : #accessing }
P10Tile >> position: aPoint [
	position := aPoint
]

{ #category : #accessing }
P10Tile >> printOn: aStream [
	aStream nextPut: char
]
