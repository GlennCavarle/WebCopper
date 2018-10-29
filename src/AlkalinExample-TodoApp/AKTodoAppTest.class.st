Class {
	#name : #AKTodoAppTest,
	#superclass : #TestCase,
	#category : #'AlkalinExample-TodoApp'
}

{ #category : #tests }
AKTodoAppTest >> test [
	| k deleteAllResponse createResponse listResponse getOneResponse deleteResponse emptyListResponse id  |
	k := AKTodoAppConfig createKernel.
	
	deleteAllResponse := (k handleRequest: (AKJsonRequest delete:'/todos')).
	self assert: deleteAllResponse isSuccess.
	
	createResponse := (k handleRequest: (AKJsonRequest 
		post:'/todos' data:{#text -> 'doSomething'} asDictionary)).
	self assert: createResponse isSuccess.
	
	listResponse := (k handleRequest: (AKJsonRequest get:'/todos')).
	self assert: listResponse isSuccess.
	id := (NeoJSONReader fromString: listResponse contents) first at:#id.
	
	getOneResponse := (k handleRequest: (AKJsonRequest get:'/todos/',id)).
	self assert: getOneResponse isSuccess.
	
	deleteResponse := (k handleRequest: (AKJsonRequest delete:'/todos/',id)).
	self assert: deleteResponse isSuccess.
	
	emptyListResponse := (k handleRequest: (AKJsonRequest get:'/todos')).
	self assert: emptyListResponse isSuccess.
	self assert: (NeoJSONReader fromString: emptyListResponse contents) isEmpty.
	
]

{ #category : #tests }
AKTodoAppTest >> testWithAuth [
	| k noAuthResponse |
	k := AKTodoAppConfig createKernel.
	
	noAuthResponse := k handleRequest: (AKJsonRequest get: '/admin').
	self assert: noAuthResponse isAuthenticationRequired
]
