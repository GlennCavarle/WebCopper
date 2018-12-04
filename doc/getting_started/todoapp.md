# Todo App example

## App Struture

* TodoApp
    * App
        * TodoApp class
        * TodoAppConfig class
    * Controller
        * TodoController class
    * Model
        * Todo class
    * Repository
        * TodoRepository class

## TodoApp class

```smalltalk
TodoApp class >> defaultConfiguration
    ^ TodoAppConfig new
```

## TodoAppConfig class

### Register extensions and modules 

```smalltalk
TodoAppConfig >> extensions
    ^ {
        AKRegisterTaggedListenersExtension new
    }

TodoAppConfig >> modules
    ^ {
        AKSecurityModule new
    }
```


### Configure the service container

```smalltalk
TodoAppConfig >> configureServiceContainer: container
    container
        addDefinition:[:def| def
            identifier: #TodoCtrl;
            targetClass: #AKTodoController;
            methodCall: #repository: 
                withArgs: {#TodoRepo asAKServiceRef} ];
            
        addDefinition:[:def| def
            identifier: #TodoRepo;
            targetClass: #TodoRepository ]
        
        addDefinition:[:def| def
            identifier: #ActionResolverSubscriber;
            targetClass: #AKActionResolverSubscriber;
            constructor: #serviceContainer: 
                withArgs: {#ServiceContainer asAKServiceRef};
            tag: (AKDiTag name:#eventSubscriber)]
        
        
```

### Configure the routing

```smalltalk
TodoAppConfig >> configureRouter: aRouter
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
                callAction: #doDeleteAll: on: #TodoCtrl asAKServiceRef ]
```

### Configure the security module

```smalltalk
TodoAppConfig >> configureSecurity: aSecurityConfig
    aSecurityConfig
        addUserProvider:[:upBuilder|upBuilder
            providerClass: #AKInMemoryUserProvider;
            configure:[:p|p
                addUser: (AKUser username: 'John' password: 'password');
                addUser: (AKUser username: 'Brenda' password: 'password')]];
        
        addAuthenticator:[ :authBuilder| authBuilder 
            urlRegex: '^/todos/.*';
            authenticatorClass: #AKBasicAuthenticator].
```

### TodoController class

```smalltalk
TodoController >> doGetList: aRequest
    ^ self repository selectAll.

TodoController >> doGetOne: aRequest
    | id |
    id := aRequest paramAt: #id.
    ^ self repository selectById: id.

TodoController >> doCreate: aRequest
    | newModel text |
    text := aRequest bodyAt: #text.
    newModel := Todo withId: UUID new text: text.
    self repository add: newModel.
    ^ newModel

TodoController >> doUpdate: aRequest
    |id data model |
    id := aRequest paramAt: #id.
    data := aRequest body.
    model := self repository selectById: id.
    model text: (data at:#text).
    ^ model

TodoController >> doDelete: aRequest
    |id|
    id := (aRequest paramAt:#id).
    self repository removeById: id.

    ^ AKJsonResponse 
        code: 200 
        data: {#message -> 'deletion done'} asDictionary
```

### Run the TodoApp

```smalltalk
AKHttpServer on
    port: 8080;
    registerDefault: TodoApp new;
    start.
```