Class {
	#name : #AKOAuth2UserModel,
	#superclass : #Object,
	#instVars : [
		'username',
		'password'
	],
	#category : #'Alkalin-OAuth2-Model'
}

{ #category : #accessing }
AKOAuth2UserModel >> password [
	^ password
]

{ #category : #accessing }
AKOAuth2UserModel >> password: anObject [
	password := anObject
]

{ #category : #accessing }
AKOAuth2UserModel >> username [
	^ username
]

{ #category : #accessing }
AKOAuth2UserModel >> username: anObject [
	username := anObject
]
