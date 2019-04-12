Class {
	#name : #AKOAuth2ResponseType,
	#superclass : #Object,
	#category : #'Alkalin-OAuth2-Service'
}

{ #category : #'as yet unclassified' }
AKOAuth2ResponseType class >> AUTH_CODE [
	^ 'code'
]

{ #category : #'as yet unclassified' }
AKOAuth2ResponseType class >> AUTH_TOKEN [
	^ 'token'
]

{ #category : #'as yet unclassified' }
AKOAuth2ResponseType class >> all [
	^ {
		self AUTH_CODE.
		self AUTH_TOKEN
	}
]
