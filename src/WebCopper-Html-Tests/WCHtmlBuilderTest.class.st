Class {
	#name : #WCHtmlBuilderTest,
	#superclass : #TestCase,
	#category : #'WebCopper-Html-Tests'
}

{ #category : #tests }
WCHtmlBuilderTest >> testHelloWorldHtml5 [
	^ WCHtmlDocument new
		doctype: [ :dt | dt beHTML5 ];
		html: [ :r | r
				head: [ :h | h 
					title: [ :title | title text: 'Hello World !' ] ];
				body: [ :body | body 
					div: [ :div | div
						strong: [ :strong | strong text: 'Hello World !' ] ] ] ]
]

{ #category : #tests }
WCHtmlBuilderTest >> testSimpleForm [
	 | form |
	
	form := WCHtmlForm new
		action:'http://localhost';
		method:#GET;
		h1: [:h| h text: 'Hello' ];
		h2: [:h| h text: 'World' ];
		textInput:[:input| input beRequired].
		
	WCHtmlRenderer renderHtml: form
]
