Class {
	#name : #P2CubeGame,
	#superclass : #Object,
	#instVars : [
		'grabs',
		'rawData',
		'name'
	],
	#category : #'AOC2023-Puzzle2'
}

{ #category : #accessing }
P2CubeGame >> data: aString [
	"We keep the raw data for the printString"
	rawData := aString.
	name := ($; split: ($: split: rawData) first).
	grabs := ($; split: ($: split: rawData) second)
			collect: [ :each | P2CubeSet new data: each ]
]

{ #category : #accessing }
P2CubeGame >> grabs [
	^ grabs
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
					copy: rawData
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
	aStream nextPutAll: rawData
]
