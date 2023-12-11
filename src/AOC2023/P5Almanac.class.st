Class {
	#name : #P5Almanac,
	#superclass : #Object,
	#instVars : [
		'seeds',
		'mappers'
	],
	#category : #'AOC2023-Puzzle5'
}

{ #category : #accessing }
P5Almanac >> data: aString [
	| mapper |
	seeds := (aString lines first removePrefix: 'seeds: ') substrings
			collect: #asNumber.
	aString lines allButFirst
		do: [ :line | 
			line
				ifEmpty: [ mapper := P5Mapper new.
					mappers addLast: mapper ]
				ifNotEmpty: [ line first isDigit
						ifTrue: [ mapper addMap: line ]
						ifFalse: [ mapper name: line ] ] ]
]

{ #category : #accessing }
P5Almanac >> gtMappersFor: aView [
	<gtView>
	^ aView forward
		title: 'Mappers';
		priority: 10;
		object: [ mappers ];
		view: #gtItemsFor:
]

{ #category : #accessing }
P5Almanac >> initialize [
	seeds := OrderedCollection new.
	mappers := OrderedCollection new
]

{ #category : #accessing }
P5Almanac >> locationOf: aSeed [
	^ (self mapAll: aSeed) last
]

{ #category : #accessing }
P5Almanac >> locations [
	^ self seeds collect: [ :seed | self locationOf: seed ]
]

{ #category : #accessing }
P5Almanac >> mapAll: aSeed [
	| current output |
	current := aSeed.
	output := {current} asOrderedCollection.
	mappers
		do: [ :mapper | 
			current := mapper map: current.
			output addLast: current ].
	^ output
]

{ #category : #accessing }
P5Almanac >> mapperNamed: aString [
	^ mappers detect: [ :mapper | mapper name = aString ]
]

{ #category : #accessing }
P5Almanac >> seeds [
	^ seeds
]
