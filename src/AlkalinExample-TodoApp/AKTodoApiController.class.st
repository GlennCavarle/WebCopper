Class {
	#name : #AKTodoApiController,
	#superclass : #Object,
	#instVars : [
		'repository'
	],
	#category : #'AlkalinExample-TodoApp-Controller'
}

{ #category : #actions }
AKTodoApiController >> doCreate: aRequest [
	| newModel text |
	text := aRequest bodyAt: #text.
	newModel := AKTodo withId: UUID new text: text.
	self repository add: newModel.
	^ newModel
]

{ #category : #actions }
AKTodoApiController >> doDelete: aRequest [
	|id|
	id := (aRequest paramAt:#id).
	self repository removeById: (UUID fromString:id).
	
	^ AKJsonResponse code: 200 data: { #message -> 'ok' } asDictionary
]

{ #category : #actions }
AKTodoApiController >> doDeleteAll: aRequest [

	self repository removeAll.
	
	^ AKJsonResponse code: 200 data: { #message -> 'ok' } asDictionary
]

{ #category : #actions }
AKTodoApiController >> doGetList: aRequest [
	| list |
	
	list := self repository selectAll.
	
	^ list
]

{ #category : #actions }
AKTodoApiController >> doGetOne: aRequest [
	| id model |
	
	id := aRequest paramAt: #id.
	model := self repository selectById: (UUID fromString:id).
	
	^ model
]

{ #category : #actions }
AKTodoApiController >> doUpdate: aRequest [
	|id data model |
	
	id := aRequest paramAt: #id.
	data := aRequest body.
	
	model := self repository selectById: (UUID fromString: id).
	model text: (data at:#text).
		
	^ model 
]

{ #category : #initialization }
AKTodoApiController >> initialize [
	super initialize.
	
]

{ #category : #accessing }
AKTodoApiController >> repository [
	^ repository
]

{ #category : #accessing }
AKTodoApiController >> repository: anObject [
	repository := anObject
]
