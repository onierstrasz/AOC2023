Class {
	#name : #BaselineOfAOC2023,
	#superclass : #BaselineOf,
	#category : #BaselineOfAOC2023
}

{ #category : #baseline }
BaselineOfAOC2023 >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'AOC2023'
		]
]
