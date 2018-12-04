Class {
	#name : #AKTodoRepository,
	#superclass : #Object,
	#instVars : [
		'data'
	],
	#category : #'AlkalinExample-TodoApp-Repository'
}

{ #category : #adding }
AKTodoRepository >> add: aModel [
	data at: aModel id put: aModel
]

{ #category : #initialization }
AKTodoRepository >> initialize [ 
	super initialize.
	data := Dictionary new
]

{ #category : #adding }
AKTodoRepository >> removeAll [
	data removeAll
]

{ #category : #adding }
AKTodoRepository >> removeById: aModelId [
	data removeKey: aModelId
]

{ #category : #adding }
AKTodoRepository >> selectAll [
	^ data values
]

{ #category : #adding }
AKTodoRepository >> selectById: aModelId [
	^ data at: aModelId
]
