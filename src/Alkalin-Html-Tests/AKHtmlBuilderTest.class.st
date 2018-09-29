Class {
	#name : #AKHtmlBuilderTest,
	#superclass : #TestCase,
	#category : #'Alkalin-Html-Tests'
}

{ #category : #tests }
AKHtmlBuilderTest >> testHelloWorldHtml5 [
	^ AKHtmlDocument new
		doctype: [ :dt | dt beHTML5 ];
		html: [ :r | r
				head: [ :h | h 
					title: [ :title | title text: 'Hello World !' ] ];
				body: [ :body | body 
					div: [ :div | div
						strong: [ :strong | strong text: 'Hello World !' ] ] ] ]
]

{ #category : #tests }
AKHtmlBuilderTest >> testSimpleForm [
	 | form |
	
	form := AKHtmlForm new
		action:'http://localhost';
		method:#GET;
		h1: [:h| h text: 'Hello' ];
		h2: [:h| h text: 'World' ];
		textInput:[:input| input beRequired].
		
	AKHtmlRenderer renderHtml: form
]
