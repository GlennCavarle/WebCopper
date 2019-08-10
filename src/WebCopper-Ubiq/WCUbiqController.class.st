Class {
	#name : #WCUbiqController,
	#superclass : #Object,
	#instVars : [
		'commandBus',
		'queryBus'
	],
	#category : #'WebCopper-Ubiq-Http'
}

{ #category : #accessing }
WCUbiqController >> commandBus [
	^ commandBus
]

{ #category : #accessing }
WCUbiqController >> commandBus: anObject [
	commandBus := anObject
]

{ #category : #accessing }
WCUbiqController >> queryBus [
	^ queryBus
]

{ #category : #accessing }
WCUbiqController >> queryBus: anObject [
	queryBus := anObject
]
