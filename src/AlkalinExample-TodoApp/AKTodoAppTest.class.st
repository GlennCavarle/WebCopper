Class {
	#name : #AKTodoAppTest,
	#superclass : #TestCase,
	#category : #'AlkalinExample-TodoApp'
}

{ #category : #tests }
AKTodoAppTest >> test [
	| k createResponse listResponse getOneResponse deleteResponse emptyListResponse id  |
	k := AKTodoAppConfig createKernel.
	
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
