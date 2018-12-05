Class {
	#name : #AKTodoAppConfig,
	#superclass : #AKKernelConfig,
	#category : #'AlkalinExample-TodoApp-App'
}

{ #category : #configuring }
AKTodoAppConfig >> configureRouter: aRouter [
	aRouter
						
		addRoute: [ :rb | rb
				name: #todo_get_list;
				method: #GET path: '/todos';
				callAction: #doGetList: on: #TodoCtrl asAKServiceRef ];
			
		addRoute: [ :rb | rb
				name: #todo_get_one ;
				method: #GET path: '/todos/:id(any)';
				callAction: #doGetOne: on: #TodoCtrl asAKServiceRef  ];
			
		addRoute: [ :rb | rb
				name: #todo_create ;
				method: #POST path: '/todos';
				callAction: #doCreate: on: #TodoCtrl asAKServiceRef];
		
		addRoute: [ :rb | rb
				name: #todo_delete ;
				method: #DELETE path: '/todos/:id(any)';
				callAction: #doDelete: on: #TodoCtrl asAKServiceRef ];
			
	   addRoute: [ :rb | rb
				name: #todo_delete_all ;
				method: #DELETE path: '/todos';
				callAction: #doDeleteAll: on: #TodoCtrl asAKServiceRef ];
		
		addRoute: [ :rb | rb
				name: #not_found;
				method: #GET path: '/404';
				callAction: #doNotFound: on: #PageCtrl asAKServiceRef ]
		
]

{ #category : #configuring }
AKTodoAppConfig >> configureSecurity: aSecurityConfig [
	aSecurityConfig
	
		addUserProvider:[:upBuilder|upBuilder
				providerClass: #AKInMemoryUserProvider;
				configure:[:p|p
					addUser: (AKUser username: 'John' password: 'password');
					addUser: (AKUser username: 'Brenda' password: 'password')]];
	 
		addAuthenticator:[ :authBuilder| authBuilder 
				urlRegex: '^/admin.*';
				authenticatorClass: #AKBasicAuthenticator].
]

{ #category : #configuring }
AKTodoAppConfig >> configureServiceContainer: container [
		
	container
		addDefinition:[:def| def
				identifier: #PageCtrl;
				targetClass: AKTodoPageController ];
			
		addDefinition:[:def| def
				identifier: #TodoCtrl;
				targetClass: AKTodoApiController;
				methodCall: #repository: withArgs: { #TodoRepo asAKServiceRef} ];
			
		addDefinition:[:def| def
				identifier: #TodoRepo;
				targetClass: AKTodoRepository ]
		
	
]

{ #category : #accessing }
AKTodoAppConfig >> extensions [
	^ {
		AKActionResolverExtension new.
		AKRegisterTaggedListenersExtension new.
	}
]

{ #category : #accessing }
AKTodoAppConfig >> modules [
	^ {
		AKSecurityModule new
	}
]
