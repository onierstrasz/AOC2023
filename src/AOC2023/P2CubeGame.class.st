Class {
	#name : #P2CubeGame,
	#superclass : #Object,
	#instVars : [
		'data',
		'grabs'
	],
	#category : #'AOC2023-Puzzle2'
}

{ #category : #accessing }
P2CubeGame >> data: aString [
	data := aString
]

{ #category : #accessing }
P2CubeGame >> grabs [
	^ grabs
		ifNil: [ grabs := ($; split: ($: split: data) second)
					collect: [ :each | P2CubeSet new data: each ] ]
]

{ #category : #accessing }
P2CubeGame >> gtGrabsFor: aView [
	<gtView>
	^ aView forward
		title: 'Grabs';
		priority: 10;
		object: self grabs;
		view: #gtItemsFor:
]

{ #category : #accessing }
P2CubeGame >> id [
	| regex id |
	^ id
		ifNil: [ regex := 'Game ([0-9]+)\:.*' asRegex.
			id := (regex
					copy: data
					translatingMatchesUsing: [ :each | regex subexpression: 2 ]) asNumber ]
]

{ #category : #accessing }
P2CubeGame >> max [
	^ self grabs inject: P2CubeSet new into: [ :max :each | max max: each ]
]

{ #category : #accessing }
P2CubeGame >> possible: aCubeSet [
	^ self max < aCubeSet
]

{ #category : #accessing }
P2CubeGame >> printOn: aStream [
	aStream nextPutAll: data
]
