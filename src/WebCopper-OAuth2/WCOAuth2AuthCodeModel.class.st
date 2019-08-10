Class {
	#name : #WCOAuth2AuthCodeModel,
	#superclass : #WCOAuth2TokenModel,
	#instVars : [
		'redirectUri'
	],
	#category : #'WebCopper-OAuth2-Model'
}

{ #category : #accessing }
WCOAuth2AuthCodeModel >> redirectUri [
	^ redirectUri
]

{ #category : #accessing }
WCOAuth2AuthCodeModel >> redirectUri: anObject [
	redirectUri := anObject
]
