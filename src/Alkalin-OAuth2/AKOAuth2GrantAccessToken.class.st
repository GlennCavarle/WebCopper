Class {
	#name : #AKOAuth2GrantAccessToken,
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
AKOAuth2GrantAccessToken >> accessToken [
	^ accessToken
]

{ #category : #accessing }
AKOAuth2GrantAccessToken >> accessToken: anObject [
	accessToken := anObject
]

{ #category : #accessing }
AKOAuth2GrantAccessToken >> expiresIn [
	^ expiresIn
]

{ #category : #accessing }
AKOAuth2GrantAccessToken >> expiresIn: anObject [
	expiresIn := anObject
]

{ #category : #accessing }
AKOAuth2GrantAccessToken >> refreshToken [
	^ refreshToken
]

{ #category : #accessing }
AKOAuth2GrantAccessToken >> refreshToken: anObject [
	refreshToken := anObject
]

{ #category : #accessing }
AKOAuth2GrantAccessToken >> scope [
	^ scope
]

{ #category : #accessing }
AKOAuth2GrantAccessToken >> scope: anObject [
	scope := anObject
]

{ #category : #accessing }
AKOAuth2GrantAccessToken >> tokenType [
	^ tokenType
]

{ #category : #accessing }
AKOAuth2GrantAccessToken >> tokenType: anObject [
	tokenType := anObject
]
