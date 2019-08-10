Class {
	#name : #WCOAuth2TokenModel,
	#superclass : #Object,
	#instVars : [
		'token',
		'clientId',
		'expiresAt',
		'scope',
		'data'
	],
	#category : #'WebCopper-OAuth2-Model'
}

{ #category : #accessing }
WCOAuth2TokenModel >> clientId [
	^ clientId
]

{ #category : #accessing }
WCOAuth2TokenModel >> clientId: anObject [
	clientId := anObject
]

{ #category : #accessing }
WCOAuth2TokenModel >> data [
	^ data
]

{ #category : #accessing }
WCOAuth2TokenModel >> data: anObject [
	data := anObject
]

{ #category : #accessing }
WCOAuth2TokenModel >> expiresAt [
	^ expiresAt
]

{ #category : #accessing }
WCOAuth2TokenModel >> expiresAt: anObject [
	expiresAt := anObject
]

{ #category : #accessing }
WCOAuth2TokenModel >> expiresIn: aDuration [
	expiresAt := (DateAndTime now + aDuration seconds) asUTC asString
]

{ #category : #testing }
WCOAuth2TokenModel >> isExpired [
	^ (DateAndTime fromString:  expiresAt) <= DateAndTime now
]

{ #category : #accessing }
WCOAuth2TokenModel >> scope [
	^ scope
]

{ #category : #accessing }
WCOAuth2TokenModel >> scope: anObject [
	scope := anObject
]

{ #category : #accessing }
WCOAuth2TokenModel >> token [
	^ token
]

{ #category : #accessing }
WCOAuth2TokenModel >> token: anObject [
	token := anObject
]
