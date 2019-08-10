Class {
	#name : #WCOAuth2RequestParams,
	#superclass : #Object,
	#instVars : [
		'clientId',
		'redirectUri',
		'scope'
	],
	#category : #'WebCopper-OAuth2-Service'
}

{ #category : #accessing }
WCOAuth2RequestParams >> clientId [
	^ clientId
]

{ #category : #accessing }
WCOAuth2RequestParams >> clientId: anObject [
	clientId := anObject
]

{ #category : #accessing }
WCOAuth2RequestParams >> redirectUri [
	^ redirectUri
]

{ #category : #accessing }
WCOAuth2RequestParams >> redirectUri: anObject [
	redirectUri := anObject
]

{ #category : #accessing }
WCOAuth2RequestParams >> scope [
	^ scope
]

{ #category : #accessing }
WCOAuth2RequestParams >> scope: anObject [
	scope := anObject
]
