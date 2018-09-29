Class {
	#name : #AKUbiqController,
	#superclass : #Object,
	#instVars : [
		'commandBus',
		'queryBus'
	],
	#category : #'Alkalin-Ubiq-Http'
}

{ #category : #accessing }
AKUbiqController >> commandBus [
	^ commandBus
]

{ #category : #accessing }
AKUbiqController >> commandBus: anObject [
	commandBus := anObject
]

{ #category : #accessing }
AKUbiqController >> queryBus [
	^ queryBus
]

{ #category : #accessing }
AKUbiqController >> queryBus: anObject [
	queryBus := anObject
]
