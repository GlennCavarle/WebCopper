Class {
	#name : #WCAuthProviderBuilder,
	#superclass : #Object,
	#instVars : [
		'providerClass',
		'configurationBlock'
	],
	#category : #'WebCopperModule-Security-Builder'
}

{ #category : #building }
WCAuthProviderBuilder >> buildProvider [
	| provider |
	provider := self providerClass asClass new.
	self configurationBlock value: provider.
	^ provider
]

{ #category : #accessing }
WCAuthProviderBuilder >> configurationBlock [
	^ configurationBlock ifNil: [ configurationBlock := [ :p |  ] ]
]

{ #category : #public }
WCAuthProviderBuilder >> configure: aConfigurationBlock [
	configurationBlock := aConfigurationBlock
]

{ #category : #accessing }
WCAuthProviderBuilder >> providerClass [
	^ providerClass ifNil: [ Error signal: 'UserProvider class is required' ]
]

{ #category : #public }
WCAuthProviderBuilder >> providerClass: anObject [
	providerClass := anObject
]
