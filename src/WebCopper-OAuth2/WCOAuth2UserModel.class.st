Class {
	#name : #WCOAuth2UserModel,
	#superclass : #Object,
	#instVars : [
		'username',
		'password'
	],
	#category : #'WebCopper-OAuth2-Model'
}

{ #category : #accessing }
WCOAuth2UserModel >> password [
	^ password
]

{ #category : #accessing }
WCOAuth2UserModel >> password: anObject [
	password := anObject
]

{ #category : #accessing }
WCOAuth2UserModel >> username [
	^ username
]

{ #category : #accessing }
WCOAuth2UserModel >> username: anObject [
	username := anObject
]
