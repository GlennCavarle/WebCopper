Class {
	#name : #AKOAuth2GrantToken,
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
AKOAuth2GrantToken >> accessToken [
	^ accessToken
]

{ #category : #accessing }
AKOAuth2GrantToken >> accessToken: anObject [
	accessToken := anObject
]

{ #category : #accessing }
AKOAuth2GrantToken >> expiresIn [
	^ expiresIn
]

{ #category : #accessing }
AKOAuth2GrantToken >> expiresIn: anObject [
	expiresIn := anObject
]

{ #category : #accessing }
AKOAuth2GrantToken >> refreshToken [
	^ refreshToken
]

{ #category : #accessing }
AKOAuth2GrantToken >> refreshToken: anObject [
	refreshToken := anObject
]

{ #category : #accessing }
AKOAuth2GrantToken >> scope [
	^ scope
]

{ #category : #accessing }
AKOAuth2GrantToken >> scope: anObject [
	scope := anObject
]

{ #category : #accessing }
AKOAuth2GrantToken >> tokenType [
	^ tokenType
]

{ #category : #accessing }
AKOAuth2GrantToken >> tokenType: anObject [
	tokenType := anObject
]
