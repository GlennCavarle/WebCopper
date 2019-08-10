Class {
	#name : #WCOAuth2ClientModel,
	#superclass : #Object,
	#instVars : [
		'clientId',
		'clientSecret',
		'redirectUris',
		'allowedGrantTypes',
		'allowedOrigins'
	],
	#category : #'WebCopper-OAuth2-Model'
}

{ #category : #accessing }
WCOAuth2ClientModel >> allowedGrantTypes [
	^ allowedGrantTypes
]

{ #category : #accessing }
WCOAuth2ClientModel >> allowedGrantTypes: anObject [
	allowedGrantTypes := anObject
]

{ #category : #accessing }
WCOAuth2ClientModel >> allowedOrigins [
	^ allowedOrigins
]

{ #category : #accessing }
WCOAuth2ClientModel >> allowedOrigins: anObject [
	allowedOrigins := anObject
]

{ #category : #accessing }
WCOAuth2ClientModel >> clientId [
	^ clientId
]

{ #category : #accessing }
WCOAuth2ClientModel >> clientId: anObject [
	clientId := anObject
]

{ #category : #accessing }
WCOAuth2ClientModel >> clientSecret [
	^ clientSecret
]

{ #category : #accessing }
WCOAuth2ClientModel >> clientSecret: anObject [
	clientSecret := anObject
]

{ #category : #initialization }
WCOAuth2ClientModel >> initialize [
	super initialize.
	allowedGrantTypes := OrderedCollection new.
	allowedOrigins := OrderedCollection new.
	redirectUris := OrderedCollection new
]

{ #category : #accessing }
WCOAuth2ClientModel >> redirectUris [
	^ redirectUris
]

{ #category : #accessing }
WCOAuth2ClientModel >> redirectUris: anObject [
	redirectUris := anObject
]
