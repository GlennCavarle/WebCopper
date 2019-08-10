Class {
	#name : #WCOAuth2GrantType,
	#superclass : #Object,
	#category : #'WebCopper-OAuth2-Service'
}

{ #category : #'as yet unclassified' }
WCOAuth2GrantType class >> AUTH_CODE [
	^ 'authorization_code'
]

{ #category : #'as yet unclassified' }
WCOAuth2GrantType class >> CLIENT_CREDENTIALS [
	^ 'client_credentials'
]

{ #category : #'as yet unclassified' }
WCOAuth2GrantType class >> EXTENSIONS [
	^ 'extensions'
]

{ #category : #'as yet unclassified' }
WCOAuth2GrantType class >> REFRESH_TOKEN [
	^ 'refresh_token'
]

{ #category : #'as yet unclassified' }
WCOAuth2GrantType class >> USER_CREDENTIALS [
	^ 'password'
]
