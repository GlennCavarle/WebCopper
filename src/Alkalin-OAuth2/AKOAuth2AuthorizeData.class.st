Class {
	#name : #AKOAuth2AuthorizeData,
	#superclass : #Object,
	#instVars : [
		'client',
		'scope',
		'redirectUri',
		'data',
		'authCodeLifetime'
	],
	#category : #'Alkalin-OAuth2-Service'
}

{ #category : #accessing }
AKOAuth2AuthorizeData >> authCodeLifetime [
	^ authCodeLifetime
]

{ #category : #accessing }
AKOAuth2AuthorizeData >> authCodeLifetime: anObject [
	authCodeLifetime := anObject
]

{ #category : #accessing }
AKOAuth2AuthorizeData >> client [
	^ client
]

{ #category : #accessing }
AKOAuth2AuthorizeData >> client: anObject [
	client := anObject
]

{ #category : #accessing }
AKOAuth2AuthorizeData >> clientId [
	^ client clientId
]

{ #category : #accessing }
AKOAuth2AuthorizeData >> data [
	^ data
]

{ #category : #accessing }
AKOAuth2AuthorizeData >> data: anObject [
	data := anObject
]

{ #category : #initialization }
AKOAuth2AuthorizeData >> initialize [ 
	super initialize.
	
	authCodeLifetime := 30.
]

{ #category : #accessing }
AKOAuth2AuthorizeData >> redirectUri [
	^ redirectUri
]

{ #category : #accessing }
AKOAuth2AuthorizeData >> redirectUri: anObject [
	redirectUri := anObject
]

{ #category : #accessing }
AKOAuth2AuthorizeData >> scope [
	^ scope
]

{ #category : #accessing }
AKOAuth2AuthorizeData >> scope: anObject [
	scope := anObject
]
