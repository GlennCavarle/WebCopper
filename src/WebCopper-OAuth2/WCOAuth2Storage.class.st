Class {
	#name : #WCOAuth2Storage,
	#superclass : #Object,
	#category : #'WebCopper-OAuth2-Storage'
}

{ #category : #testing }
WCOAuth2Storage >> supportsAuthCode [
	^ false
]

{ #category : #testing }
WCOAuth2Storage >> supportsClientCredentials [
	^ false
]

{ #category : #testing }
WCOAuth2Storage >> supportsExtendedGrantType [
	^ false
]

{ #category : #testing }
WCOAuth2Storage >> supportsRefreshToken [
	^ false
]

{ #category : #testing }
WCOAuth2Storage >> supportsUserCredentials [
	^ false
]
