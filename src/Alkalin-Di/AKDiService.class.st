Class {
	#name : #AKDiService,
	#superclass : #Object,
	#instVars : [
		'instance',
		'definition'
	],
	#category : #'Alkalin-Di-Container'
}

{ #category : #'instance creation' }
AKDiService class >> definition: aAKDiDefinition [
	^ super new
		definition: aAKDiDefinition;
		yourself
]

{ #category : #'instance creation' }
AKDiService class >> new [
	^ self shouldNotImplement
]

{ #category : #accessing }
AKDiService >> definition [
	^ definition
]

{ #category : #accessing }
AKDiService >> definition: anObject [
	definition := anObject
]

{ #category : #accessing }
AKDiService >> getOrCreateInstanceUsing: aServiceContainer [
	^ instance ifNil: [ instance := definition createInstance: aServiceContainer ]
]

{ #category : #accessing }
AKDiService >> identifier [
	^ definition identifier
]

{ #category : #accessing }
AKDiService >> instance [
	^ instance
]

{ #category : #accessing }
AKDiService >> instance: anObject [
	instance := anObject
]
