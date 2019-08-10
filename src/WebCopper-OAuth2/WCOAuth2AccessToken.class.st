Class {
	#name : #WCOAuth2AccessToken,
	#superclass : #Object,
	#instVars : [
		'accessToken',
		'refreshToken',
		'expiresIn',
		'tokenType',
		'scope'
	],
	#category : #'WebCopper-OAuth2-Service'
}

{ #category : #accessing }
WCOAuth2AccessToken >> accessToken [
	^ accessToken
]

{ #category : #accessing }
WCOAuth2AccessToken >> accessToken: anObject [
	accessToken := anObject
]

{ #category : #accessing }
WCOAuth2AccessToken >> expiresIn [
	^ expiresIn
]

{ #category : #accessing }
WCOAuth2AccessToken >> expiresIn: anObject [
	expiresIn := anObject
]

{ #category : #accessing }
WCOAuth2AccessToken >> refreshToken [
	^ refreshToken
]

{ #category : #accessing }
WCOAuth2AccessToken >> refreshToken: anObject [
	refreshToken := anObject
]

{ #category : #accessing }
WCOAuth2AccessToken >> scope [
	^ scope
]

{ #category : #accessing }
WCOAuth2AccessToken >> scope: anObject [
	scope := anObject
]

{ #category : #accessing }
WCOAuth2AccessToken >> tokenType [
	^ tokenType
]

{ #category : #accessing }
WCOAuth2AccessToken >> tokenType: anObject [
	tokenType := anObject
]
