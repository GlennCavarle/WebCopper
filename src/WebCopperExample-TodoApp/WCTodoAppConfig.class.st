Class {
	#name : #WCTodoAppConfig,
	#superclass : #WCKernelConfig,
	#category : #'WebCopperExample-TodoApp-App'
}

{ #category : #configuring }
WCTodoAppConfig >> configureRouter: aRouter [
	aRouter
						
		addRoute: [ :rb | rb
				name: #todo_get_list;
				method: #GET path: '/todos';
				callAction: #doGetList: on: #TodoCtrl asWCServiceRef ];
			
		addRoute: [ :rb | rb
				name: #todo_get_one ;
				method: #GET path: '/todos/:id(any)';
				callAction: #doGetOne: on: #TodoCtrl asWCServiceRef  ];
			
		addRoute: [ :rb | rb
				name: #todo_create ;
				method: #POST path: '/todos';
				callAction: #doCreate: on: #TodoCtrl asWCServiceRef];
		
		addRoute: [ :rb | rb
				name: #todo_delete ;
				method: #DELETE path: '/todos/:id(any)';
				callAction: #doDelete: on: #TodoCtrl asWCServiceRef ];
			
	   addRoute: [ :rb | rb
				name: #todo_delete_all ;
				method: #DELETE path: '/todos';
				callAction: #doDeleteAll: on: #TodoCtrl asWCServiceRef ];
		
		addRoute: [ :rb | rb
				name: #not_found;
				method: #GET path: '/404';
				callAction: #doNotFound: on: #PageCtrl asWCServiceRef ]
		
]

{ #category : #configuring }
WCTodoAppConfig >> configureSecurity: aSecurityConfig [
	aSecurityConfig
	
		addAuthProvider:[:apBuilder|apBuilder
				providerClass: #WCInMemoryUserProvider;
				configure:[:p|p
					addUser: (WCUser username: 'John' password: 'password');
					addUser: (WCUser username: 'Brenda' password: 'password')]];
	 
		addAuthenticator:[ :authBuilder| authBuilder 
				urlRegex: '^/admin.*';
				authenticatorClass: #WCBasicAuthenticator].
]

{ #category : #configuring }
WCTodoAppConfig >> configureServiceContainer: container [
		
	container
		addDefinition:[:def| def
				identifier: #PageCtrl;
				targetClass: WCTodoPageController ];
			
		addDefinition:[:def| def
				identifier: #TodoCtrl;
				targetClass: WCTodoApiController;
				methodCall: #repository: withArgs: { #TodoRepo asWCServiceRef} ];
			
		addDefinition:[:def| def
				identifier: #TodoRepo;
				targetClass: WCTodoRepository ]
		
	
]

{ #category : #accessing }
WCTodoAppConfig >> extensions [
	^ {
		WCActionResolverExtension new.
		WCRegisterTaggedListenersExtension new.
	}
]

{ #category : #accessing }
WCTodoAppConfig >> modules [
	^ {
		WCSecurityModule new
	}
]
