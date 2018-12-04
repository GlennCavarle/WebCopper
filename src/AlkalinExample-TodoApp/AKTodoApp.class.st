Class {
	#name : #AKTodoApp,
	#superclass : #AKKernel,
	#category : #'AlkalinExample-TodoApp-App'
}

{ #category : #configuring }
AKTodoApp class >> defaultConfiguration [
	^ AKTodoAppConfig new
]
