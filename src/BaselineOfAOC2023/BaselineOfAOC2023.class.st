Class {
	#name : #BaselineOfAOC2023,
	#superclass : #BaselineOf,
	#category : #BaselineOfAOC2023
}

{ #category : #accessing }
BaselineOfAOC2023 class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'AOC2023' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfAOC2023 >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'AOC2023'
		]
]
