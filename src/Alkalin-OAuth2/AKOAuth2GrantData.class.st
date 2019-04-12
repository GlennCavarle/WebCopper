Class {
	#name : #AKOAuth2GrantData,
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
	#category : #'Alkalin-OAuth2-Service'
}

{ #category : #accessing }
AKOAuth2GrantData >> accessTokenLifetime [
	^ accessTokenLifetime
]

{ #category : #accessing }
AKOAuth2GrantData >> accessTokenLifetime: anObject [
	accessTokenLifetime := anObject
]

{ #category : #accessing }
AKOAuth2GrantData >> client [
	^ client
]

{ #category : #accessing }
AKOAuth2GrantData >> client: anObject [
	client := anObject
]

{ #category : #accessing }
AKOAuth2GrantData >> clientId [
	^ client clientId
]

{ #category : #accessing }
AKOAuth2GrantData >> data [
	^ data
]

{ #category : #accessing }
AKOAuth2GrantData >> data: anObject [
	data := anObject
]

{ #category : #initialization }
AKOAuth2GrantData >> initialize [
	super initialize.
	
	accessTokenLifetime := 3600.
	issueRefreshToken := true.
	refreshTokenLifetime := 1209600
]

{ #category : #accessing }
AKOAuth2GrantData >> issueRefreshToken [
	^ issueRefreshToken
]

{ #category : #accessing }
AKOAuth2GrantData >> issueRefreshToken: anObject [
	issueRefreshToken := anObject
]

{ #category : #accessing }
AKOAuth2GrantData >> refreshTokenLifetime [
	^ refreshTokenLifetime
]

{ #category : #accessing }
AKOAuth2GrantData >> refreshTokenLifetime: anObject [
	refreshTokenLifetime := anObject
]

{ #category : #accessing }
AKOAuth2GrantData >> scope [
	^ scope
]

{ #category : #accessing }
AKOAuth2GrantData >> scope: anObject [
	scope := anObject
]

{ #category : #accessing }
AKOAuth2GrantData >> usedAuthCode [
	^ usedAuthCode
]

{ #category : #accessing }
AKOAuth2GrantData >> usedAuthCode: anObject [
	usedAuthCode := anObject
]

{ #category : #accessing }
AKOAuth2GrantData >> usedRefreshToken [
	^ usedRefreshToken
]

{ #category : #accessing }
AKOAuth2GrantData >> usedRefreshToken: anObject [
	usedRefreshToken := anObject
]
