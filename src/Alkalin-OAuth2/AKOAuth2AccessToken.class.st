Class {
	#name : #AKOAuth2AccessToken,
	#superclass : #Object,
	#instVars : [
		'token',
		'client',
		'scope',
		'expiresAt'
	],
	#category : #'Alkalin-OAuth2-Token'
}

{ #category : #testing }
AKOAuth2AccessToken >> isExpired [
	^ expiresAt <= DateAndTime now
]
