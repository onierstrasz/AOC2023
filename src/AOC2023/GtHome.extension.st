Extension { #name : #GtHome }

{ #category : #'*AOC2023' }
GtHome >> aoc2023Section [
	<gtHomeSection>
	^ GtHomeStartPageSection new 
		title: 'Avent of Code 2023';
		description: 'Avent of Code 2023';
		databaseName: 'onierstrasz/AOC2023/lepiter';
		startPageName: 'Avent of Code 2023';
		priority: 10
]

{ #category : #'*AOC2023' }
GtHome >> oscarSection [
	<gtHomeSection>
	^ GtHomeStartPageSection new 
		title: 'Oscar''s Todos';
		description: 'Oscar''s Lepiter Database';
		databaseName: 'Documents/lepiter/default';
		startPageName: 'ASAP';
		priority: 8
]
