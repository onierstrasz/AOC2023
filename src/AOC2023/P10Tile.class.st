Class {
	#name : #P10Tile,
	#superclass : #Object,
	#instVars : [
		'char',
		'position',
		'map'
	],
	#classInstVars : [
		'deltas'
	],
	#category : #'AOC2023-Puzzle10'
}

{ #category : #constant }
P10Tile class >> deltas [
	^ deltas
		ifNil: [ deltas := {
				$| -> { (0@ -1) . (0@ 1)} . "NS"
				$- -> { ( -1 @ 0) . (1 @ 0)}. "WE"
				$L -> { (0@ -1) . (1@0)}. "NE"
				$J -> { (0@ -1) . (-1@0)}. "NW"
				$7 -> { (0@1) . (-1@0)}. "SW"
				$F -> { (0@1) . (1@0)}. "SE"
			} asDictionary ]
]

{ #category : #'instance - creation' }
P10Tile class >> for: aCharacter at: aPoint in: aMap [
	^ self new
		char: aCharacter;
		position: aPoint;
		map: aMap;
		yourself
]

{ #category : #'instance - creation' }
P10Tile class >> voidIn: aMap [
	"A void tile reepresents a tile outside the grid of the map"

	^ self new
		char: Character space;
		position: 0 @ 0;
		map: aMap;
		yourself
]

{ #category : #accessing }
P10Tile >> char [
	^ char
]

{ #category : #initialization }
P10Tile >> char: aCharacter [
	char := aCharacter
]

{ #category : #querying }
P10Tile >> connections [
	^ self isPipe
		ifTrue: [ (self deltas at: char) + self position collect: [ :p | map at: p ] ]
		ifFalse: [ #() ]
]

{ #category : #constant }
P10Tile >> deltas [
	^ self class deltas
]

{ #category : #querying }
P10Tile >> east [
	^ map at: position + (1 @ 0)
]

{ #category : #querying }
P10Tile >> findLoopOnPath: aPath [
	"I am the next tile in the path, looking for a loop.
	If I am the start node, I am done. If I am a pipe, then I add myself
	to the path and continue. If I am not a pipe, then I am a dead end."

	| nextTile |
	self isStart ifTrue: [ ^ aPath ].
	self isPipe ifFalse: [ ^ #() asOrderedCollection ].
	(self connections includes: aPath last) ifFalse: [ ^ #() asOrderedCollection ].
	nextTile := (self connections copyWithout: aPath last) first.
	^ nextTile
		findLoopOnPath: (aPath
				addLast: self;
				yourself)
]

{ #category : #testing }
P10Tile >> isGround [
	^ char == $.
]

{ #category : #testing }
P10Tile >> isPipe [
	^ self pipeChars includes: char
]

{ #category : #testing }
P10Tile >> isStart [
	^ char == $S
]

{ #category : #testing }
P10Tile >> isVoid [
	^ char == Character space
]

{ #category : #querying }
P10Tile >> loop [
	"We assume that there is just one loop, and the start node is connected to just two pipes. If that does not hold, we need to use a slightly more sophisticated algorithm to deal with (a) multiple loops, and (b) dead ends."

	| pipes |
	self
		assert: [ self isStart ]
		description: 'Compute loops starting from the start tile.'.
	pipes := self neighbours
			select: [ :tile | tile isPipe and: [ tile connections includes: self ] ].
	self
		assert: pipes size = 2
		description: 'The start node should be connected to exactly 2 pipes.'.
	^ pipes first findLoopOnPath: {self} asOrderedCollection
]

{ #category : #initialization }
P10Tile >> map: aMap [
	map := aMap
]

{ #category : #querying }
P10Tile >> neighbours [
	^ {self north.
		self east.
		self south.
		self west} reject: #isVoid
]

{ #category : #querying }
P10Tile >> north [
	^ map at: position + (0 @ -1)
]

{ #category : #constant }
P10Tile >> pipeChars [
	^ '|-LJ7F'
]

{ #category : #accessing }
P10Tile >> position [
	^ position
]

{ #category : #initialization }
P10Tile >> position: aPoint [
	position := aPoint
]

{ #category : #printing }
P10Tile >> printOn: aStream [
	aStream nextPut: char
]

{ #category : #querying }
P10Tile >> south [
	^ map at: position + (0 @ 1)
]

{ #category : #querying }
P10Tile >> west [
	^ map at: position + (-1 @ 0)
]
