Class {
	#name : #AKOAuth2AuthorizeParams,
	#superclass : #AKOAuth2RequestParams,
	#instVars : [
		'client',
		'responseType',
		'state'
	],
	#category : #'Alkalin-OAuth2-Service'
}

{ #category : #'as yet unclassified' }
AKOAuth2AuthorizeParams class >> fromRequest: aRequest [
	^ self basicNew
		initializeFromRequest: aRequest;
		yourself
]

{ #category : #accessing }
AKOAuth2AuthorizeParams >> callbackUriWithCode: anAuthCode [
	| redirectUriCallback |
	redirectUriCallback := ZnUrl fromString: self redirectUri.
	
	self responseType = AKOAuth2ResponseType AUTH_CODE
		ifTrue: [ redirectUriCallback
				queryAt: 'code' put: anAuthCode;
				queryAt: 'state' put: self state ].
	
	self responseType = AKOAuth2ResponseType AUTH_TOKEN
		ifTrue: [ redirectUriCallback
				fragment: (String streamContents: [ :stream | 
							ZnResourceMetaUtils 
								writeQueryFields:
									{(#code -> anAuthCode).
									(#state -> self state)} asDictionary
								on: stream ]) ].
						
	^ redirectUriCallback asString
]

{ #category : #initialization }
AKOAuth2AuthorizeParams >> ensureRedirectUriBasedOnClient: aClient [
	| parsedUri |
	
	redirectUri 
		ifNil: [ (aClient redirectUris isEmpty or: [ aClient redirectUris size > 1 ])
				ifTrue: [ AKOAuth2InvalidRequest signal: 'No redirect URL was supplied or registred or more than one is registered' ].
			redirectUri := aClient redirectUris first.
			^ self ].
	
	parsedUri := ZnUrl fromString: redirectUri.
	aClient redirectUris
		detect: [ :each | parsedUri = (ZnUrl fromString: each) ]
		ifNone: [ AKOAuth2RedirectUriMismatch signal: 'The redirect URI provided does not match registered URI(s).' ].
	redirectUri := parsedUri asString
]

{ #category : #initialization }
AKOAuth2AuthorizeParams >> initializeFromRequest: aRequest [
	self initialize.
	clientId := aRequest uri queryAt: 'client_id' ifAbsent:[AKOAuth2ServerException signal: 'No client id supplied' ].
	responseType := aRequest uri queryAt: 'response_type' ifAbsent:[AKOAuth2ServerException signal: 'Invalid response type'].		
	redirectUri := aRequest uri queryAt: 'redirect_uri' ifAbsent:[''].
	state := aRequest uri queryAt: 'state' ifAbsent:[''].
	scope := aRequest uri queryAt: 'scope' ifAbsent:[''].
	
	(AKOAuth2ResponseType all includes: responseType) 
		ifFalse:[AKOAuth2ServerException signal: 'Unsupported response type'].
]

{ #category : #accessing }
AKOAuth2AuthorizeParams >> responseType [
	^ responseType
]

{ #category : #accessing }
AKOAuth2AuthorizeParams >> responseType: anObject [
	responseType := anObject
]

{ #category : #accessing }
AKOAuth2AuthorizeParams >> state [
	^ state
]

{ #category : #accessing }
AKOAuth2AuthorizeParams >> state: anObject [
	state := anObject
]
