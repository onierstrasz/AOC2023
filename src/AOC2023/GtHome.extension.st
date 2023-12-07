Extension { #name : #GtHome }

{ #category : #'*AOC2023' }
GtHome >> aoc2023Section [
	<gtHomeSection>
	^ GtHomeStartPageSection new 
		title: 'Advent of Code 2023';
		description: 'Advent of Code 2023';
		databaseName: 'onierstrasz/AOC2023/lepiter';
		startPageName: 'Advent of Code 2023';
		priority: 10
]
