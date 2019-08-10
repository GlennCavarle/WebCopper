Class {
	#name : #WCComplexExampleConfiguration,
	#superclass : #WCKernelConfig,
	#category : #'WebCopperExample-ComplexApp-App'
}

{ #category : #configuring }
WCComplexExampleConfiguration >> configureHandlers: anHandlerMiddleware [
	anHandlerMiddleware 
		map: WCExampleCreateUserCommand to: #CreateUserHandler
]

{ #category : #configuring }
WCComplexExampleConfiguration >> configureRouter: aRouter [
	aRouter
		addRoute: [ :route | route
				path: '/users';
				methods: #(POST);
				action: (WCCallAction call: #doCreateUser: on: #SampleCtrl) ]
			
		
]

{ #category : #configuring }
WCComplexExampleConfiguration >> configureServiceContainer: container [
		
	container
		
		addDefinition:[:def| def
				identifier: #SampleCtrl ;
				targetClass: WCComplexExampleController;
				methodCall: #commandBus: -> {#CommandBus asWCServiceRef}];
			
		addDefinition:[:def| def
				identifier: #CommandBus ;
				targetClass: WCMessageBus;
				methodCall:  #addMiddleware: -> {#HandlerMiddleware asWCServiceRef}];
		
		addDefinition:[:def| def
				identifier: #HandlerMiddleware ;
				targetClass: WCHandlerMiddleware;
				methodCall:  #serviceContainer withArgs: {#ServiceContainer asWCServiceRef};
				configure:[:hmw| self configureHandlers: hmw] ];
			
	
		addDefinition:[:def| def
				identifier: #CreateUserHandler ;
				targetClass: WCExampleCreateUserHandler;
				constructor: #new]
			
]
