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

{ #category : #accessing }
P10MapExamples >> nestMap1 [
	"First example for Part two"

	<gtExample>
	| map |
	map := P10Map from: self nestMapInput1.
	^ map
]

{ #category : #accessing }
P10MapExamples >> nestMap2 [
	"Second example for Part two"

	<gtExample>
	| map |
	map := P10Map from: self nestMapInput2.
	^ map
]

{ #category : #accessing }
P10MapExamples >> nestMapInput1 [
	"First example for Part two"

	<gtExample>
	^ '...........
.S-------7.
.|F-----7|.
.||.....||.
.||.....||.
.|L-7.F-J|.
.|..|.|..|.
.L--J.L--J.
...........'
]

{ #category : #accessing }
P10MapExamples >> nestMapInput2 [
	"Second example for Part two"

	<gtExample>
	^ 'FF7FSF7F7F7F7F7F---7
L|LJ||||||||||||F--J
FL-7LJLJ||||||LJL-77
F--JF--7||LJLJ7F7FJ-
L---JF-JLJ.||-FJLJJ7
|F|F-JF---7F7-L7L|7|
|FFJF7L7F-JF7|JL---7
7-L-JL7||F7|L7F-7F7|
L.L7LFJ|||||FJL7||LJ
L7JLJL-JLJLJL--JLJ.L'
]
