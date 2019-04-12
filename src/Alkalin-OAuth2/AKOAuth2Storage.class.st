Class {
	#name : #AKOAuth2Storage,
	#superclass : #Object,
	#category : #'Alkalin-OAuth2-Storage'
}

{ #category : #testing }
AKOAuth2Storage >> supportsAuthCode [
	^ false
]

{ #category : #testing }
AKOAuth2Storage >> supportsClientCredentials [
	^ false
]

{ #category : #testing }
AKOAuth2Storage >> supportsExtendedGrantType [
	^ false
]

{ #category : #testing }
AKOAuth2Storage >> supportsRefreshToken [
	^ false
]

{ #category : #testing }
AKOAuth2Storage >> supportsUserCredentials [
	^ false
]
