Class {
	#name : #WCAuthenticatorBuilder,
	#superclass : #Object,
	#instVars : [
		'requestMatcher',
		'authenticatorClass',
		'configurationBlock'
	],
	#category : #'WebCopperModule-Security-Builder'
}

{ #category : #accessing }
WCAuthenticatorBuilder >> authenticatorClass [
	^ authenticatorClass ifNil: [ Error signal: 'Authenticator Class is required' ]
]

{ #category : #public }
WCAuthenticatorBuilder >> authenticatorClass: aClass [
	authenticatorClass := aClass
]

{ #category : #building }
WCAuthenticatorBuilder >> buildAuthenticator [
	| auth |
	auth := self authenticatorClass asClass new.
	self configurationBlock value: auth.
	^ auth
]

{ #category : #accessing }
WCAuthenticatorBuilder >> configurationBlock [
	^ configurationBlock ifNil: [ configurationBlock := [ :a |  ] ]
]

{ #category : #public }
WCAuthenticatorBuilder >> configure: aConfigurationBlock [
	configurationBlock := aConfigurationBlock
]

{ #category : #accessing }
WCAuthenticatorBuilder >> requestMatcher [
	^ requestMatcher ifNil: [ Error signal: 'Request Matcher is required' ]
]

{ #category : #public }
WCAuthenticatorBuilder >> requestMatcher: aRequestMatcher [
	requestMatcher := aRequestMatcher
]

{ #category : #public }
WCAuthenticatorBuilder >> urlRegex: aRegexString [
	self requestMatcher: (WCUrlMatcher fromRegex: aRegexString)
]
