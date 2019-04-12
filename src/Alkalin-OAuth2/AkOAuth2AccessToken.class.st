Class {
	#name : #AkOAuth2AccessToken,
	#superclass : #AKOAuth2Token,
	#instVars : [
		'scope',
		'verified',
		'expired'
	],
	#category : #'Alkalin-OAuth2-Token'
}

{ #category : #accessing }
AkOAuth2AccessToken >> beVerified [
	verified := true
]

{ #category : #accessing }
AkOAuth2AccessToken >> expired: anObject [
	expired := anObject
]

{ #category : #testing }
AkOAuth2AccessToken >> isExpired [
	^ expired
]

{ #category : #accessing }
AkOAuth2AccessToken >> scope [
	^ scope
]

{ #category : #accessing }
AkOAuth2AccessToken >> scope: anObject [
	scope := anObject
]

{ #category : #testing }
AkOAuth2AccessToken >> verified [
	^ verified
]
