"
Manages several user providers
"
Class {
	#name : #WCAuthProviderManager,
	#superclass : #Object,
	#instVars : [
		'authProviders'
	],
	#category : #'WebCopper-Authentication-Provider'
}

{ #category : #'as yet unclassified' }
WCAuthProviderManager class >> withProviders: anArray [
	^ self new
		authProviders: anArray;
		yourself
]

{ #category : #accessing }
WCAuthProviderManager >> addAuthProvider: anAuthProvider [
	authProviders add: anAuthProvider
]

{ #category : #accessing }
WCAuthProviderManager >> authProviders [
	^ authProviders
]

{ #category : #accessing }
WCAuthProviderManager >> authProviders: anObject [
	authProviders := anObject
]

{ #category : #authenticating }
WCAuthProviderManager >> authenticateToken: aToken [
	| authProvider|
	authProvider := self authProviders 
		detect: [ :each | each supportsToken: aToken ] 
		ifNone: [ Error signal:('No Auth Provider found for token of class {1}' format: aToken className)].
		
	^ authProvider authenticateToken: aToken
]

{ #category : #initialization }
WCAuthProviderManager >> initialize [
	super initialize.
	authProviders := OrderedCollection new
]
