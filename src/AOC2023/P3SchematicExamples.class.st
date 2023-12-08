Class {
	#name : #P3SchematicExamples,
	#superclass : #Object,
	#category : #'AOC2023-Puzzle3'
}

{ #category : #accessing }
P3SchematicExamples >> sampleInput [
	<gtExample>
	^ '467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..'
]

{ #category : #accessing }
P3SchematicExamples >> schematic [
	<gtExample>
	| eg |
	eg := P3Schematic new data: self sampleInput.
	^ eg
]
