Class {
	#name : #WCClosureAction,
	#superclass : #WCAction,
	#instVars : [
		'actionBlock'
	],
	#category : #'WebCopper-HttpRouter-Action'
}

{ #category : #enumerating }
WCClosureAction class >> do: aBlock [
	self
		assert: [ aBlock isBlock ]
		description: [ 'Argument must be a BlockClosure' ].
		
	^ self new
		actionBlock: aBlock;
		yourself
]

{ #category : #accessing }
WCClosureAction >> actionBlock [
	^ actionBlock
]

{ #category : #'private - accessing' }
WCClosureAction >> actionBlock: anObject [
	actionBlock := anObject
]

{ #category : #executing }
WCClosureAction >> executeForRequest: aAKRequest [
	^ actionBlock cull: aAKRequest
	
]

{ #category : #printing }
WCClosureAction >> printOn: aStream [
	aStream
		nextPutAll: self actionBlock asString
]
