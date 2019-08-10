"
Maps url patterns to authenticator.
Defines routes which needs authentidaction.
"
Class {
	#name : #WCAuthenticatorMap,
	#superclass : #Object,
	#instVars : [
		'authenticators'
	],
	#category : #'WebCopper-Authentication-Authenticator'
}

{ #category : #initialization }
WCAuthenticatorMap >> authenticateRequest: anHttpRequest [
	authenticators 
		detect: [:eachAssoc|  eachAssoc key matchRequest: anHttpRequest]
		ifFound: [:eachAssoc| ^ eachAssoc value authenticateRequest: anHttpRequest ] 
]

{ #category : #initialization }
WCAuthenticatorMap >> initialize [
	super initialize.
	authenticators := OrderedCollection new.
]

{ #category : #initialization }
WCAuthenticatorMap >> map: aRequestMatcher to: anAuthenticator [
	authenticators add: aRequestMatcher -> anAuthenticator
]

{ #category : #initialization }
WCAuthenticatorMap >> needsAuthentication: anHttpRequest [
	^ authenticators anySatisfy: [ :eachAssoc | eachAssoc key matchRequest: anHttpRequest ]
]
