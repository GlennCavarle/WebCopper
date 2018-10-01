Class {
	#name : #AKComplexExampleConfiguration,
	#superclass : #AKKernelConfig,
	#category : #'AlkalinExample-ComplexApp-App'
}

{ #category : #configuring }
AKComplexExampleConfiguration >> configureHandlers: anHandlerMiddleware [
	anHandlerMiddleware 
		map: AKExampleCreateUserCommand to: #CreateUserHandler
]

{ #category : #configuring }
AKComplexExampleConfiguration >> configureRouter: aRouter [
	aRouter
		addRoute: [ :route | route
				path: '/users';
				methods: #(POST);
				action: (AKCallAction call: #doCreateUser: on: #SampleCtrl) ]
			
		
]

{ #category : #configuring }
AKComplexExampleConfiguration >> configureServiceContainer: container [
		
	container
		
		addDefinition:[:def| def
				identifier: #SampleCtrl ;
				targetClass: AKComplexExampleController;
				methodCall: #commandBus: -> {#CommandBus asAKServiceRef}];
			
		addDefinition:[:def| def
				identifier: #CommandBus ;
				targetClass: AKMessageBus;
				methodCall:  #addMiddleware: -> {#HandlerMiddleware asAKServiceRef}];
		
		addDefinition:[:def| def
				identifier: #HandlerMiddleware ;
				targetClass: AKHandlerMiddleware;
				methodCall:  #serviceContainer withArgs: {#ServiceContainer asAKServiceRef};
				configure:[:hmw| self configureHandlers: hmw] ];
			
	
		addDefinition:[:def| def
				identifier: #CreateUserHandler ;
				targetClass: AKExampleCreateUserHandler;
				constructor: #new]
			
]
