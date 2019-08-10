Class {
	#name : #WCHttpRequest,
	#superclass : #ZnRequest,
	#instVars : [
		'unprefixedPath',
		'matchedPrefixes',
		'attributes'
	],
	#category : #'WebCopper-HttpMessage-Request'
}

{ #category : #operations }
WCHttpRequest class >> post: anUrlObject data: anObject [
	^ (self post: anUrlObject)
		entity: (ZnApplicationFormUrlEncodedEntity withAll: anObject asDictionary);
		yourself
]

{ #category : #'accessing-attributes' }
WCHttpRequest >> addAllAttributes: aDictionary [
	self attributes addAll: aDictionary
]

{ #category : #'accessing-attributes' }
WCHttpRequest >> attributeAt: aKey [
	^ self attributeAt: aKey ifAbsent: [ WCRequestAttrNotFound signalForAttr: aKey ]
]

{ #category : #'accessing-attributes' }
WCHttpRequest >> attributeAt: aKey ifAbsent: aBlock [
	^ self attributes at: aKey ifAbsent: aBlock
]

{ #category : #'accessing-attributes' }
WCHttpRequest >> attributeAt: aKey put: anObjet [
	^ self attributes at: aKey put: anObjet
]

{ #category : #'accessing-attributes' }
WCHttpRequest >> attributes [
	^ attributes ifNil: [ attributes := Dictionary new ]
]

{ #category : #'accessing-parameters' }
WCHttpRequest >> body [
	^ self entity fields
]

{ #category : #'accessing-parameters' }
WCHttpRequest >> bodyAt: aKey [
	^ self bodyAt: aKey ifAbsent: [ WCRequestParamNotFound signalForParam: aKey ]
]

{ #category : #'accessing-parameters' }
WCHttpRequest >> bodyAt: aKey ifAbsent: aBlock [
	^ self entity at: aKey ifAbsent: aBlock
]

{ #category : #accessing }
WCHttpRequest >> headers [
	headers isNil ifTrue: [ self headers: ZnHeaders new ].
	^ headers
]

{ #category : #accessing }
WCHttpRequest >> headers: object [
	headers := object.
	self setDefaultHeaders
]

{ #category : #'unprefixed path' }
WCHttpRequest >> matchedPrefixes [
	^ matchedPrefixes ifNil: [ matchedPrefixes := Stack new ]
]

{ #category : #accessing }
WCHttpRequest >> paramAt: aKey [
	^ self paramAt: aKey ifAbsent: [ WCRequestParamNotFound signalForParam: aKey ]
]

{ #category : #accessing }
WCHttpRequest >> paramAt: aKey ifAbsent: aBlock [
	^ self attributeAt: aKey ifAbsent: [ 
		self queryAt: aKey ifAbsent: [
			self bodyAt: aKey ifAbsent: aBlock ] ]
]

{ #category : #accessing }
WCHttpRequest >> params [
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
WCHttpRequest >> popPrefix [
	| lastPrefix |
	lastPrefix := self matchedPrefixes pop.
	unprefixedPath := lastPrefix , self unprefixedPath
]

{ #category : #'unprefixed path' }
WCHttpRequest >> pushPrefix: aString [
	(self unprefixedPath isEmptyOrBeginsWith: aString)
		ifFalse:[WCInvalidPathPrefix signalForPrefix: aString inRequest: self].
	
	self matchedPrefixes push: aString.
	unprefixedPath := self unprefixedPath allButFirst: aString size
]

{ #category : #'accessing-parameters' }
WCHttpRequest >> query [
	^ self uri query
]

{ #category : #'accessing-parameters' }
WCHttpRequest >> queryAt: aKey [
	^ self queryAt: aKey ifAbsent: [ WCRequestParamNotFound signalForParam: aKey ]
]

{ #category : #'accessing-parameters' }
WCHttpRequest >> queryAt: aKey ifAbsent: aBlock [
	^ self uri queryAt: aKey ifAbsent: aBlock
]

{ #category : #'accessing-parameters' }
WCHttpRequest >> queryParameters [
	^ self uri query
]

{ #category : #accessing }
WCHttpRequest >> setDefaultHeaders [
]

{ #category : #'unprefixed path' }
WCHttpRequest >> unprefixedPath [
	^ unprefixedPath ifNil: [ unprefixedPath := String streamContents: [ :stream | self url printPathQueryFragmentOn: stream ] ]
]

{ #category : #'unprefixed path' }
WCHttpRequest >> withPrefix: aString do: aBlock [
	self pushPrefix: aString.
	^ aBlock ensure: [ self popPrefix ]
]
