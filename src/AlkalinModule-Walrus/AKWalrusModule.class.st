Class {
	#name : #AKWalrusModule,
	#superclass : #AKKernelModule,
	#category : #'AlkalinModule-Walrus-Module'
}

{ #category : #configuring }
AKWalrusModule class >> defaultConfiguration [
	^ AKWalrusModuleConfig new
]

{ #category : #configuring }
AKWalrusModule >> configureServiceContainer: aDiContainer [
	self configuration contexts
		do: [ :cxtBuilder | cxtBuilder buildDefinitionsOn: aDiContainer ].
	
	self configuration repositories
		do: [ :repoBuilder | repoBuilder buildDefinitionsOn: aDiContainer ]
]

{ #category : #configuring }
AKWalrusModule >> load: aDiContainer config: aKernelConfig [

	self send: #configureWalrus: on: aKernelConfig with: self configuration.
	self configureServiceContainer: aDiContainer
]
