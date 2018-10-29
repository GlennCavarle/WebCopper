Class {
	#name : #AKTodoController,
	#superclass : #Object,
	#instVars : [
		'repository'
	],
	#category : #'AlkalinExample-TodoApp'
}

{ #category : #actions }
AKTodoController >> doCreate: aRequest [
	| newModel text |
	text := aRequest bodyAt: #text.
	newModel := AKTodo withId: OID new text: text.
	self repository add: newModel.
	^ newModel
]

{ #category : #actions }
AKTodoController >> doDelete: aRequest [
	|id|
	id := (aRequest paramAt:#id).
	self repository removeById: id.
	
	^ AKJsonResponse code: 200 data: { #message -> 'ok' } asDictionary
]

{ #category : #actions }
AKTodoController >> doDeleteAll: aRequest [

	self repository removeAll.
	
	^ AKJsonResponse code: 200 data: { #message -> 'ok' } asDictionary
]

{ #category : #actions }
AKTodoController >> doGetList: aRequest [
	| list |
	
	list := self repository selectAll.
	
	^ list
]

{ #category : #actions }
AKTodoController >> doGetOne: aRequest [
	| id model |
	
	id := aRequest paramAt: #id.
	model := self repository selectById: id.
	
	^ model
]

{ #category : #actions }
AKTodoController >> doUpdate: aRequest [
	|id data model |
	
	id := aRequest paramAt: #id.
	data := aRequest body.
	
	model := self repository selectById: id.
	model text: (data at:#text).
		
	^ model 
]

{ #category : #initialization }
AKTodoController >> initialize [
	super initialize.
	
]

{ #category : #accessing }
AKTodoController >> repository [
	^ repository
]

{ #category : #accessing }
AKTodoController >> repository: anObject [
	repository := anObject
]
