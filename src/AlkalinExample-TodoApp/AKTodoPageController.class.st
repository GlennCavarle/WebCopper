Class {
	#name : #AKTodoPageController,
	#superclass : #Object,
	#category : #'AlkalinExample-TodoApp-Controller'
}

{ #category : #actions }
AKTodoPageController >> doNotFound: aRequest [
	
	^ AKHtmlResponse 
		code: 404 
		data: (AKHtmlRenderer renderHtml: AKTodoNotFoundPage new)
]
