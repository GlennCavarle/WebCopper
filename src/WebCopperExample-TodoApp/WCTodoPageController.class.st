Class {
	#name : #WCTodoPageController,
	#superclass : #Object,
	#category : #'WebCopperExample-TodoApp-Controller'
}

{ #category : #actions }
WCTodoPageController >> doNotFound: aRequest [
	
	^ WCHtmlResponse 
		code: 404 
		data: (WCHtmlRenderer renderHtml: WCTodoNotFoundPage new)
]
