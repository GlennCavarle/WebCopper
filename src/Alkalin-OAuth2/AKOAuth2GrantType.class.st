Class {
	#name : #AKOAuth2GrantType,
	#superclass : #Object,
	#category : #'Alkalin-OAuth2-Service'
}

{ #category : #'as yet unclassified' }
AKOAuth2GrantType class >> AUTH_CODE [
	^ 'authorization_code'
]

{ #category : #'as yet unclassified' }
AKOAuth2GrantType class >> CLIENT_CREDENTIALS [
	^ 'client_credentials'
]

{ #category : #'as yet unclassified' }
AKOAuth2GrantType class >> EXTENSIONS [
	^ 'extensions'
]

{ #category : #'as yet unclassified' }
AKOAuth2GrantType class >> REFRESH_TOKEN [
	^ 'refresh_token'
]

{ #category : #'as yet unclassified' }
AKOAuth2GrantType class >> USER_CREDENTIALS [
	^ 'password'
]
