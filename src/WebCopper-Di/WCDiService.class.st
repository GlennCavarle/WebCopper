Class {
	#name : #WCDiService,
	#superclass : #Object,
	#instVars : [
		'instance',
		'definition'
	],
	#category : #'WebCopper-Di-Container'
}

{ #category : #'instance creation' }
WCDiService class >> definition: aAKDiDefinition [
	^ super new
		definition: aAKDiDefinition;
		yourself
]

{ #category : #'instance creation' }
WCDiService class >> new [
	^ self shouldNotImplement
]

{ #category : #accessing }
WCDiService >> definition [
	^ definition
]

{ #category : #accessing }
WCDiService >> definition: anObject [
	definition := anObject
]

{ #category : #accessing }
WCDiService >> getOrCreateInstanceUsing: aServiceContainer [
	^ instance ifNil: [ instance := definition createInstance: aServiceContainer ]
]

{ #category : #accessing }
WCDiService >> identifier [
	^ definition identifier
]

{ #category : #accessing }
WCDiService >> instance [
	^ instance
]

{ #category : #accessing }
WCDiService >> instance: anObject [
	instance := anObject
]
