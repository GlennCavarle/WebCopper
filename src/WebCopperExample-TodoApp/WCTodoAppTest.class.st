Class {
	#name : #WCTodoAppTest,
	#superclass : #TestCase,
	#category : #'WebCopperExample-TodoApp-App'
}

{ #category : #tests }
WCTodoAppTest >> test [
	| k deleteAllResponse createResponse listResponse getOneResponse deleteResponse emptyListResponse id  |
	k := WCTodoApp new.
	
	deleteAllResponse := (k handleRequest: (WCJsonRequest delete:'/todos')).
	self assert: deleteAllResponse isSuccess.
	
	createResponse := (k handleRequest: (WCJsonRequest 
		post:'/todos' data:{#text -> 'doSomething'} asDictionary)).
	self assert: createResponse isSuccess.
	
	listResponse := (k handleRequest: (WCJsonRequest get:'/todos')).
	self assert: listResponse isSuccess.
	id := (NeoJSONReader fromString: listResponse contents) first at:#id.
	
	getOneResponse := (k handleRequest: (WCJsonRequest get:'/todos/',id)).
	self assert: getOneResponse isSuccess.
	
	deleteResponse := (k handleRequest: (WCJsonRequest delete:'/todos/',id)).
	self assert: deleteResponse isSuccess.
	
	emptyListResponse := (k handleRequest: (WCJsonRequest get:'/todos')).
	self assert: emptyListResponse isSuccess.
	self assert: (NeoJSONReader fromString: emptyListResponse contents) isEmpty.
	
]

{ #category : #tests }
WCTodoAppTest >> testHtmlPage [
	| k resp  |
	k := WCTodoApp new.
	
	resp := (k handleRequest: (WCHtmlRequest get:'/404')).
	self assert: resp isNotFound.
	self assert: resp contentType equals: ZnMimeType textHtml
	
	
]

{ #category : #tests }
WCTodoAppTest >> testWithAuth [
	| k noAuthResponse |
	k := WCTodoApp new.
	
	noAuthResponse := k handleRequest: (WCJsonRequest get: '/admin').
	self assert: noAuthResponse isAuthenticationRequired
]
