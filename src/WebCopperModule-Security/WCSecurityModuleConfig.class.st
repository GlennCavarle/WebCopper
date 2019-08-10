Class {
	#name : #WCSecurityModuleConfig,
	#superclass : #Object,
	#instVars : [
		'userProviderBuilders',
		'authenticatorBuilders'
	],
	#category : #'WebCopperModule-Security-Module'
}

{ #category : #adding }
WCSecurityModuleConfig >> addAuthProvider: aBlock [
	| providerBuilder |
	providerBuilder := WCAuthProviderBuilder new.
	aBlock value: providerBuilder.
	userProviderBuilders add: providerBuilder
]

{ #category : #adding }
WCSecurityModuleConfig >> addAuthenticator: aBlock [
	| auth |
	auth := WCAuthenticatorBuilder new.
	aBlock value: auth.
	authenticatorBuilders add: auth
]

{ #category : #building }
WCSecurityModuleConfig >> buildAuthenticatorMap [
	| authMap userProviders manager |
	authMap := WCAuthenticatorMap new.
	userProviders := userProviderBuilders collect: [ :b | b buildProvider ].
	manager := WCAuthProviderManager withProviders: userProviders.
	authenticatorBuilders do: [ :b | 
			| auth |
			auth := b buildAuthenticator.
			auth authProviderManager: manager.
			authMap map: b requestMatcher to: auth ].
	^ authMap
]

{ #category : #initialization }
WCSecurityModuleConfig >> initialize [
	super initialize.
	authenticatorBuilders := OrderedCollection new.
	userProviderBuilders := OrderedCollection new
]

{ #category : #testing }
WCSecurityModuleConfig >> isConfigured [
	^ authenticatorBuilders isNotEmpty
]
