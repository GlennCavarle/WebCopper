Class {
	#name : #AKMvcKernel,
	#superclass : #Object,
	#traits : 'TAKRequestHandler',
	#classTraits : 'TAKRequestHandler classTrait',
	#instVars : [
		'serviceContainer',
		'configuration',
		'extensions',
		'modules'
	],
	#category : #'Alkalin-Mvc-Kernel'
}

{ #category : #'instance creation' }
AKMvcKernel class >> configure: aConfigurationBlock [
	| app |
	app := self new.
	aConfigurationBlock value: app.
	^ app
]

{ #category : #configuring }
AKMvcKernel class >> defaultConfiguration [
	^ AKMvcKernelConfig new
]

{ #category : #configuring }
AKMvcKernel class >> defaultEventDispatcher [
	^ AKEventDispatcher new
]

{ #category : #configuring }
AKMvcKernel class >> defaultRouter [
	^ AKRouteCollection new
]

{ #category : #configuring }
AKMvcKernel class >> defaultServiceContainer [
	^ AKDiContainer new
]

{ #category : #'instance creation' }
AKMvcKernel class >> withConfiguration: aConfiguration [
	^ self basicNew
		initializeWithConfiguration: aConfiguration;
		yourself
]

{ #category : #'public - accessing' }
AKMvcKernel >> configuration [
	^ configuration ifNil: [ configuration := self class defaultConfiguration ]
]

{ #category : #'private - configuring' }
AKMvcKernel >> configure [
	| config |
	
	
	serviceContainer := self class defaultServiceContainer.
	config := self configuration.
	extensions := config extensions.
	modules := config modules.
	
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
AKMvcKernel >> configureEventListeners [
	self eventDispatcher
		addSubscriber: (AKRouterSubscriber router: self router);
		addSubscriber: AKResponseBuilderSubscriber new
		
]

{ #category : #'private - configuring' }
AKMvcKernel >> configureServiceContainer [
	
	self serviceContainer
		registerFactory: [ self class defaultRouter ] as: #Router;
		registerFactory: [ self class defaultEventDispatcher ] as: #EventDispatcher
]

{ #category : #'private - request handling' }
AKMvcKernel >> dispatchRequest: aAKRequest ifResponse: aResponseBlock ifAction: anActionBlock [
	<return: #AKHttpResponse>
	| requestEvent |
	
	requestEvent := AKMvcRequestEvent request: aAKRequest.
	self eventDispatcher dispatch: requestEvent.
	requestEvent response ifNotNil: [:resp| ^ aResponseBlock value:resp].
	
	requestEvent action ifNil: [ AKActionNotFound signalForRequest: aAKRequest ].
	^ anActionBlock value: requestEvent action
]

{ #category : #'public - accessing' }
AKMvcKernel >> eventDispatcher [
	<return: #AKEventDisptacher>
	
	^ self serviceContainer get: #EventDispatcher
]

{ #category : #'private - request handling' }
AKMvcKernel >> executeAction: aAKAction forRequest: aAKHttpRequest [
	<return: #AKHttpResponse>
		|actionToExecute resultOrResponse|
		
		actionToExecute := self filterAction: aAKAction forRequest: aAKHttpRequest.
		resultOrResponse := actionToExecute executeForRequest: aAKHttpRequest.
		resultOrResponse ifNil:[AKMvcDoesNotReturnResult signalForRequest: aAKHttpRequest action: actionToExecute].
		
		resultOrResponse isHttpResponse ifFalse:[
			resultOrResponse := self responseFromResult: resultOrResponse forRequest: aAKHttpRequest].
		
		resultOrResponse isHttpResponse ifFalse:[
			AKMvcDoesNotReturnHttpResponse signalForRequest: aAKHttpRequest 
				action: actionToExecute result: resultOrResponse].
			
		^ self filterResponse: resultOrResponse forRequest: aAKHttpRequest
	
]

{ #category : #'private - request handling' }
AKMvcKernel >> filterAction: aAKAction forRequest: aAKRequest [
	<return: #AKAction>
		|actionEvent|
				
		actionEvent := AKMvcFilterActionEvent request: aAKRequest action: aAKAction.
		self eventDispatcher dispatch: actionEvent.
		^ actionEvent action.
]

{ #category : #'private - request handling' }
AKMvcKernel >> filterResponse: aAKHttpResponse forRequest: aAKHttpRequest [
	|responseEvent|
	
	responseEvent := AKMvcFilterResponseEvent request: aAKHttpRequest response: aAKHttpResponse.
	self eventDispatcher dispatch: responseEvent.

	^ responseEvent response
]

{ #category : #'private - request handling' }
AKMvcKernel >> handleException: anException [
	<return: #AKHttpResponse>
	anException signal.
	^ AKHttpResponse serverError: anException description
]

{ #category : #public }
AKMvcKernel >> handleRequest: aAKHttpRequest [
	<return: #AKHttpResponse>
	[ 
		^ self
			dispatchRequest: aAKHttpRequest
			ifResponse: [ :httpResponse | self filterResponse: httpResponse forRequest: aAKHttpRequest]
			ifAction: [ :action | self executeAction: action forRequest: aAKHttpRequest ] 
		
	]
		on: Exception
		do: [ :ex | ^ self handleException: ex ]
]

{ #category : #initialization }
AKMvcKernel >> initialize [
	super initialize.
	self configure
]

{ #category : #initialization }
AKMvcKernel >> initializeWithConfiguration: aConfiguration [
	configuration := aConfiguration.
	self initialize.
	
]

{ #category : #'private - configuring' }
AKMvcKernel >> loadExtensions [
	extensions do: [ :each | each load: self serviceContainer config: self configuration ]
]

{ #category : #'private - configuring' }
AKMvcKernel >> loadModules [
	modules do: [ :each | each load: self serviceContainer config: self configuration ]
]

{ #category : #'private - request handling' }
AKMvcKernel >> responseFromResult: anObject forRequest: aAKHttpRequest [
	<return: #AKHttpResponse>
	| resultEvent |
	
	resultEvent := AKMvcResponseFromResultEvent request: aAKHttpRequest result: anObject.
	self eventDispatcher dispatch: resultEvent.
	^  resultEvent response
]

{ #category : #'public - accessing' }
AKMvcKernel >> router [
	<return: #AKRouter>
	
	^ self serviceContainer get: #Router
]

{ #category : #'public - accessing' }
AKMvcKernel >> serviceContainer [
	<return: #AKDiContainer>
	
	^ serviceContainer
]
