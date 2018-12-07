Class {
	#name : #AKWalrusContextBuilder,
	#superclass : #Object,
	#instVars : [
		'identifier',
		'connectionConfig',
		'metadataFactory'
	],
	#category : #'AlkalinModule-Walrus-Builder'
}

{ #category : #'private - building' }
AKWalrusContextBuilder >> buildDefinitionsOn: aDiContainer [
	| conPoolId |
	conPoolId := (self identifier,'ConnectionPool') asSymbol.
	
	aDiContainer
		addDefinition:[:def| def
			identifier: self identifier;
			targetClass: WRDbContext;
			constructor: #metadataFactory:connection: withArgs: { 
				self metadataFactory. conPoolId asAKServiceRef};
			tag: (AKDiTag name: #wrDbContext)];
						
		addDefinition:[:def| def
			identifier: conPoolId;
			targetClass: WRConnectionPool ;
			constructor: #config: withArgs: { connectionConfig};
			tag: (AKDiTag name: #wrConnectionPool) ]
]

{ #category : #api }
AKWalrusContextBuilder >> database: aDbName [
	connectionConfig database: aDbName
]

{ #category : #api }
AKWalrusContextBuilder >> host: anHost port: aPort [
	connectionConfig host: anHost port: aPort
]

{ #category : #accessing }
AKWalrusContextBuilder >> identifier [
	^ identifier ifNil: [ Error signal: 'Db context identifier must be defined' ]
]

{ #category : #api }
AKWalrusContextBuilder >> identifier: anIdentifier [
	identifier := anIdentifier
]

{ #category : #initialization }
AKWalrusContextBuilder >> initialize [
	super initialize.
	connectionConfig := WRConnectionConfig new.
]

{ #category : #api }
AKWalrusContextBuilder >> maxPoolSize: anInteger [
	connectionConfig maxPoolSize: anInteger
]

{ #category : #accessing }
AKWalrusContextBuilder >> metadataFactory [
	^ metadataFactory ifNil: [ metadataFactory := WRClassMetadataFactory withAnnotationLoader ]
]

{ #category : #api }
AKWalrusContextBuilder >> metadataFactory: aMetadataFactory [
	metadataFactory := aMetadataFactory
]

{ #category : #api }
AKWalrusContextBuilder >> username: anUsername password: aPwd [
	connectionConfig username: anUsername password: aPwd
]
