Class {
	#name : #AKOAuth2ClientModel,
	#superclass : #Object,
	#instVars : [
		'clientId',
		'clientSecret',
		'redirectUris',
		'allowedGrantTypes',
		'allowedOrigins'
	],
	#category : #'Alkalin-OAuth2-Model'
}

{ #category : #accessing }
AKOAuth2ClientModel >> allowedGrantTypes [
	^ allowedGrantTypes
]

{ #category : #accessing }
AKOAuth2ClientModel >> allowedGrantTypes: anObject [
	allowedGrantTypes := anObject
]

{ #category : #accessing }
AKOAuth2ClientModel >> allowedOrigins [
	^ allowedOrigins
]

{ #category : #accessing }
AKOAuth2ClientModel >> allowedOrigins: anObject [
	allowedOrigins := anObject
]

{ #category : #accessing }
AKOAuth2ClientModel >> clientId [
	^ clientId
]

{ #category : #accessing }
AKOAuth2ClientModel >> clientId: anObject [
	clientId := anObject
]

{ #category : #accessing }
AKOAuth2ClientModel >> clientSecret [
	^ clientSecret
]

{ #category : #accessing }
AKOAuth2ClientModel >> clientSecret: anObject [
	clientSecret := anObject
]

{ #category : #initialization }
AKOAuth2ClientModel >> initialize [
	super initialize.
	allowedGrantTypes := OrderedCollection new.
	allowedOrigins := OrderedCollection new.
	redirectUris := OrderedCollection new
]

{ #category : #accessing }
AKOAuth2ClientModel >> redirectUris [
	^ redirectUris
]

{ #category : #accessing }
AKOAuth2ClientModel >> redirectUris: anObject [
	redirectUris := anObject
]
