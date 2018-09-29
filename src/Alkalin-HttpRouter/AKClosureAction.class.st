Class {
	#name : #AKClosureAction,
	#superclass : #AKAction,
	#instVars : [
		'actionBlock'
	],
	#category : #'Alkalin-HttpRouter-Action'
}

{ #category : #enumerating }
AKClosureAction class >> do: aBlock [
	self
		assert: [ aBlock isBlock ]
		description: [ 'Argument must be a BlockClosure' ].
		
	^ self new
		actionBlock: aBlock;
		yourself
]

{ #category : #accessing }
AKClosureAction >> actionBlock [
	^ actionBlock
]

{ #category : #'private - accessing' }
AKClosureAction >> actionBlock: anObject [
	actionBlock := anObject
]

{ #category : #executing }
AKClosureAction >> executeForRequest: aAKRequest [
	^ actionBlock cull: aAKRequest
	
]

{ #category : #printing }
AKClosureAction >> printOn: aStream [
	aStream
		nextPutAll: self actionBlock asString
]
