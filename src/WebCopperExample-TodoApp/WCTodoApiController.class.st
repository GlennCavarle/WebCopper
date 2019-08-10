Class {
	#name : #WCTodoApiController,
	#superclass : #Object,
	#instVars : [
		'repository'
	],
	#category : #'WebCopperExample-TodoApp-Controller'
}

{ #category : #actions }
WCTodoApiController >> doCreate: aRequest [
	| newModel text |
	text := aRequest bodyAt: #text.
	newModel := WCTodo withId: UUID new text: text.
	self repository add: newModel.
	
	^ WCJsonResponse code: 200 data: newModel
]

{ #category : #actions }
WCTodoApiController >> doDelete: aRequest [
	|id|
	id := (aRequest paramAt:#id).
	self repository removeById: (UUID fromString:id).
	
	^ WCJsonResponse code: 200 data: { #message -> 'ok' } asDictionary
]

{ #category : #actions }
WCTodoApiController >> doDeleteAll: aRequest [

	self repository removeAll.
	
	^ WCJsonResponse code: 200 data: { #message -> 'ok' } asDictionary
]

{ #category : #actions }
WCTodoApiController >> doGetList: aRequest [
	| list |
	
	list := self repository selectAll.
	
	^ WCJsonResponse code: 200 data: list
]

{ #category : #actions }
WCTodoApiController >> doGetOne: aRequest [
	| id model |
	
	id := aRequest paramAt: #id.
	model := self repository selectById: (UUID fromString:id).
	
	^ WCJsonResponse code: 200 data: model
]

{ #category : #actions }
WCTodoApiController >> doUpdate: aRequest [
	|id data model |
	
	id := aRequest paramAt: #id.
	data := aRequest body.
	
	model := self repository selectById: (UUID fromString: id).
	model text: (data at:#text).
		
	^ WCJsonResponse code: 200 data: model 
]

{ #category : #initialization }
WCTodoApiController >> initialize [
	super initialize.
	
]

{ #category : #accessing }
WCTodoApiController >> repository [
	^ repository
]

{ #category : #accessing }
WCTodoApiController >> repository: anObject [
	repository := anObject
]
