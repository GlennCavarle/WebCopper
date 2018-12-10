Class {
	#name : #AKOAuth2Authenticator,
	#superclass : #AKAbstractAuthenticator,
	#category : #'Alkalin-OAuth2-Authenticator'
}

{ #category : #authenticating }
AKOAuth2Authenticator >> authenticateRequest: anHttpRequest [
	<return: #AKAuthResult>
	| authToken accessToken |
	[
		authToken := self extractBearerTokenFromRequestHeader: anHttpRequest.
		accessToken := self userProviderManager authenticateToken: authToken
	] on:Error do:[:ex| ^ self challengeClient: ex].

	^ AKAuthResult successWithToken: accessToken
]

{ #category : #authenticating }
AKOAuth2Authenticator >> basicHeader [
	^ 'Basic realm="' , self realm , '"'
]

{ #category : #authenticating }
AKOAuth2Authenticator >> challengeClient: anException [
	<return: #AKAuthResult>
	| response |
	response := AKHttpResponse
		unauthorized: self basicHeader
		entity: (ZnEntity textCRLF: anException messageText).
		
	^ AKAuthResult failureWithResponse: response
]

{ #category : #authenticating }
AKOAuth2Authenticator >> extractBearerTokenFromRequestHeader: anHttpRequest [
	<return: #AKAuthToken>
	| authHeader authHeaderPart oauth2Token |
	
	authHeader := anHttpRequest headers at: 'Authorization' 
		ifAbsent: [ Error signal: 'Incorrect Authorization header' ].
	
	authHeaderPart := authHeader findTokens: ' '.
	(authHeaderPart size = 2 and: [ authHeaderPart first = 'Bearer' ])
		ifFalse: [ Error signal: 'Incorrect Authorization header' ].
		
	oauth2Token := AKOAuth2Token token: authHeaderPart second.
	^ oauth2Token
]

{ #category : #accessing }
AKOAuth2Authenticator >> realm [
	^ 'Secured Area'
]
