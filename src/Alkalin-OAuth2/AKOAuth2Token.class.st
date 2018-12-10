Class {
	#name : #AKOAuth2Token,
	#superclass : #AKAuthToken,
	#instVars : [
		'token'
	],
	#category : #'Alkalin-OAuth2-Token'
}

{ #category : #accessing }
AKOAuth2Token class >> token: aRawToken [
	^ self new
		token: aRawToken;
		yourself
]

{ #category : #accessing }
AKOAuth2Token >> token [
	^ token
]

{ #category : #accessing }
AKOAuth2Token >> token: anObject [
	token := anObject
]
