# Todo App example

## Setup

```smalltalk

Metacello new
    baseline: 'WebCopper';
    repository: 'github://GlennCavarle/WebCopper/src';
    load: #('Core' 'SecurityModule').

```

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
        WCRegisterTaggedListenersExtension new
    }

TodoAppConfig >> modules
    ^ {
        WCSecurityModule new
    }
```


### Configure the service container

```smalltalk
TodoAppConfig >> configureServiceContainer: container
    container
        addDefinition:[:def| def
            identifier: #TodoCtrl;
            targetClass: #WCTodoController;
            methodCall: #repository: 
                withArgs: {#TodoRepo asWCServiceRef} ];
            
        addDefinition:[:def| def
            identifier: #TodoRepo;
            targetClass: #TodoRepository ]
        
        addDefinition:[:def| def
            identifier: #ActionResolverSubscriber;
            targetClass: #WCActionResolverSubscriber;
            constructor: #serviceContainer: 
                withArgs: {#ServiceContainer asWCServiceRef};
            tag: (WCDiTag name:#eventSubscriber)]
        
        
```

### Configure the routing

```smalltalk
TodoAppConfig >> configureRouter: aRouter
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
                callAction: #doDeleteAll: on: #TodoCtrl asWCServiceRef ]
```

### Configure the security module

```smalltalk
TodoAppConfig >> configureSecurity: aSecurityConfig
    aSecurityConfig
        addUserProvider:[:upBuilder|upBuilder
            providerClass: #WCInMemoryUserProvider;
            configure:[:p|p
                addUser: (WCUser username: 'John' password: 'password');
                addUser: (WCUser username: 'Brenda' password: 'password')]];
        
        addAuthenticator:[ :authBuilder| authBuilder 
            urlRegex: '^/todos/.*';
            authenticatorClass: #WCBasicAuthenticator].
```

### TodoController class

```smalltalk
TodoController >> doGetList: aRequest
    |list|
    list := self repository selectAll.
    ^ WCJsonResponse code: 200 data: list

TodoController >> doGetOne: aRequest
    | id model |
    id := aRequest paramAt: #id.
    model := self repository selectById: id.
    ^ WCJsonResponse code: 200 data: model

TodoController >> doCreate: aRequest
    | newModel text |
    text := aRequest bodyAt: #text.
    newModel := Todo withId: UUID new text: text.
    self repository add: newModel.
    ^ WCJsonResponse code: 200 data: newModel

TodoController >> doUpdate: aRequest
    |id data model |
    id := aRequest paramAt: #id.
    data := aRequest body.
    model := self repository selectById: id.
    model text: (data at:#text).
    ^ WCJsonResponse code: 200 data: model 

TodoController >> doDelete: aRequest
    |id|
    id := (aRequest paramAt:#id).
    self repository removeById: id.

    ^ WCJsonResponse 
        code: 200 
        data: {#message -> 'deletion done'} asDictionary
```

### Run the TodoApp

```smalltalk
WCHttpServer on
    port: 8080;
    registerDefault: TodoApp new;
    start.
```