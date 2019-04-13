Class {
	#name : #AKOAuth2Provider,
	#superclass : #AKAbstractAuthProvider,
	#instVars : [
		'authService'
	],
	#category : #'Alkalin-OAuth2-UserProvider'
}

{ #category : #accessing }
AKOAuth2Provider class >> authService: anOAuthServer [
	^ self new
		authService: anOAuthServer;
		yourself
]

{ #category : #accessing }
AKOAuth2Provider >> authService [
	^ authService
]

{ #category : #accessing }
AKOAuth2Provider >> authService: anObject [
	authService := anObject
]

{ #category : #authenticating }
AKOAuth2Provider >> authenticateToken: anOAuthToken [
	| accessToken|
	accessToken := self authService verifyAccessToken: anOAuthToken token.
	
	"@todo scope management"

	^ anOAuthToken 
		user: accessToken data;
		clearCredentials;
		beAuthenticated;
		yourself
]

{ #category : #testing }
AKOAuth2Provider >> supportsToken: aToken [
	^ aToken isKindOf: AKOAuth2Token 
]
