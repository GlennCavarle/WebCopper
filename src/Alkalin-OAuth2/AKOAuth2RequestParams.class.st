Class {
	#name : #AKOAuth2RequestParams,
	#superclass : #Object,
	#instVars : [
		'clientId',
		'redirectUri',
		'scope'
	],
	#category : #'Alkalin-OAuth2-Service'
}

{ #category : #accessing }
AKOAuth2RequestParams >> clientId [
	^ clientId
]

{ #category : #accessing }
AKOAuth2RequestParams >> clientId: anObject [
	clientId := anObject
]

{ #category : #accessing }
AKOAuth2RequestParams >> redirectUri [
	^ redirectUri
]

{ #category : #accessing }
AKOAuth2RequestParams >> redirectUri: anObject [
	redirectUri := anObject
]

{ #category : #accessing }
AKOAuth2RequestParams >> scope [
	^ scope
]

{ #category : #accessing }
AKOAuth2RequestParams >> scope: anObject [
	scope := anObject
]
