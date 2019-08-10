Class {
	#name : #WCOAuth2Provider,
	#superclass : #WCAbstractAuthProvider,
	#instVars : [
		'authService'
	],
	#category : #'WebCopper-OAuth2-UserProvider'
}

{ #category : #accessing }
WCOAuth2Provider class >> authService: anOAuthServer [
	^ self new
		authService: anOAuthServer;
		yourself
]

{ #category : #accessing }
WCOAuth2Provider >> authService [
	^ authService
]

{ #category : #accessing }
WCOAuth2Provider >> authService: anObject [
	authService := anObject
]

{ #category : #authenticating }
WCOAuth2Provider >> authenticateToken: anOAuthToken [
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
WCOAuth2Provider >> supportsToken: aToken [
	^ aToken isKindOf: WCOAuth2Token 
]
