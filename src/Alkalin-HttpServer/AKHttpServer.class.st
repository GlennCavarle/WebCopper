Class {
	#name : #AKHttpServer,
	#superclass : #Object,
	#traits : 'TAKAssertion',
	#classTraits : 'TAKAssertion classTrait',
	#instVars : [
		'znServer',
		'dispatcher'
	],
	#classVars : [
		'uniqueInstance'
	],
	#category : #'Alkalin-HttpServer-Server'
}

{ #category : #asserting }
AKHttpServer class >> assertionsEnabled [
	<return: #Boolean>
	^ AKGlobalSettings assertionsEnabled
]

{ #category : #configuring }
AKHttpServer class >> defaultDispatcher [
	^ AKHttpServerDispatcher new
]

{ #category : #'instance creation' }
AKHttpServer class >> new [
	self error: 'Use #uniqueInstance'
]

{ #category : #'instance creation' }
AKHttpServer class >> on [
	self reset.
	^ self uniqueInstance 
]

{ #category : #'instance creation' }
AKHttpServer class >> reset [
	self stop.
	uniqueInstance := nil
]

{ #category : #'instance creation' }
AKHttpServer class >> restart [
	^ self uniqueInstance restart
]

{ #category : #'instance creation' }
AKHttpServer class >> stop [
	uniqueInstance ifNotNil: [ uniqueInstance stop ].
	^ self
]

{ #category : #'instance creation' }
AKHttpServer class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := super new]
]

{ #category : #asserting }
AKHttpServer >> assertIsNotRunning [
	self 
		assert: [ znServer isRunning not ] 
		description: [ 'Server is already running' ]
]

{ #category : #'handler registration' }
AKHttpServer >> at: aPathPrefix register: aAKRequestHandler [
	self assertIsNotRunning.
	dispatcher map: aPathPrefix to: aAKRequestHandler.
	aAKRequestHandler registredAtPrefix: aPathPrefix
]

{ #category : #options }
AKHttpServer >> debugMode: aBoolean [ 
	self assertIsNotRunning.
	znServer debugMode: aBoolean
]

{ #category : #options }
AKHttpServer >> disableLog [
	ZnLogEvent announcer unsubscribe: self.
]

{ #category : #options }
AKHttpServer >> enableLog [
	self disableLog.
	ZnLogEvent announcer when: ZnLogEvent do: [ :event | AKLogger info: event asString ].
]

{ #category : #initialization }
AKHttpServer >> initialize [
	super initialize.
	dispatcher := self class defaultDispatcher.
	self initializeInternalServer
]

{ #category : #initialization }
AKHttpServer >> initializeInternalServer [
	
	znServer := ZnServer defaultServerClass new.
	znServer reader: [ :stream | AKHttpRequest readFrom: stream ].
	znServer delegate: dispatcher
]

{ #category : #options }
AKHttpServer >> port: aPort [
	self assertIsNotRunning.
	znServer port: aPort
]

{ #category : #'handler registration' }
AKHttpServer >> registerDefault: aAKRequestHandler [
	self at: #default register: aAKRequestHandler
]

{ #category : #control }
AKHttpServer >> restart [
	self stop.
	self configure.
	^ self start
]

{ #category : #control }
AKHttpServer >> start [
	self assertIsNotRunning.
	znServer start.
	^ self
]

{ #category : #control }
AKHttpServer >> stop [
	znServer stop.
	self disableLog.
	^ self
]

{ #category : #options }
AKHttpServer >> withDefaultApp: aConfigurationBlock [
	|app|
	self assertIsNotRunning.
	app := AKMvcKernel new.
	aConfigurationBlock value: app.
	self registerDefault: app
]
