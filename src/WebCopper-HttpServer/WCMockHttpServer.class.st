"
I am a mock version of AKHttpServer.
I am used to test request dispatching.

example:

server := AKMockHttpServer on
	port: 8080;
	""what ever""
	start.

server handleRequest: (AKHttpRequest get:'/test')
"
Class {
	#name : #WCMockHttpServer,
	#superclass : #WCHttpServer,
	#instVars : [
		'isRunning',
		'debugMode',
		'port'
	],
	#category : #'WebCopper-HttpServer-Testing'
}

{ #category : #asserting }
WCMockHttpServer >> assertIsNotRunning [
	self 
		assert: [ isRunning not ] 
		description: [ 'Server is already running' ]
]

{ #category : #options }
WCMockHttpServer >> debugMode: aBoolean [ 
	self assertIsNotRunning.
	debugMode := aBoolean
]

{ #category : #tests }
WCMockHttpServer >> handleRequest: aRequest [
	<return: #WCHttpResponse>

	^ dispatcher handleRequest: aRequest
]

{ #category : #initialization }
WCMockHttpServer >> initialize [
	isRunning := false.
	super initialize
]

{ #category : #initialization }
WCMockHttpServer >> initializeInternalServer [
	
	"no internal server"
]

{ #category : #options }
WCMockHttpServer >> port: aPort [
	self assertIsNotRunning.
	port := aPort
]

{ #category : #control }
WCMockHttpServer >> start [
	self assertIsNotRunning.
	isRunning := true.
	^ self
]

{ #category : #control }
WCMockHttpServer >> stop [
	isRunning := false.
	^ self
]
