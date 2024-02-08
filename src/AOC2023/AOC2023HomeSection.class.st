Class {
	#name : #AOC2023HomeSection,
	#superclass : #GtHomeMultiCardSection,
	#category : #'AOC2023-Sections'
}

{ #category : #accessing }
AOC2023HomeSection >> aoc2023Card [
	<gtSectionCard>
	<gtExample>
	^ GtHomeCard page 
		title: 'Advent of Code 2023';
		description: 'Advent of Code 2023';
		databaseName: 'onierstrasz/AOC2023/lepiter';
		pageName: 'Advent of Code 2023';
		priority: 10
]

{ #category : #accessing }
AOC2023HomeSection >> aoc2023Section [
	<gtHomeSection>
	^ GtHomeStartPageSection new 
		title: 'Advent of Code 2023';
		description: 'Advent of Code 2023';
		databaseName: 'onierstrasz/AOC2023/lepiter';
		startPageName: 'Advent of Code 2023';
		priority: 10
]

{ #category : #accessing }
AOC2023HomeSection >> sectionTitle [
	^ 'Advent of Code 2023'
]
