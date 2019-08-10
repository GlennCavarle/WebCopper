"
I am the heart of the Alkalin system.
I use dependency injection and event dispatching to orchestrate the request lifecycle.
I can be configured using AKKernelConfig and extended by AKKernelExtension and AKKernelModule.
"
Class {
	#name : #WCKernel,
	#superclass : #Object,
	#traits : 'TWCRequestHandler',
	#classTraits : 'TWCRequestHandler classTrait',
	#instVars : [
		'serviceContainer',
		'configuration',
		'extensions',
		'modules'
	],
	#category : #'WebCopper-HttpKernel-Kernel'
}

{ #category : #'instance creation' }
WCKernel class >> configure: aConfigurationBlock [
	| app |
	app := self new.
	aConfigurationBlock value: app.
	^ app
]

{ #category : #configuring }
WCKernel class >> defaultConfiguration [
	^ WCKernelConfig new
]

{ #category : #configuring }
WCKernel class >> defaultEventDispatcher [
	^ WCEventDispatcher new
]

{ #category : #configuring }
WCKernel class >> defaultRouter [
	^ WCRouteCollection new
]

{ #category : #configuring }
WCKernel class >> defaultServiceContainer [
	^ WCDiContainer new
]

{ #category : #'instance creation' }
WCKernel class >> withConfiguration: aConfiguration [
	^ self basicNew
		initializeWithConfiguration: aConfiguration;
		yourself
]

{ #category : #'public - accessing' }
WCKernel >> configuration [
	^ configuration ifNil: [ configuration := self class defaultConfiguration ]
]

{ #category : #'public - accessing' }
WCKernel >> configuration: anObject [
	configuration := anObject
]

{ #category : #'private - configuring' }
WCKernel >> configure [
	| config |
	
	
	serviceContainer := self class defaultServiceContainer.
	config := self configuration.
	extensions addAll: config extensions.
	modules addAll: config modules.
	
	"kernel internal configuration"
	self configureServiceContainer.
	self configureEventListeners.
	
	self loadModules.
	
	"user configuration"
	config configureServiceContainer: serviceContainer.
	config configureEventListeners: self eventDispatcher.
	config configureRouter: self router.
	
	
	self loadExtensions.
	
]

{ #category : #'private - configuring' }
WCKernel >> configureEventListeners [
	self eventDispatcher
		addSubscriber: (WCRouterSubscriber router: self router)
		
]

{ #category : #'private - configuring' }
WCKernel >> configureServiceContainer [
	
	self serviceContainer
		registerFactory: [ self class defaultRouter ] as: #Router;
		registerFactory: [ self class defaultEventDispatcher ] as: #EventDispatcher
]

{ #category : #'private - request handling' }
WCKernel >> dispatchRequest: aAKRequest onResponseDo: aResponseBlock onActionDo: anActionBlock [
	<return: #WCHttpResponse>
	| requestEvent |
	
	requestEvent := WCKernelRequestEvent request: aAKRequest.
	self eventDispatcher dispatch: requestEvent.
	requestEvent response ifNotNil: [:resp| ^ aResponseBlock value:resp].
	
	requestEvent action ifNil: [ WCActionNotFound signalForRequest: aAKRequest ].
	^ anActionBlock value: requestEvent action
]

{ #category : #'public - accessing' }
WCKernel >> eventDispatcher [
	<return: #AKEventDisptacher>
	
	^ self serviceContainer get: #EventDispatcher
]

{ #category : #'private - request handling' }
WCKernel >> executeAction: aAKAction forRequest: aAKHttpRequest [
	<return: #WCHttpResponse>
		|actionToExecute resultOrResponse|
		
		actionToExecute := self filterAction: aAKAction forRequest: aAKHttpRequest.
		resultOrResponse := actionToExecute executeForRequest: aAKHttpRequest.
		resultOrResponse ifNil:[WCKernelDoesNotReturnResult signalForRequest: aAKHttpRequest action: actionToExecute].
		
		resultOrResponse isHttpResponse ifFalse:[
			resultOrResponse := self responseFromResult: resultOrResponse forRequest: aAKHttpRequest].
		
		resultOrResponse isHttpResponse ifFalse:[
			WCKernelDoesNotReturnHttpResponse signalForRequest: aAKHttpRequest 
				action: actionToExecute result: resultOrResponse].
			
		^ self filterResponse: resultOrResponse forRequest: aAKHttpRequest
	
]

{ #category : #'public - accessing' }
WCKernel >> extensions [
	^ extensions
]

{ #category : #'private - request handling' }
WCKernel >> filterAction: aAKAction forRequest: aAKRequest [
	<return: #WCAction>
		|actionEvent|
				
		actionEvent := WCKernelFilterActionEvent request: aAKRequest action: aAKAction.
		self eventDispatcher dispatch: actionEvent.
		^ actionEvent action.
]

{ #category : #'private - request handling' }
WCKernel >> filterResponse: aAKHttpResponse forRequest: aAKHttpRequest [
	|responseEvent|
	
	responseEvent := WCKernelFilterResponseEvent request: aAKHttpRequest response: aAKHttpResponse.
	self eventDispatcher dispatch: responseEvent.

	^ responseEvent response
]

{ #category : #'private - request handling' }
WCKernel >> handleException: anException forRequest: aAKHttpRequest [
	<return: #WCHttpResponse>
	|exceptionEvent|
	anException signal.	"debug"
		
	exceptionEvent := (WCKernelExceptionEvent request: aAKHttpRequest exception: anException).
	self eventDispatcher dispatch: exceptionEvent.
		
	exceptionEvent response
		ifNotNil: [ :resp | ^ self filterResponse: resp forRequest: aAKHttpRequest ].
		
	^ WCHttpResponse serverError: anException description
]

{ #category : #public }
WCKernel >> handleRequest: aAKHttpRequest [
	<return: #WCHttpResponse>
	[ 
		^ self
			dispatchRequest: aAKHttpRequest
			onResponseDo: [ :httpResponse | self filterResponse: httpResponse forRequest: aAKHttpRequest]
			onActionDo: [ :action | self executeAction: action forRequest: aAKHttpRequest ] 
		
	]
		on: Exception
		do: [ :ex | ^ self handleException: ex forRequest: aAKHttpRequest]
]

{ #category : #initialization }
WCKernel >> initialize [
	super initialize.
	extensions := SortedCollection sortBlock: [ :a :b| a class priority < b class priority ].
	modules := SortedCollection sortBlock: [ :a :b| a class priority < b class priority ].
	self configure
]

{ #category : #initialization }
WCKernel >> initializeWithConfiguration: aConfiguration [
	configuration := aConfiguration.
	self initialize.
	
]

{ #category : #'private - configuring' }
WCKernel >> loadExtensions [
	extensions do: [ :each | each load: self serviceContainer config: self configuration ]
]

{ #category : #'private - configuring' }
WCKernel >> loadModules [
	modules do: [ :each | each load: self serviceContainer config: self configuration ]
]

{ #category : #'public - accessing' }
WCKernel >> modules [
	^ modules
]

{ #category : #'private - request handling' }
WCKernel >> responseFromResult: anObject forRequest: aAKHttpRequest [
	<return: #WCHttpResponse>
	| resultEvent |
	
	resultEvent := WCKernelResponseFromResultEvent request: aAKHttpRequest result: anObject.
	self eventDispatcher dispatch: resultEvent.
	^  resultEvent response
]

{ #category : #'public - accessing' }
WCKernel >> router [
	<return: #WCRouter>
	
	^ self serviceContainer get: #Router
]

{ #category : #'public - accessing' }
WCKernel >> serviceContainer [
	<return: #WCDiContainer>
	
	^ serviceContainer
]
