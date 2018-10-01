Class {
	#name : #AKAuthenticatorMap,
	#superclass : #Object,
	#instVars : [
		'authenticators'
	],
	#category : #'Alkalin-Authentication-Authenticator'
}

{ #category : #initialization }
AKAuthenticatorMap >> authenticateRequest: anHttpRequest [
	authenticators 
		detect: [:eachAssoc|  eachAssoc key matchRequest: anHttpRequest]
		ifFound: [:eachAssoc| ^ eachAssoc value authenticateRequest: anHttpRequest ] 
]

{ #category : #initialization }
AKAuthenticatorMap >> initialize [
	super initialize.
	authenticators := OrderedCollection new.
]

{ #category : #initialization }
AKAuthenticatorMap >> map: aRequestMatcher to: anAuthenticator [
	authenticators add: aRequestMatcher -> anAuthenticator
]

{ #category : #initialization }
AKAuthenticatorMap >> needsAuthentication: anHttpRequest [
	^ authenticators anySatisfy: [ :eachAssoc | eachAssoc key matchRequest: anHttpRequest ]
]
