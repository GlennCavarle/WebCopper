Class {
	#name : #WCCallAction,
	#superclass : #WCAction,
	#instVars : [
		'receiver',
		'selector'
	],
	#category : #'WebCopper-HttpRouter-Action'
}

{ #category : #accessing }
WCCallAction class >> call: aSelector on: aReceiver [
	^ self new
		receiver: aReceiver;
		selector: aSelector asMutator asSymbol
]

{ #category : #executing }
WCCallAction >> executeForRequest: aAKHttpRequest [
	^ receiver 
		perform: selector 
		withEnoughArguments: { aAKHttpRequest }
	
]

{ #category : #testing }
WCCallAction >> isWCCallAction [
	^ true
]

{ #category : #printing }
WCCallAction >> printOn: aStream [
	aStream
		nextPutAll: self receiver asString;
		nextPutAll: '>>';
		nextPutAll: self selector asString
]

{ #category : #accessing }
WCCallAction >> receiver [
	^ receiver
]

{ #category : #accessing }
WCCallAction >> receiver: anObject [
	receiver := anObject
]

{ #category : #accessing }
WCCallAction >> selector [
	^ selector
]

{ #category : #'private-accessing' }
WCCallAction >> selector: anObject [
	selector := anObject
]
