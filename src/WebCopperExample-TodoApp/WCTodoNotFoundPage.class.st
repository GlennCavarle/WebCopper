Class {
	#name : #WCTodoNotFoundPage,
	#superclass : #WCTodoPageLayout,
	#category : #'WebCopperExample-TodoApp-Template'
}

{ #category : #templating }
WCTodoNotFoundPage >> pageContent: aBody [
	aBody 
		h1:[:h1| h1 text:'404 Page Not Found'];
		div:[:div| div 
			span:[:span| span text: '404 Page Not Found']]
]
