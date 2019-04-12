"
Crafts token from Basic Http headers
"
Class {
	#name : #AKBasicAuthenticator,
	#superclass : #AKAbstractAuthenticator,
	#category : #'Alkalin-Authentication-Authenticator'
}

{ #category : #authenticating }
AKBasicAuthenticator >> authenticateRequest: anHttpRequest [
	<return: #AKAuthResult>
	| authToken userToken |
	
	[
		authToken := self extractTokenFromRequest: anHttpRequest.
		userToken := self authProviderManager authenticateToken: authToken.
	] on:Error do:[:ex| ^ self challengeClient:ex ].
	
	^ AKAuthResult successWithToken: userToken
]

{ #category : #authenticating }
AKBasicAuthenticator >> basicHeader [
	^ 'Basic realm="' , self realm , '"'
]

{ #category : #authenticating }
AKBasicAuthenticator >> challengeClient: anException [
	<return: #AKAuthResult>
	| response |
	response := AKHttpResponse
		unauthorized: self basicHeader
		entity: (ZnEntity textCRLF: anException messageText).
		
	^ AKAuthResult failureWithResponse: response
]

{ #category : #authenticating }
AKBasicAuthenticator >> extractTokenFromRequest: anHttpRequest [
	<return: #AKAuthToken>
	| authData |
	anHttpRequest headers at: 'Authorization' ifAbsent: [ Error signal: 'Incorrect Authorization header' ].
	authData := anHttpRequest basicAuthentication.
	(authData anySatisfy:#isEmpty) ifTrue: [ Error signal: 'Incorrect Authorization header' ].
	
	^ AKUserPwdToken username: authData first password: authData second.
	
	
	
	
]

{ #category : #accessing }
AKBasicAuthenticator >> realm [
	^ 'Secured Area'
]
