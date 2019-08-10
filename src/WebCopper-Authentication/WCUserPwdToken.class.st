Class {
	#name : #WCUserPwdToken,
	#superclass : #WCAuthToken,
	#instVars : [
		'username',
		'password'
	],
	#category : #'WebCopper-Authentication-Token'
}

{ #category : #'instance creation' }
WCUserPwdToken class >> username: aUsername password: aPassword [
	^ super new
		username: aUsername;
		password: aPassword;
		yourself
]

{ #category : #'as yet unclassified' }
WCUserPwdToken >> clearCredentials [
	password := nil
]

{ #category : #accessing }
WCUserPwdToken >> password [
	^ password
]

{ #category : #accessing }
WCUserPwdToken >> password: anObject [
	password := anObject
]

{ #category : #accessing }
WCUserPwdToken >> username [
	^ username
]

{ #category : #accessing }
WCUserPwdToken >> username: anObject [
	username := anObject
]
