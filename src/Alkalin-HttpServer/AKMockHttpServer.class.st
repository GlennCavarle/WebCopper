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
	#name : #AKMockHttpServer,
	#superclass : #AKHttpServer,
	#instVars : [
		'isRunning',
		'debugMode',
		'port'
	],
	#category : #'Alkalin-HttpServer-Testing'
}

{ #category : #asserting }
AKMockHttpServer >> assertIsNotRunning [
	self 
		assert: [ isRunning not ] 
		description: [ 'Server is already running' ]
]

{ #category : #options }
AKMockHttpServer >> debugMode: aBoolean [ 
	self assertIsNotRunning.
	debugMode := aBoolean
]

{ #category : #tests }
AKMockHttpServer >> handleRequest: aRequest [
	<return: #AKHttpResponse>

	^ dispatcher handleRequest: aRequest
]

{ #category : #initialization }
AKMockHttpServer >> initialize [
	isRunning := false.
	super initialize
]

{ #category : #initialization }
AKMockHttpServer >> initializeInternalServer [
	
	"no internal server"
]

{ #category : #options }
AKMockHttpServer >> port: aPort [
	self assertIsNotRunning.
	port := aPort
]

{ #category : #control }
AKMockHttpServer >> start [
	self assertIsNotRunning.
	isRunning := true.
	^ self
]

{ #category : #control }
AKMockHttpServer >> stop [
	isRunning := false.
	^ self
]
