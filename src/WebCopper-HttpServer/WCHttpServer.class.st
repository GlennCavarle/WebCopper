"
I am a web server (singleton) built around ZnServer.

I use AKHttpRequest as the default request class. (using ZnServer>>reader:)
I use AKHttpServerDispatcher as the default request handler (using ZnServer>>delegate: ).
"
Class {
	#name : #WCHttpServer,
	#superclass : #Object,
	#traits : 'TWCAssertion',
	#classTraits : 'TWCAssertion classTrait',
	#instVars : [
		'znServer',
		'dispatcher'
	],
	#classVars : [
		'uniqueInstance'
	],
	#category : #'WebCopper-HttpServer-Server'
}

{ #category : #asserting }
WCHttpServer class >> assertionsEnabled [
	<return: #Boolean>
	^ WCGlobalSettings assertionsEnabled
]

{ #category : #configuring }
WCHttpServer class >> defaultDispatcher [
	^ WCHttpServerDispatcher new
]

{ #category : #'instance creation' }
WCHttpServer class >> new [
	self error: 'Use #uniqueInstance'
]

{ #category : #'instance creation' }
WCHttpServer class >> on [
	self reset.
	^ self uniqueInstance 
]

{ #category : #'instance creation' }
WCHttpServer class >> reset [
	self stop.
	uniqueInstance := nil
]

{ #category : #'instance creation' }
WCHttpServer class >> restart [
	^ self uniqueInstance restart
]

{ #category : #'instance creation' }
WCHttpServer class >> stop [
	uniqueInstance ifNotNil: [ uniqueInstance stop ].
	^ self
]

{ #category : #'instance creation' }
WCHttpServer class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := super new]
]

{ #category : #asserting }
WCHttpServer >> assertIsNotRunning [
	self 
		assert: [ znServer isRunning not ] 
		description: [ 'Server is already running' ]
]

{ #category : #'handler registration' }
WCHttpServer >> at: aPathPrefix register: aAKRequestHandler [
	self assertIsNotRunning.
	dispatcher map: aPathPrefix to: aAKRequestHandler.
	aAKRequestHandler registredAtPrefix: aPathPrefix
]

{ #category : #options }
WCHttpServer >> debugMode: aBoolean [ 
	self assertIsNotRunning.
	znServer debugMode: aBoolean
]

{ #category : #options }
WCHttpServer >> disableLog [
	ZnLogEvent announcer unsubscribe: self.
]

{ #category : #options }
WCHttpServer >> enableLog [
	self disableLog.
	ZnLogEvent announcer when: ZnLogEvent do: [ :event | WCLogger info: event asString ].
]

{ #category : #initialization }
WCHttpServer >> initialize [
	super initialize.
	dispatcher := self class defaultDispatcher.
	self initializeInternalServer
]

{ #category : #initialization }
WCHttpServer >> initializeInternalServer [
	
	znServer := ZnServer defaultServerClass new.
	znServer reader: [ :stream | WCHttpRequest readFrom: stream ].
	znServer delegate: dispatcher
]

{ #category : #options }
WCHttpServer >> port: aPort [
	self assertIsNotRunning.
	znServer port: aPort
]

{ #category : #'handler registration' }
WCHttpServer >> registerDefault: aAKRequestHandler [
	self at: #default register: aAKRequestHandler
]

{ #category : #control }
WCHttpServer >> restart [
	self stop.
	^ self start
]

{ #category : #control }
WCHttpServer >> start [
	self assertIsNotRunning.
	znServer start.
	^ self
]

{ #category : #control }
WCHttpServer >> stop [
	znServer stop.
	self disableLog.
	^ self
]

{ #category : #options }
WCHttpServer >> withDefaultKernel: aConfigurationBlock [
	|app|
	self assertIsNotRunning.
	app := WCKernel new.
	aConfigurationBlock value: app.
	self registerDefault: app
]
