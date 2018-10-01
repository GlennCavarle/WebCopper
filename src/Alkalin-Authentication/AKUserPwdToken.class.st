Class {
	#name : #AKUserPwdToken,
	#superclass : #AKAuthToken,
	#instVars : [
		'username',
		'password'
	],
	#category : #'Alkalin-Authentication-Token'
}

{ #category : #'instance creation' }
AKUserPwdToken class >> username: aUsername password: aPassword [
	^ super new
		username: aUsername;
		password: aPassword;
		yourself
]

{ #category : #'as yet unclassified' }
AKUserPwdToken >> clearCredentials [
	password := nil
]

{ #category : #accessing }
AKUserPwdToken >> password [
	^ password
]

{ #category : #accessing }
AKUserPwdToken >> password: anObject [
	password := anObject
]

{ #category : #accessing }
AKUserPwdToken >> username [
	^ username
]

{ #category : #accessing }
AKUserPwdToken >> username: anObject [
	username := anObject
]
