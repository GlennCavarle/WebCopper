Class {
	#name : #AKTodoPageLayout,
	#superclass : #AKHtmlTemplate,
	#category : #'AlkalinExample-TodoApp-Template'
}

{ #category : #templating }
AKTodoPageLayout >> insertBody: aBody [
	self pageContent: aBody
]

{ #category : #templating }
AKTodoPageLayout >> insertTitle: aTitle [
	aTitle text: 'Todo App'
]

{ #category : #templating }
AKTodoPageLayout >> pageContent: aBody [
	
]
