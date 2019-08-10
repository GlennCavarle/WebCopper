"
Crafts token from Basic Http headers
"
Class {
	#name : #WCBasicAuthenticator,
	#superclass : #WCAbstractAuthenticator,
	#category : #'WebCopper-Authentication-Authenticator'
}

{ #category : #authenticating }
WCBasicAuthenticator >> authenticateRequest: anHttpRequest [
	<return: #WCAuthResult>
	| authToken userToken |
	
	[
		authToken := self extractTokenFromRequest: anHttpRequest.
		userToken := self authProviderManager authenticateToken: authToken.
	] on:Error do:[:ex| ^ self challengeClient:ex ].
	
	^ WCAuthResult successWithToken: userToken
]

{ #category : #authenticating }
WCBasicAuthenticator >> basicHeader [
	^ 'Basic realm="' , self realm , '"'
]

{ #category : #authenticating }
WCBasicAuthenticator >> challengeClient: anException [
	<return: #WCAuthResult>
	| response |
	response := WCHttpResponse
		unauthorized: self basicHeader
		entity: (ZnEntity textCRLF: anException messageText).
		
	^ WCAuthResult failureWithResponse: response
]

{ #category : #authenticating }
WCBasicAuthenticator >> extractTokenFromRequest: anHttpRequest [
	<return: #WCAuthToken>
	| authData |
	anHttpRequest headers at: 'Authorization' ifAbsent: [ Error signal: 'Incorrect Authorization header' ].
	authData := anHttpRequest basicAuthentication.
	(authData anySatisfy:#isEmpty) ifTrue: [ Error signal: 'Incorrect Authorization header' ].
	
	^ WCUserPwdToken username: authData first password: authData second.
	
	
	
	
]

{ #category : #accessing }
WCBasicAuthenticator >> realm [
	^ 'Secured Area'
]
