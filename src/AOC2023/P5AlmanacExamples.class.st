Class {
	#name : #P5AlmanacExamples,
	#superclass : #Object,
	#category : #'AOC2023-Puzzle5'
}

{ #category : #accessing }
P5AlmanacExamples >> sampleAlmanac [
	<gtExample>
	| almanac |
	almanac := P5Almanac new data: self sampleData.
	^ almanac
]

{ #category : #accessing }
P5AlmanacExamples >> sampleAlmanacWithMaps [
	<gtExample>
	| almanac mapper |
	almanac := P5Almanac new data: self sampleData.
	mapper := almanac mapperNamed: 'seed-to-soil'.
	self assert: (mapper map: 79) equals: 81.
	self assert: (mapper map: 14) equals: 14.
	self assert: (mapper map: 55) equals: 57.
	self assert: (mapper map: 13) equals: 13.

	self
		assert: (almanac mapAll: 79)
		equals: #(79 81 81 81 74 78 78 82) asOrderedCollection.
	self
		assert: (almanac mapAll: 14)
		equals: #(14 14 53 49 42 42 43 43) asOrderedCollection.
	self
		assert: (almanac mapAll: 55)
		equals: #(55 57 57 53 46 82 82 86) asOrderedCollection.
	self
		assert: (almanac mapAll: 13)
		equals: #(13 13 52 41 34 34 35 35) asOrderedCollection.

	self assert: almanac locations equals: #(82 43 86 35).

	^ almanac
]

{ #category : #accessing }
P5AlmanacExamples >> sampleAlmanacWithSeedsExpanded [
	<gtExample>
	| almanac |
	almanac := P5Almanac new data: self sampleData.
	self assert: almanac seedsExpanded size equals: 27.
	self assert: almanac locationsExpanded min equals: 46.
	^ almanac
]

{ #category : #accessing }
P5AlmanacExamples >> sampleData [
	<gtExample>
	^ 'seeds: 79 14 55 13

seed-to-soil map:
50 98 2
52 50 48

soil-to-fertilizer map:
0 15 37
37 52 2
39 0 15

fertilizer-to-water map:
49 53 8
0 11 42
42 0 7
57 7 4

water-to-light map:
88 18 7
18 25 70

light-to-temperature map:
45 77 23
81 45 19
68 64 13

temperature-to-humidity map:
0 69 1
1 0 69

humidity-to-location map:
60 56 37
56 93 4'
]
