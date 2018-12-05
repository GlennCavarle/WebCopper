"
I am the heart of the Alkalin system.
I use dependency injection and event dispatching to orchestrate the request lifecycle.
I can be configured using AKKernelConfig and extended by AKKernelExtension and AKKernelModule.
"
Class {
	#name : #AKKernel,
	#superclass : #Object,
	#traits : 'TAKRequestHandler',
	#classTraits : 'TAKRequestHandler classTrait',
	#instVars : [
		'serviceContainer',
		'configuration',
		'extensions',
		'modules'
	],
	#category : #'Alkalin-HttpKernel-Kernel'
}

{ #category : #'instance creation' }
AKKernel class >> configure: aConfigurationBlock [
	| app |
	app := self new.
	aConfigurationBlock value: app.
	^ app
]

{ #category : #configuring }
AKKernel class >> defaultConfiguration [
	^ AKKernelConfig new
]

{ #category : #configuring }
AKKernel class >> defaultEventDispatcher [
	^ AKEventDispatcher new
]

{ #category : #configuring }
AKKernel class >> defaultRouter [
	^ AKRouteCollection new
]

{ #category : #configuring }
AKKernel class >> defaultServiceContainer [
	^ AKDiContainer new
]

{ #category : #'instance creation' }
AKKernel class >> withConfiguration: aConfiguration [
	^ self basicNew
		initializeWithConfiguration: aConfiguration;
		yourself
]

{ #category : #'public - accessing' }
AKKernel >> configuration [
	^ configuration ifNil: [ configuration := self class defaultConfiguration ]
]

{ #category : #'public - accessing' }
AKKernel >> configuration: anObject [
	configuration := anObject
]

{ #category : #'private - configuring' }
AKKernel >> configure [
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
AKKernel >> configureEventListeners [
	self eventDispatcher
		addSubscriber: (AKRouterSubscriber router: self router);
		addSubscriber: AKResponseBuilderSubscriber new
		
]

{ #category : #'private - configuring' }
AKKernel >> configureServiceContainer [
	
	self serviceContainer
		registerFactory: [ self class defaultRouter ] as: #Router;
		registerFactory: [ self class defaultEventDispatcher ] as: #EventDispatcher
]

{ #category : #'private - request handling' }
AKKernel >> dispatchRequest: aAKRequest onResponseDo: aResponseBlock onActionDo: anActionBlock [
	<return: #AKHttpResponse>
	| requestEvent |
	
	requestEvent := AKKernelRequestEvent request: aAKRequest.
	self eventDispatcher dispatch: requestEvent.
	requestEvent response ifNotNil: [:resp| ^ aResponseBlock value:resp].
	
	requestEvent action ifNil: [ AKActionNotFound signalForRequest: aAKRequest ].
	^ anActionBlock value: requestEvent action
]

{ #category : #'public - accessing' }
AKKernel >> eventDispatcher [
	<return: #AKEventDisptacher>
	
	^ self serviceContainer get: #EventDispatcher
]

{ #category : #'private - request handling' }
AKKernel >> executeAction: aAKAction forRequest: aAKHttpRequest [
	<return: #AKHttpResponse>
		|actionToExecute resultOrResponse|
		
		actionToExecute := self filterAction: aAKAction forRequest: aAKHttpRequest.
		resultOrResponse := actionToExecute executeForRequest: aAKHttpRequest.
		resultOrResponse ifNil:[AKKernelDoesNotReturnResult signalForRequest: aAKHttpRequest action: actionToExecute].
		
		resultOrResponse isHttpResponse ifFalse:[
			resultOrResponse := self responseFromResult: resultOrResponse forRequest: aAKHttpRequest].
		
		resultOrResponse isHttpResponse ifFalse:[
			AKKernelDoesNotReturnHttpResponse signalForRequest: aAKHttpRequest 
				action: actionToExecute result: resultOrResponse].
			
		^ self filterResponse: resultOrResponse forRequest: aAKHttpRequest
	
]

{ #category : #'public - accessing' }
AKKernel >> extensions [
	^ extensions
]

{ #category : #'private - request handling' }
AKKernel >> filterAction: aAKAction forRequest: aAKRequest [
	<return: #AKAction>
		|actionEvent|
				
		actionEvent := AKKernelFilterActionEvent request: aAKRequest action: aAKAction.
		self eventDispatcher dispatch: actionEvent.
		^ actionEvent action.
]

{ #category : #'private - request handling' }
AKKernel >> filterResponse: aAKHttpResponse forRequest: aAKHttpRequest [
	|responseEvent|
	
	responseEvent := AKKernelFilterResponseEvent request: aAKHttpRequest response: aAKHttpResponse.
	self eventDispatcher dispatch: responseEvent.

	^ responseEvent response
]

{ #category : #'private - request handling' }
AKKernel >> handleException: anException forRequest: aAKHttpRequest [
	<return: #AKHttpResponse>
	|exceptionEvent|
	anException signal.	"debug"
		
	exceptionEvent := (AKKernelExceptionEvent request: aAKHttpRequest exception: anException).
	self eventDispatcher dispatch: exceptionEvent.
		
	exceptionEvent response
		ifNotNil: [ :resp | ^ self filterResponse: resp forRequest: aAKHttpRequest ].
		
	^ AKHttpResponse serverError: anException description
]

{ #category : #public }
AKKernel >> handleRequest: aAKHttpRequest [
	<return: #AKHttpResponse>
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
AKKernel >> initialize [
	super initialize.
	extensions := SortedCollection sortBlock: [ :a :b| a class priority < b class priority ].
	modules := SortedCollection sortBlock: [ :a :b| a class priority < b class priority ].
	self configure
]

{ #category : #initialization }
AKKernel >> initializeWithConfiguration: aConfiguration [
	configuration := aConfiguration.
	self initialize.
	
]

{ #category : #'private - configuring' }
AKKernel >> loadExtensions [
	extensions do: [ :each | each load: self serviceContainer config: self configuration ]
]

{ #category : #'private - configuring' }
AKKernel >> loadModules [
	modules do: [ :each | each load: self serviceContainer config: self configuration ]
]

{ #category : #'public - accessing' }
AKKernel >> modules [
	^ modules
]

{ #category : #'private - request handling' }
AKKernel >> responseFromResult: anObject forRequest: aAKHttpRequest [
	<return: #AKHttpResponse>
	| resultEvent |
	
	resultEvent := AKKernelResponseFromResultEvent request: aAKHttpRequest result: anObject.
	self eventDispatcher dispatch: resultEvent.
	^  resultEvent response
]

{ #category : #'public - accessing' }
AKKernel >> router [
	<return: #AKRouter>
	
	^ self serviceContainer get: #Router
]

{ #category : #'public - accessing' }
AKKernel >> serviceContainer [
	<return: #AKDiContainer>
	
	^ serviceContainer
]
