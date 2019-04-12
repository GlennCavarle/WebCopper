Class {
	#name : #AKOAuth2TokenModel,
	#superclass : #Object,
	#instVars : [
		'token',
		'clientId',
		'expiresAt',
		'scope',
		'data'
	],
	#category : #'Alkalin-OAuth2-Model'
}

{ #category : #accessing }
AKOAuth2TokenModel >> clientId [
	^ clientId
]

{ #category : #accessing }
AKOAuth2TokenModel >> clientId: anObject [
	clientId := anObject
]

{ #category : #accessing }
AKOAuth2TokenModel >> data [
	^ data
]

{ #category : #accessing }
AKOAuth2TokenModel >> data: anObject [
	data := anObject
]

{ #category : #accessing }
AKOAuth2TokenModel >> expiresAt [
	^ expiresAt
]

{ #category : #accessing }
AKOAuth2TokenModel >> expiresAt: anObject [
	expiresAt := anObject
]

{ #category : #accessing }
AKOAuth2TokenModel >> expiresIn: aDuration [
	expiresAt := (DateAndTime now + aDuration seconds) asUTC asString
]

{ #category : #testing }
AKOAuth2TokenModel >> isExpired [
	^ (DateAndTime fromString:  expiresAt) <= DateAndTime now
]

{ #category : #accessing }
AKOAuth2TokenModel >> scope [
	^ scope
]

{ #category : #accessing }
AKOAuth2TokenModel >> scope: anObject [
	scope := anObject
]

{ #category : #accessing }
AKOAuth2TokenModel >> token [
	^ token
]

{ #category : #accessing }
AKOAuth2TokenModel >> token: anObject [
	token := anObject
]
