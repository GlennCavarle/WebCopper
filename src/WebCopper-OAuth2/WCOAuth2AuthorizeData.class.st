Class {
	#name : #WCOAuth2AuthorizeData,
	#superclass : #Object,
	#instVars : [
		'client',
		'scope',
		'redirectUri',
		'data',
		'authCodeLifetime'
	],
	#category : #'WebCopper-OAuth2-Service'
}

{ #category : #accessing }
WCOAuth2AuthorizeData >> authCodeLifetime [
	^ authCodeLifetime
]

{ #category : #accessing }
WCOAuth2AuthorizeData >> authCodeLifetime: anObject [
	authCodeLifetime := anObject
]

{ #category : #accessing }
WCOAuth2AuthorizeData >> client [
	^ client
]

{ #category : #accessing }
WCOAuth2AuthorizeData >> client: anObject [
	client := anObject
]

{ #category : #accessing }
WCOAuth2AuthorizeData >> clientId [
	^ client clientId
]

{ #category : #accessing }
WCOAuth2AuthorizeData >> data [
	^ data
]

{ #category : #accessing }
WCOAuth2AuthorizeData >> data: anObject [
	data := anObject
]

{ #category : #initialization }
WCOAuth2AuthorizeData >> initialize [ 
	super initialize.
	
	authCodeLifetime := 30.
]

{ #category : #accessing }
WCOAuth2AuthorizeData >> redirectUri [
	^ redirectUri
]

{ #category : #accessing }
WCOAuth2AuthorizeData >> redirectUri: anObject [
	redirectUri := anObject
]

{ #category : #accessing }
WCOAuth2AuthorizeData >> scope [
	^ scope
]

{ #category : #accessing }
WCOAuth2AuthorizeData >> scope: anObject [
	scope := anObject
]
