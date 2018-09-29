Class {
	#name : #AKTodoAppConfig,
	#superclass : #AKMvcKernelConfig,
	#category : #'AlkalinExample-TodoApp'
}

{ #category : #configuring }
AKTodoAppConfig >> configureRouter: aRouter [
	aRouter
		addRoute: [ :rb | rb
				name: #todo_get_list;
				method: #GET path: '/todos';
				call: #doGetList: on: #TodoCtrl asAKServiceRef ];
			
		addRoute: [ :rb | rb
				name: #todo_get_one ;
				method: #GET path: '/todos/:id(uuid)';
				call: #doGetOne: on: #TodoCtrl asAKServiceRef  ];
			
		addRoute: [ :rb | rb
				name: #todo_create ;
				method: #POST path: '/todos';
				call: #doCreate: on: #TodoCtrl asAKServiceRef];
		
		addRoute: [ :rb | rb
				name: #todo_delete ;
				method: #DELETE path: '/todos/:id(uuid)';
				call: #doDelete: on: #TodoCtrl asAKServiceRef ]
		
]

{ #category : #configuring }
AKTodoAppConfig >> configureServiceContainer: container [
		
	container
	
		addDefinition:[:def| def
				identifier: #ActionResolverSubscriber;
				targetClass: AKActionResolverSubscriber;
				constructor: #serviceContainer: withArgs: { #ServiceContainer asAKServiceRef };
				tag: (AKDiTag name:#eventSubscriber)];
			
		addDefinition:[:def| def
				identifier: #TodoCtrl;
				targetClass: AKTodoController;
				methodCall: #repository: withArgs: { #TodoRepo asAKServiceRef} ];
			
		addDefinition:[:def| def
				identifier: #TodoRepo;
				targetClass: AKTodoRepository ]
	
]
