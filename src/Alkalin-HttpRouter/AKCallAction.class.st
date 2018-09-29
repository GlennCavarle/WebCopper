Class {
	#name : #AKCallAction,
	#superclass : #AKAction,
	#instVars : [
		'receiver',
		'selector'
	],
	#category : #'Alkalin-HttpRouter-Action'
}

{ #category : #accessing }
AKCallAction class >> call: aSelector on: aReceiver [
	^ self new
		receiver: aReceiver;
		selector: aSelector asMutator asSymbol
]

{ #category : #executing }
AKCallAction >> executeForRequest: aAKHttpRequest [
	^ receiver 
		perform: selector 
		withEnoughArguments: { aAKHttpRequest }
	
]

{ #category : #testing }
AKCallAction >> isAKCallAction [
	^ true
]

{ #category : #printing }
AKCallAction >> printOn: aStream [
	aStream
		nextPutAll: self receiver asString;
		nextPutAll: '>>';
		nextPutAll: self selector asString
]

{ #category : #accessing }
AKCallAction >> receiver [
	^ receiver
]

{ #category : #accessing }
AKCallAction >> receiver: anObject [
	receiver := anObject
]

{ #category : #accessing }
AKCallAction >> selector [
	^ selector
]

{ #category : #'private-accessing' }
AKCallAction >> selector: anObject [
	selector := anObject
]
