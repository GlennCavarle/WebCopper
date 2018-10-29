Class {
	#name : #AKTodoRepository,
	#superclass : #WRRepository,
	#category : #'AlkalinExample-TodoApp'
}

{ #category : #accessing }
AKTodoRepository class >> defaultModelClass [
	^ #AKTodo
]
