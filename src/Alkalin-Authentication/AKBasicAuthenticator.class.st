Class {
	#name : #AKBasicAuthenticator,
	#superclass : #AKAbstractAuthenticator,
	#category : #'Alkalin-Authentication-Authenticator'
}

{ #category : #authenticating }
AKBasicAuthenticator >> authenticateRequest: anHttpRequest [
	<return: #AKAuthResult>
	| authToken userToken |
	authToken := self extractTokenFromRequest: anHttpRequest onFailure: [ ^ self challengeClient ].
	[userToken := self userProviderManager authenticateToken: authToken] on:Error do:[ ^ self challengeClient].
	^ AKAuthResult successWithToken: userToken
]

{ #category : #authenticating }
AKBasicAuthenticator >> basicHeader [
	^ 'Basic realm="' , self realm , '"'
]

{ #category : #authenticating }
AKBasicAuthenticator >> challengeClient [
	<return: #AKAuthResult>
	| response |
	response := AKHttpResponse
		unauthorized: self basicHeader
		entity: (ZnEntity textCRLF: 'Unauthorized').
		
	^ AKAuthResult failureWithResponse: response
]

{ #category : #authenticating }
AKBasicAuthenticator >> extractTokenFromRequest: anHttpRequest onFailure: aFailureBlock [
	<return: #AKAuthToken>
	| authData authHeader|
	authHeader := anHttpRequest headers at: 'Authorization' ifAbsent: aFailureBlock.
	authData := [anHttpRequest basicAuthentication] on: Error do: aFailureBlock.
	(authData anySatisfy:#isEmpty) ifTrue:  aFailureBlock.
	^ AKUserPwdToken username: authData first password: authData second.
	
	
	
	
]

{ #category : #accessing }
AKBasicAuthenticator >> realm [
	^ 'Secured Area'
]
