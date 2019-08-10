Class {
	#name : #WCOAuth2AuthorizeParams,
	#superclass : #WCOAuth2RequestParams,
	#instVars : [
		'client',
		'responseType',
		'state'
	],
	#category : #'WebCopper-OAuth2-Service'
}

{ #category : #'as yet unclassified' }
WCOAuth2AuthorizeParams class >> fromRequest: aRequest [
	^ self basicNew
		initializeFromRequest: aRequest;
		yourself
]

{ #category : #accessing }
WCOAuth2AuthorizeParams >> callbackUriWithCode: anAuthCode [
	| redirectUriCallback |
	redirectUriCallback := ZnUrl fromString: self redirectUri.
	
	self responseType = WCOAuth2ResponseType AUTH_CODE
		ifTrue: [ redirectUriCallback
				queryAt: 'code' put: anAuthCode;
				queryAt: 'state' put: self state ].
	
	self responseType = WCOAuth2ResponseType AUTH_TOKEN
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
WCOAuth2AuthorizeParams >> ensureRedirectUriBasedOnClient: aClient [
	| parsedUri |
	
	redirectUri 
		ifNil: [ (aClient redirectUris isEmpty or: [ aClient redirectUris size > 1 ])
				ifTrue: [ WCOAuth2InvalidRequest signal: 'No redirect URL was supplied or registred or more than one is registered' ].
			redirectUri := aClient redirectUris first.
			^ self ].
	
	parsedUri := ZnUrl fromString: redirectUri.
	aClient redirectUris
		detect: [ :each | parsedUri = (ZnUrl fromString: each) ]
		ifNone: [ WCOAuth2RedirectUriMismatch signal: 'The redirect URI provided does not match registered URI(s).' ].
	redirectUri := parsedUri asString
]

{ #category : #initialization }
WCOAuth2AuthorizeParams >> initializeFromRequest: aRequest [
	self initialize.
	clientId := aRequest uri queryAt: 'client_id' ifAbsent:[WCOAuth2ServerException signal: 'No client id supplied' ].
	responseType := aRequest uri queryAt: 'response_type' ifAbsent:[WCOAuth2ServerException signal: 'Invalid response type'].		
	redirectUri := aRequest uri queryAt: 'redirect_uri' ifAbsent:[''].
	state := aRequest uri queryAt: 'state' ifAbsent:[''].
	scope := aRequest uri queryAt: 'scope' ifAbsent:[''].
	
	(WCOAuth2ResponseType all includes: responseType) 
		ifFalse:[WCOAuth2ServerException signal: 'Unsupported response type'].
]

{ #category : #accessing }
WCOAuth2AuthorizeParams >> responseType [
	^ responseType
]

{ #category : #accessing }
WCOAuth2AuthorizeParams >> responseType: anObject [
	responseType := anObject
]

{ #category : #accessing }
WCOAuth2AuthorizeParams >> state [
	^ state
]

{ #category : #accessing }
WCOAuth2AuthorizeParams >> state: anObject [
	state := anObject
]
