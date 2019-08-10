Class {
	#name : #WCOAuth2ResponseType,
	#superclass : #Object,
	#category : #'WebCopper-OAuth2-Service'
}

{ #category : #'as yet unclassified' }
WCOAuth2ResponseType class >> AUTH_CODE [
	^ 'code'
]

{ #category : #'as yet unclassified' }
WCOAuth2ResponseType class >> AUTH_TOKEN [
	^ 'token'
]

{ #category : #'as yet unclassified' }
WCOAuth2ResponseType class >> all [
	^ {
		self AUTH_CODE.
		self AUTH_TOKEN
	}
]
