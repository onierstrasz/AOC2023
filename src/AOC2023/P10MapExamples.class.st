Class {
	#name : #P10MapExamples,
	#superclass : #Object,
	#category : #'AOC2023-Puzzle10'
}

{ #category : #accessing }
P10MapExamples >> cleanMap [
	<gtExample>
	| map |
	map := P10Map from: self cleanMapInput.
	^ map
]

{ #category : #accessing }
P10MapExamples >> cleanMapInput [
<gtExample>
^  '.....
.S-7.
.|.|.
.L-J.
.....'.

]

{ #category : #accessing }
P10MapExamples >> cleanMapWithConnections [
	<gtExample>
	| map pipes |
	map := P10Map from: self cleanMapInput.
	pipes := map tiles select: #isPipe.
	self assert: pipes size equals: 7.
	pipes
		do: [ :pipe | pipe connections do: [ :tile | self assert: (tile isPipe or: [ tile isStart ]) ] ].
	^ map
]

{ #category : #accessing }
P10MapExamples >> cleanMapWithLoop [
	<gtExample>
	| map loop |
	map := P10Map from: self cleanMapInput.
	loop := map startTile loop.
	self assert: loop size equals: 8.
	^ map
]

{ #category : #accessing }
P10MapExamples >> cleanMapWithPositions [
	<gtExample>
	| map |
	map := P10Map from: self cleanMapInput.
	self assert: (map at: map startTile position) isStart.
	self assert: (map at: 0 @ 0) isVoid.
	self assert: (map at: 2 @ 3) isPipe.
	self assert: (map at: 2 @ 3) char equals: $|.
	map tiles do: [ :tile | self assert: (map at: tile position) equals: tile ].
	^ map
]
