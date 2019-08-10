Class {
	#name : #WCTodoPageLayout,
	#superclass : #WCHtmlTemplate,
	#category : #'WebCopperExample-TodoApp-Template'
}

{ #category : #templating }
WCTodoPageLayout >> insertBody: aBody [
	self pageContent: aBody
]

{ #category : #templating }
WCTodoPageLayout >> insertTitle: aTitle [
	aTitle text: 'Todo App'
]

{ #category : #templating }
WCTodoPageLayout >> pageContent: aBody [
	
]
