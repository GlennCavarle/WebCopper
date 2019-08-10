Class {
	#name : #WCTodoRepository,
	#superclass : #Object,
	#instVars : [
		'data'
	],
	#category : #'WebCopperExample-TodoApp-Repository'
}

{ #category : #adding }
WCTodoRepository >> add: aModel [
	data at: aModel id put: aModel
]

{ #category : #initialization }
WCTodoRepository >> initialize [ 
	super initialize.
	data := Dictionary new
]

{ #category : #adding }
WCTodoRepository >> removeAll [
	data removeAll
]

{ #category : #adding }
WCTodoRepository >> removeById: aModelId [
	data removeKey: aModelId
]

{ #category : #adding }
WCTodoRepository >> selectAll [
	^ data values
]

{ #category : #adding }
WCTodoRepository >> selectById: aModelId [
	^ data at: aModelId
]
