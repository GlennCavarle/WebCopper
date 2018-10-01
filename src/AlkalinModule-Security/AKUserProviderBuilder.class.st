Class {
	#name : #AKUserProviderBuilder,
	#superclass : #Object,
	#instVars : [
		'providerClass',
		'configurationBlock'
	],
	#category : #'AlkalinModule-Security-Builder'
}

{ #category : #building }
AKUserProviderBuilder >> buildProvider [
	| provider |
	provider := self providerClass asClass new.
	self configurationBlock value: provider.
	^ provider
]

{ #category : #accessing }
AKUserProviderBuilder >> configurationBlock [
	^ configurationBlock ifNil: [ configurationBlock := [ :p |  ] ]
]

{ #category : #public }
AKUserProviderBuilder >> configure: aConfigurationBlock [
	configurationBlock := aConfigurationBlock
]

{ #category : #accessing }
AKUserProviderBuilder >> providerClass [
	^ providerClass ifNil: [ Error signal: 'UserProvider class is required' ]
]

{ #category : #public }
AKUserProviderBuilder >> providerClass: anObject [
	providerClass := anObject
]
