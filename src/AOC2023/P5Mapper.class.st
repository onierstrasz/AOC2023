Class {
	#name : #P5Mapper,
	#superclass : #Object,
	#instVars : [
		'name',
		'maps'
	],
	#category : #'AOC2023-Puzzle5'
}

{ #category : #accessing }
P5Mapper >> addMap: aString [
	maps addLast: (aString substrings collect: #asNumber)
]

{ #category : #accessing }
P5Mapper >> gtMapsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Maps';
		priority: 10;
		items: [ maps ];
		actionUpdateButtonTooltip: 'Update item list';
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Destination'
			text: [ :eachItem | eachItem first ]
			width: 80;
		column: 'Source'
			text: [ :eachItem | eachItem second ]
			width: 80;
		column: 'Range'
			text: [ :eachItem | eachItem third ]
			width: 80
]

{ #category : #accessing }
P5Mapper >> initialize [
	name := ''.
	maps := OrderedCollection new
]

{ #category : #accessing }
P5Mapper >> map: aNumber [
	| destination source delta |
	maps
		do: [ :map | 
			destination := map first.
			source := map second.
			delta := map third.
			(aNumber >= source and: [ aNumber <= (source + delta) ])
				ifTrue: [ ^ aNumber - source + destination ] ].
	^ aNumber
]

{ #category : #accessing }
P5Mapper >> name [
	^ name
]

{ #category : #accessing }
P5Mapper >> name: aString [
	name := aString removeSuffix: ' map:'
]

{ #category : #accessing }
P5Mapper >> printOn: aStream [
	aStream nextPutAll: name
]
