Class {
	#name : #AKOAuth2AccessToken,
	#superclass : #Object,
	#instVars : [
		'accessToken',
		'refreshToken',
		'expiresIn',
		'tokenType',
		'scope'
	],
	#category : #'Alkalin-OAuth2-Service'
}

{ #category : #accessing }
AKOAuth2AccessToken >> accessToken [
	^ accessToken
]

{ #category : #accessing }
AKOAuth2AccessToken >> accessToken: anObject [
	accessToken := anObject
]

{ #category : #accessing }
AKOAuth2AccessToken >> expiresIn [
	^ expiresIn
]

{ #category : #accessing }
AKOAuth2AccessToken >> expiresIn: anObject [
	expiresIn := anObject
]

{ #category : #accessing }
AKOAuth2AccessToken >> refreshToken [
	^ refreshToken
]

{ #category : #accessing }
AKOAuth2AccessToken >> refreshToken: anObject [
	refreshToken := anObject
]

{ #category : #accessing }
AKOAuth2AccessToken >> scope [
	^ scope
]

{ #category : #accessing }
AKOAuth2AccessToken >> scope: anObject [
	scope := anObject
]

{ #category : #accessing }
AKOAuth2AccessToken >> tokenType [
	^ tokenType
]

{ #category : #accessing }
AKOAuth2AccessToken >> tokenType: anObject [
	tokenType := anObject
]
