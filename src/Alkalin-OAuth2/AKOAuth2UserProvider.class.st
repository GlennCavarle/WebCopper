Class {
	#name : #AKOAuth2UserProvider,
	#superclass : #AKAbstractUserProvider,
	#instVars : [
		'storage'
	],
	#category : #'Alkalin-OAuth2-UserProvider'
}

{ #category : #authenticating }
AKOAuth2UserProvider >> authenticateToken: aToken [
	| accessToken |
	accessToken := storage accessTokenFromAuthToken: aToken.
	accessToken ifNil: [ AKOAuthUnauthorized signal: 'The access token provided is invalid' ].
	accessToken isExpired ifTrue: [ AKOAuthUnauthorized signal: 'The access token provided has expired' ].
	"@todo scope management"
	
	^ aToken 
		user:accessToken user;
		clearCredentials;
		beAuthenticated;
		yourself
]

{ #category : #accessing }
AKOAuth2UserProvider >> storage [
	^ storage
]

{ #category : #accessing }
AKOAuth2UserProvider >> storage: anObject [
	storage := anObject
]

{ #category : #testing }
AKOAuth2UserProvider >> supportsToken: aToken [
	^ aToken isKindOf: AKOAuth2Token 
]
