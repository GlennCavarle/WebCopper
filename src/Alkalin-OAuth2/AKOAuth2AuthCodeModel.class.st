Class {
	#name : #AKOAuth2AuthCodeModel,
	#superclass : #AKOAuth2TokenModel,
	#instVars : [
		'redirectUri'
	],
	#category : #'Alkalin-OAuth2-Model'
}

{ #category : #accessing }
AKOAuth2AuthCodeModel >> redirectUri [
	^ redirectUri
]

{ #category : #accessing }
AKOAuth2AuthCodeModel >> redirectUri: anObject [
	redirectUri := anObject
]
