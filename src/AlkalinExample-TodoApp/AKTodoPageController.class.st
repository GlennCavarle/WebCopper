Class {
	#name : #AKTodoPageController,
	#superclass : #Object,
	#category : #'AlkalinExample-TodoApp-Controller'
}

{ #category : #actions }
AKTodoPageController >> doNotFound: aRequest [
	
	^ AKTodoNotFoundPage new
]
