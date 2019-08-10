Class {
	#name : #WCOAuth2GrantData,
	#superclass : #Object,
	#instVars : [
		'client',
		'scope',
		'data',
		'usedRefreshToken',
		'usedAuthCode',
		'accessTokenLifetime',
		'issueRefreshToken',
		'refreshTokenLifetime'
	],
	#category : #'WebCopper-OAuth2-Service'
}

{ #category : #accessing }
WCOAuth2GrantData >> accessTokenLifetime [
	^ accessTokenLifetime
]

{ #category : #accessing }
WCOAuth2GrantData >> accessTokenLifetime: anObject [
	accessTokenLifetime := anObject
]

{ #category : #accessing }
WCOAuth2GrantData >> client [
	^ client
]

{ #category : #accessing }
WCOAuth2GrantData >> client: anObject [
	client := anObject
]

{ #category : #accessing }
WCOAuth2GrantData >> clientId [
	^ client clientId
]

{ #category : #accessing }
WCOAuth2GrantData >> data [
	^ data
]

{ #category : #accessing }
WCOAuth2GrantData >> data: anObject [
	data := anObject
]

{ #category : #initialization }
WCOAuth2GrantData >> initialize [
	super initialize.
	
	accessTokenLifetime := 3600.
	issueRefreshToken := true.
	refreshTokenLifetime := 1209600.
	scope := ''
]

{ #category : #accessing }
WCOAuth2GrantData >> issueRefreshToken [
	^ issueRefreshToken
]

{ #category : #accessing }
WCOAuth2GrantData >> issueRefreshToken: anObject [
	issueRefreshToken := anObject
]

{ #category : #accessing }
WCOAuth2GrantData >> refreshTokenLifetime [
	^ refreshTokenLifetime
]

{ #category : #accessing }
WCOAuth2GrantData >> refreshTokenLifetime: anObject [
	refreshTokenLifetime := anObject
]

{ #category : #accessing }
WCOAuth2GrantData >> scope [
	^ scope
]

{ #category : #accessing }
WCOAuth2GrantData >> scope: anObject [
	scope := anObject
]

{ #category : #accessing }
WCOAuth2GrantData >> usedAuthCode [
	^ usedAuthCode
]

{ #category : #accessing }
WCOAuth2GrantData >> usedAuthCode: anObject [
	usedAuthCode := anObject
]

{ #category : #accessing }
WCOAuth2GrantData >> usedRefreshToken [
	^ usedRefreshToken
]

{ #category : #accessing }
WCOAuth2GrantData >> usedRefreshToken: anObject [
	usedRefreshToken := anObject
]
