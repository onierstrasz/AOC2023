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
