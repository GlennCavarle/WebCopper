Class {
	#name : #WCOAuth2Authenticator,
	#superclass : #WCAbstractAuthenticator,
	#instVars : [
		'authService'
	],
	#category : #'WebCopper-OAuth2-Authenticator'
}

{ #category : #accessing }
WCOAuth2Authenticator class >> authService: anOAuthServer [
	^ self new
		authService: anOAuthServer;
		yourself
]

{ #category : #accessing }
WCOAuth2Authenticator >> authService [
	^ authService
]

{ #category : #accessing }
WCOAuth2Authenticator >> authService: anObject [
	authService := anObject
]

{ #category : #authenticating }
WCOAuth2Authenticator >> authenticateRequest: anHttpRequest [
	| oAuthToken |
	[
		oAuthToken := self authService extractBearerTokenFromRequest: anHttpRequest.
		oAuthToken := self authProviderManager authenticateToken: oAuthToken
	] on:WCException do:[:ex| ^ self challengeClient: ex].

	^ WCAuthResult successWithToken: oAuthToken
]

{ #category : #authenticating }
WCOAuth2Authenticator >> bearerHeader [
	^ 'Bearer realm="' , self realm , '"'
]

{ #category : #authenticating }
WCOAuth2Authenticator >> challengeClient: anException [
	<return: #WCAuthResult>
	| response |
	response := WCHttpResponse
		unauthorized: self bearerHeader
		entity: (ZnEntity textCRLF: anException messageText).
		
	^ WCAuthResult failureWithResponse: response
]

{ #category : #authenticating }
WCOAuth2Authenticator >> realm [
	^ 'Secured Area'
]
