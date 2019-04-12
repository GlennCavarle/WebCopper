Class {
	#name : #AKOAuth2Authenticator,
	#superclass : #AKAbstractAuthenticator,
	#instVars : [
		'authService'
	],
	#category : #'Alkalin-OAuth2-Authenticator'
}

{ #category : #accessing }
AKOAuth2Authenticator class >> authService: anOAuthServer [
	^ self new
		authService: anOAuthServer;
		yourself
]

{ #category : #accessing }
AKOAuth2Authenticator >> authService [
	^ authService
]

{ #category : #accessing }
AKOAuth2Authenticator >> authService: anObject [
	authService := anObject
]

{ #category : #authenticating }
AKOAuth2Authenticator >> authenticateRequest: anHttpRequest [
	| oAuthToken |
	[
		oAuthToken := self authService extractBearerTokenFromRequest: anHttpRequest.
		oAuthToken := self authProviderManager authenticateToken: oAuthToken
	] on:AKException do:[:ex| ^ self challengeClient: ex].

	^ AKAuthResult successWithToken: oAuthToken
]

{ #category : #authenticating }
AKOAuth2Authenticator >> bearerHeader [
	^ 'Bearer realm="' , self realm , '"'
]

{ #category : #authenticating }
AKOAuth2Authenticator >> challengeClient: anException [
	<return: #AKAuthResult>
	| response |
	response := AKHttpResponse
		unauthorized: self bearerHeader
		entity: (ZnEntity textCRLF: anException messageText).
		
	^ AKAuthResult failureWithResponse: response
]

{ #category : #authenticating }
AKOAuth2Authenticator >> realm [
	^ 'Secured Area'
]
