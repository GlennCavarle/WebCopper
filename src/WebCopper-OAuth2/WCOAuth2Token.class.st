Class {
	#name : #WCOAuth2Token,
	#superclass : #WCAuthToken,
	#instVars : [
		'token'
	],
	#category : #'WebCopper-OAuth2-Token'
}

{ #category : #accessing }
WCOAuth2Token class >> token: aRawToken [
	^ self new
		token: aRawToken;
		yourself
]

{ #category : #accessing }
WCOAuth2Token >> token [
	^ token
]

{ #category : #accessing }
WCOAuth2Token >> token: anObject [
	token := anObject
]
