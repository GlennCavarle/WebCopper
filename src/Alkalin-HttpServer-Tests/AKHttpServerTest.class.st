Class {
	#name : #AKHttpServerTest,
	#superclass : #TestCase,
	#category : #'Alkalin-HttpServer-Tests'
}

{ #category : #tests }
AKHttpServerTest >> test [
	|server|
	
	server := AKMockHttpServer on
		port: 8080;
		at: '/api' register: (AKMvcKernel configure: [:k| 
					k router
						prefix:'/v2';
						GET:'/route/get' -> [ :req| AKHttpResponse accepted];
						GET:'/route/:id(\d+)' -> [ :req| AKHttpResponse accepted].
	  ]).

self assert: (server handleRequest: (AKHttpRequest get:'/api/v2/route/get')) isSuccess.
self assert: (server handleRequest: (AKHttpRequest get:'/api/v2/route/12')) isSuccess.
]
