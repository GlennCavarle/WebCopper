Class {
	#name : #AKAuthProviderBuilder,
	#superclass : #Object,
	#instVars : [
		'providerClass',
		'configurationBlock'
	],
	#category : #'AlkalinModule-Security-Builder'
}

{ #category : #building }
AKAuthProviderBuilder >> buildProvider [
	| provider |
	provider := self providerClass asClass new.
	self configurationBlock value: provider.
	^ provider
]

{ #category : #accessing }
AKAuthProviderBuilder >> configurationBlock [
	^ configurationBlock ifNil: [ configurationBlock := [ :p |  ] ]
]

{ #category : #public }
AKAuthProviderBuilder >> configure: aConfigurationBlock [
	configurationBlock := aConfigurationBlock
]

{ #category : #accessing }
AKAuthProviderBuilder >> providerClass [
	^ providerClass ifNil: [ Error signal: 'UserProvider class is required' ]
]

{ #category : #public }
AKAuthProviderBuilder >> providerClass: anObject [
	providerClass := anObject
]
