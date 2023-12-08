Class {
	#name : #P2CubeGameExamples,
	#superclass : #Object,
	#category : #'AOC2023-Puzzle2'
}

{ #category : #accessing }
P2CubeGameExamples >> sampleGame [
	<gtExample>
	| gameSet possible |
	gameSet := P2CubeGameSet new data: self sampleGameInput.
	possible := gameSet possible: self testCubeSet.
	self assert: (possible collect: #id) equals: #(1 2 5) asOrderedCollection.
	self assert: (possible collect: #id) sum equals: 8.
	^ gameSet
]

{ #category : #accessing }
P2CubeGameExamples >> sampleGameInput [
	<gtExample>
	^ 'Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green'
]

{ #category : #accessing }
P2CubeGameExamples >> sampleGamePowers [
	<gtExample>
	| gameSet |
	gameSet := P2CubeGameSet new data: self sampleGameInput.
	self assert: gameSet powers equals: #(48 12 1560 630 36) asOrderedCollection.
	self assert: gameSet powers sum equals: 2286.
	^ gameSet
]

{ #category : #accessing }
P2CubeGameExamples >> testCubeSet [
	<gtExample>
	^ P2CubeSet new data: ' 12 red , 13 green , 14 blue '
]
