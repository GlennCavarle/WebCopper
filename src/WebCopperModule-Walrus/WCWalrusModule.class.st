Class {
	#name : #WCWalrusModule,
	#superclass : #WCKernelModule,
	#category : #'WebCopperModule-Walrus-Module'
}

{ #category : #configuring }
WCWalrusModule class >> defaultConfiguration [
	^ WCWalrusModuleConfig new
]

{ #category : #configuring }
WCWalrusModule >> configureServiceContainer: aDiContainer [
	self configuration contexts
		do: [ :cxtBuilder | cxtBuilder buildDefinitionsOn: aDiContainer ].
	
	self configuration repositories
		do: [ :repoBuilder | repoBuilder buildDefinitionsOn: aDiContainer ]
]

{ #category : #configuring }
WCWalrusModule >> load: aDiContainer config: aKernelConfig [

	self send: #configureWalrus: on: aKernelConfig with: self configuration.
	self configureServiceContainer: aDiContainer
]
