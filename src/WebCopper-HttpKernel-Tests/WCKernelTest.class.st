Class {
	#name : #WCKernelTest,
	#superclass : #TestCase,
	#category : #'WebCopper-HttpKernel-Tests'
}

{ #category : #private }
WCKernelTest >> createStoryOn: anApp [
	^ ApcStory new
		description: '';
		httpClient: (ApcHandlerClient on: anApp);
		requestClass: WCHttpRequest;
		yourself
]

{ #category : #tests }
WCKernelTest >> test [

	|k|
	
k := WCKernel new.

k router 
	prefix:'/api';
	GET:'/route/get' -> [ :req| WCHttpResponse accepted];
	GET:'/route/:id(\d+)' -> [ :req| WCHttpResponse accepted].
	

self assert: (k handleRequest: (WCHttpRequest get:'/api/route/get')) isSuccess.
self assert: (k handleRequest: (WCHttpRequest get:'/api/route/12')) isSuccess.
	
]

{ #category : #tests }
WCKernelTest >> testWithApicall [
	| app story |
	app := WCKernel new.
	app router
		prefix: '/api';
		GET: '/route/get' -> [ :req | WCJsonResponse accepted ];
		GET: '/route/:id(\d+)' -> [ :req | WCJsonResponse accepted ].
		
		
	story := self createStoryOn: app.
	story
		when: [ :w | w get: '/api/route/get' ];
		then: [ :t | 
			t status isAccepted.
			t headers hasJsonContentType ];
		execute.
	story
		when: [ :w | w get: '/api/route/12' ];
		then: [ :t | 
			t status isAccepted.
			t headers hasJsonContentType ];
		execute
]
