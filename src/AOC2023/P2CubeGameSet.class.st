Class {
	#name : #P2CubeGameSet,
	#superclass : #Object,
	#instVars : [
		'data',
		'games'
	],
	#category : #'AOC2023-Puzzle2'
}

{ #category : #accessing }
P2CubeGameSet >> data: aString [
	data := aString.
	self initializeGames
]

{ #category : #accessing }
P2CubeGameSet >> games [
	^ games
]

{ #category : #accessing }
P2CubeGameSet >> gtGamesFor: aView [
	<gtView>
	^ aView forward
		title: 'Games';
		priority: 10;
		object: self games;
		view: #gtItemsFor:
]

{ #category : #accessing }
P2CubeGameSet >> gtNeededFor: aView [
	<gtView>
	^ aView forward
		title: 'Needed';
		priority: 15;
		object: self needed;
		view: #gtItemsFor:
]

{ #category : #accessing }
P2CubeGameSet >> gtPowersFor: aView [
	<gtView>
	^ aView forward
		title: 'Powers';
		priority: 20;
		object: self powers;
		view: #gtItemsFor:
]

{ #category : #accessing }
P2CubeGameSet >> initializeGames [
	games := ((Character lf split: data) select: #notEmpty)
			collect: [ :each | P2CubeGame new data: each ]
]

{ #category : #accessing }
P2CubeGameSet >> needed [
	"Minimum needed cubes is the max of all the grab sets."

	^ self games collect: #max
]

{ #category : #accessing }
P2CubeGameSet >> possible: testCubeSet [
	^ self games select: [ :game | game possible: testCubeSet ]
]

{ #category : #accessing }
P2CubeGameSet >> powers [
	^ self needed collect: #power
]
