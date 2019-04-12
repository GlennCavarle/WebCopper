"
Manages several user providers
"
Class {
	#name : #AKAuthProviderManager,
	#superclass : #Object,
	#instVars : [
		'authProviders'
	],
	#category : #'Alkalin-Authentication-Provider'
}

{ #category : #'as yet unclassified' }
AKAuthProviderManager class >> withProviders: anArray [
	^ self new
		authProviders: anArray;
		yourself
]

{ #category : #accessing }
AKAuthProviderManager >> addAuthProvider: anAuthProvider [
	authProviders add: anAuthProvider
]

{ #category : #accessing }
AKAuthProviderManager >> authProviders [
	^ authProviders
]

{ #category : #accessing }
AKAuthProviderManager >> authProviders: anObject [
	authProviders := anObject
]

{ #category : #authenticating }
AKAuthProviderManager >> authenticateToken: aToken [
	| authProvider|
	authProvider := self authProviders 
		detect: [ :each | each supportsToken: aToken ] 
		ifNone: [ Error signal:('No Auth Provider found for token of class {1}' format: aToken className)].
		
	^ authProvider authenticateToken: aToken
]

{ #category : #initialization }
AKAuthProviderManager >> initialize [
	super initialize.
	authProviders := OrderedCollection new
]
