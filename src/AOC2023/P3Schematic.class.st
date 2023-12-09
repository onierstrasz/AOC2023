Class {
	#name : #P3Schematic,
	#superclass : #Object,
	#instVars : [
		'data',
		'lines'
	],
	#category : #'AOC2023-Puzzle3'
}

{ #category : #accessing }
P3Schematic >> data: aString [
	data := aString.
	self initializeLines
]

{ #category : #accessing }
P3Schematic >> gtPrintFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Data';
		priority: 20;
		aptitude: BrGlamorousCodeEditorAptitude;
		text: [ data ];
		actionUpdateButton
]

{ #category : #accessing }
P3Schematic >> initializeLines [
	lines := data lines select: #notEmpty
]

{ #category : #accessing }
P3Schematic >> lines [
	^ lines
]
