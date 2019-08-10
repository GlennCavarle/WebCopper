Class {
	#name : #WCTodoApp,
	#superclass : #WCKernel,
	#category : #'WebCopperExample-TodoApp-App'
}

{ #category : #configuring }
WCTodoApp class >> defaultConfiguration [
	^ WCTodoAppConfig new
]
