Class {
	#name : #WCPlaceholder,
	#superclass : #Object,
	#instVars : [
		'name',
		'pattern',
		'position',
		'constraint'
	],
	#category : #'WebCopper-HttpRouter-Placeholder'
}

{ #category : #'as yet unclassified' }
WCPlaceholder class >> name: aNameString pattern: aPatternString position: aNumber constraint: aRegexString [
	^ self new
		name: aNameString asSymbol;
		pattern: aPatternString;
		position: aNumber;
		constraint: aRegexString;
		yourself
]

{ #category : #accessing }
WCPlaceholder >> constraint [
	^ constraint
]

{ #category : #accessing }
WCPlaceholder >> constraint: anObject [
	constraint := anObject
]

{ #category : #copying }
WCPlaceholder >> copyReplaceByRegexIn: aString [
	^ aString copyReplaceAll: pattern with: self constraint asRegexGroup
]

{ #category : #'as yet unclassified' }
WCPlaceholder >> findValueIn: aPathString [
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
WCPlaceholder >> name [
	^ name
]

{ #category : #accessing }
WCPlaceholder >> name: anObject [
	name := anObject
]

{ #category : #accessing }
WCPlaceholder >> pattern [
	^ pattern
]

{ #category : #accessing }
WCPlaceholder >> pattern: anObject [
	pattern := anObject
]

{ #category : #accessing }
WCPlaceholder >> position [
	^ position
]

{ #category : #accessing }
WCPlaceholder >> position: anObject [
	position := anObject
]
