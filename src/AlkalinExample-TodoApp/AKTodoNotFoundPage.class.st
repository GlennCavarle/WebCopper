Class {
	#name : #AKTodoNotFoundPage,
	#superclass : #AKTodoPageLayout,
	#category : #'AlkalinExample-TodoApp-Template'
}

{ #category : #templating }
AKTodoNotFoundPage >> pageContent: aBody [
	aBody 
		h1:[:h1| h1 text:'404 Page Not Found'];
		div:[:div| div 
			span:[:span| span text: '404 Page Not Found']]
]
