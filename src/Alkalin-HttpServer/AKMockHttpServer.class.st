Class {
	#name : #AKMockHttpServer,
	#superclass : #AKHttpServer,
	#instVars : [
		'isRunning',
		'debugMode',
		'port'
	],
	#category : #'Alkalin-HttpServer-Server'
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
