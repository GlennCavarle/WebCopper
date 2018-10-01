Class {
	#name : #AKHttpRequest,
	#superclass : #ZnRequest,
	#instVars : [
		'unprefixedPath',
		'matchedPrefixes',
		'attributes'
	],
	#category : #'Alkalin-HttpMessage-Request'
}

{ #category : #operations }
AKHttpRequest class >> post: anUrlObject data: anObject [
	^ (self post: anUrlObject)
		entity: (ZnApplicationFormUrlEncodedEntity withAll: anObject asDictionary);
		yourself
]

{ #category : #'accessing-attributes' }
AKHttpRequest >> addAllAttributes: aDictionary [
	self attributes addAll: aDictionary
]

{ #category : #'accessing-attributes' }
AKHttpRequest >> attributeAt: aKey [
	^ self attributeAt: aKey ifAbsent: [ AKRequestAttrNotFound signalForAttr: aKey ]
]

{ #category : #'accessing-attributes' }
AKHttpRequest >> attributeAt: aKey ifAbsent: aBlock [
	^ self attributes at: aKey ifAbsent: aBlock
]

{ #category : #'accessing-attributes' }
AKHttpRequest >> attributeAt: aKey put: anObjet [
	^ self attributes at: aKey put: anObjet
]

{ #category : #'accessing-attributes' }
AKHttpRequest >> attributes [
	^ attributes ifNil: [ attributes := Dictionary new ]
]

{ #category : #'accessing-parameters' }
AKHttpRequest >> body [
	^ self entity fields
]

{ #category : #'accessing-parameters' }
AKHttpRequest >> bodyAt: aKey [
	^ self bodyAt: aKey ifAbsent: [ AKRequestParamNotFound signalForParam: aKey ]
]

{ #category : #'accessing-parameters' }
AKHttpRequest >> bodyAt: aKey ifAbsent: aBlock [
	^ self entity at: aKey ifAbsent: aBlock
]

{ #category : #accessing }
AKHttpRequest >> headers [
	headers isNil ifTrue: [ self headers: ZnHeaders new ].
	^ headers
]

{ #category : #accessing }
AKHttpRequest >> headers: object [
	headers := object.
	self setDefaultHeaders
]

{ #category : #'unprefixed path' }
AKHttpRequest >> matchedPrefixes [
	^ matchedPrefixes ifNil: [ matchedPrefixes := Stack new ]
]

{ #category : #accessing }
AKHttpRequest >> paramAt: aKey [
	^ self paramAt: aKey ifAbsent: [ AKRequestParamNotFound signalForParam: aKey ]
]

{ #category : #accessing }
AKHttpRequest >> paramAt: aKey ifAbsent: aBlock [
	^ self attributeAt: aKey ifAbsent: [ 
		self queryAt: aKey ifAbsent: [
			self bodyAt: aKey ifAbsent: aBlock ] ]
]

{ #category : #accessing }
AKHttpRequest >> params [
	| fields |
	fields := ZnMultiValueDictionary new.
	self attributes isNotEmpty
		ifTrue: [ fields addAllMulti: self attributes ].
	self uri hasQuery
		ifTrue: [ fields addAllMulti: self query ].
	( self hasEntity )
		ifTrue: [ fields addAllMulti: self entity fields ].
	^ fields
]

{ #category : #'unprefixed path' }
AKHttpRequest >> popPrefix [
	| lastPrefix |
	lastPrefix := self matchedPrefixes pop.
	unprefixedPath := lastPrefix , self unprefixedPath
]

{ #category : #'unprefixed path' }
AKHttpRequest >> pushPrefix: aString [
	(self unprefixedPath isEmptyOrBeginsWith: aString)
		ifFalse:[AKInvalidPathPrefix signalForPrefix: aString inRequest: self].
	
	self matchedPrefixes push: aString.
	unprefixedPath := self unprefixedPath allButFirst: aString size
]

{ #category : #'accessing-parameters' }
AKHttpRequest >> query [
	^ self uri query
]

{ #category : #'accessing-parameters' }
AKHttpRequest >> queryAt: aKey [
	^ self queryAt: aKey ifAbsent: [ AKRequestParamNotFound signalForParam: aKey ]
]

{ #category : #'accessing-parameters' }
AKHttpRequest >> queryAt: aKey ifAbsent: aBlock [
	^ self uri queryAt: aKey ifAbsent: aBlock
]

{ #category : #'accessing-parameters' }
AKHttpRequest >> queryParameters [
	^ self uri query
]

{ #category : #accessing }
AKHttpRequest >> setDefaultHeaders [
]

{ #category : #'unprefixed path' }
AKHttpRequest >> unprefixedPath [
	^ unprefixedPath ifNil: [ unprefixedPath := String streamContents: [ :stream | self url printPathQueryFragmentOn: stream ] ]
]

{ #category : #'unprefixed path' }
AKHttpRequest >> withPrefix: aString do: aBlock [
	self pushPrefix: aString.
	^ aBlock ensure: [ self popPrefix ]
]
