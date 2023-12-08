Class {
	#name : #P3Schematic,
	#superclass : #Object,
	#instVars : [
		'data'
	],
	#category : #'AOC2023-Puzzle3'
}

{ #category : #accessing }
P3Schematic >> data: aString [
	data := aString
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
