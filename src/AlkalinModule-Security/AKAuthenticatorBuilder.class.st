Class {
	#name : #AKAuthenticatorBuilder,
	#superclass : #Object,
	#instVars : [
		'requestMatcher',
		'authenticatorClass',
		'configurationBlock'
	],
	#category : #'AlkalinModule-Security-Builder'
}

{ #category : #accessing }
AKAuthenticatorBuilder >> authenticatorClass [
	^ authenticatorClass ifNil: [ Error signal: 'Authenticator Class is required' ]
]

{ #category : #public }
AKAuthenticatorBuilder >> authenticatorClass: aClass [
	authenticatorClass := aClass
]

{ #category : #building }
AKAuthenticatorBuilder >> buildAuthenticator [
	| auth |
	auth := self authenticatorClass asClass new.
	self configurationBlock value: auth.
	^ auth
]

{ #category : #accessing }
AKAuthenticatorBuilder >> configurationBlock [
	^ configurationBlock ifNil: [ configurationBlock := [ :a |  ] ]
]

{ #category : #public }
AKAuthenticatorBuilder >> configure: aConfigurationBlock [
	configurationBlock := aConfigurationBlock
]

{ #category : #accessing }
AKAuthenticatorBuilder >> requestMatcher [
	^ requestMatcher ifNil: [ Error signal: 'Request Matcher is required' ]
]

{ #category : #public }
AKAuthenticatorBuilder >> requestMatcher: aRequestMatcher [
	requestMatcher := aRequestMatcher
]

{ #category : #public }
AKAuthenticatorBuilder >> urlRegex: aRegexString [
	self requestMatcher: (AKUrlMatcher fromRegex: aRegexString)
]
