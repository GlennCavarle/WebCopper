Class {
	#name : #AKPlaceholder,
	#superclass : #Object,
	#instVars : [
		'name',
		'pattern',
		'position',
		'constraint'
	],
	#category : #'Alkalin-HttpRouter-Placeholder'
}

{ #category : #'as yet unclassified' }
AKPlaceholder class >> name: aNameString pattern: aPatternString position: aNumber constraint: aRegexString [
	^ self new
		name: aNameString asSymbol;
		pattern: aPatternString;
		position: aNumber;
		constraint: aRegexString;
		yourself
]

{ #category : #accessing }
AKPlaceholder >> constraint [
	^ constraint
]

{ #category : #accessing }
AKPlaceholder >> constraint: anObject [
	constraint := anObject
]

{ #category : #copying }
AKPlaceholder >> copyReplaceByRegexIn: aString [
	^ aString copyReplaceAll: pattern with: self constraint asRegexGroup
]

{ #category : #'as yet unclassified' }
AKPlaceholder >> findValueIn: aPathString [
	| stream pos val |
	stream := aPathString readStream.
	pos := 0.
	
	[ pos = position ] whileFalse: [ 
			stream atEnd ifTrue: [ Error signal: 'placeholder not found' ].
			stream next = $/ ifTrue: [ pos := pos + 1 ] ].
		
	val := String streamContents: [ :stringStream | 
		[ stream peek = $/ or: [ stream atEnd ] ] whileFalse: [ stringStream nextPut: stream next ] ].
	
	(constraint matchesTo: val) ifFalse:[ Error signal: 'value does not match constraint'  ].

 ^ constraint convertFromString: val
]

{ #category : #accessing }
AKPlaceholder >> name [
	^ name
]

{ #category : #accessing }
AKPlaceholder >> name: anObject [
	name := anObject
]

{ #category : #accessing }
AKPlaceholder >> pattern [
	^ pattern
]

{ #category : #accessing }
AKPlaceholder >> pattern: anObject [
	pattern := anObject
]

{ #category : #accessing }
AKPlaceholder >> position [
	^ position
]

{ #category : #accessing }
AKPlaceholder >> position: anObject [
	position := anObject
]
