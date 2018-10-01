Class {
	#name : #AKUserProviderManager,
	#superclass : #Object,
	#instVars : [
		'userProviders'
	],
	#category : #'Alkalin-Authentication-UserProvider'
}

{ #category : #'as yet unclassified' }
AKUserProviderManager class >> withProviders: anArray [
	^ self new
		userProviders: anArray;
		yourself
]

{ #category : #accessing }
AKUserProviderManager >> addUserProvider: aUserProvider [
	userProviders add: aUserProvider
]

{ #category : #authenticating }
AKUserProviderManager >> authenticateToken: aToken [
	| userProvider|
	userProvider := self userProviders 
		detect: [ :each | each supportsToken: aToken ] 
		ifNone: [ Error signal:('No User Provider found for token of class {1}' format: aToken className)].
		
	^ userProvider authenticateToken: aToken
]

{ #category : #initialization }
AKUserProviderManager >> initialize [
	super initialize.
	userProviders := OrderedCollection new
]

{ #category : #accessing }
AKUserProviderManager >> userProviders [
	^ userProviders
]

{ #category : #accessing }
AKUserProviderManager >> userProviders: anObject [
	userProviders := anObject
]
