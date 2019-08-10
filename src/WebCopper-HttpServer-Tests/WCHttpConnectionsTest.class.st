Class {
	#name : #WCHttpConnectionsTest,
	#superclass : #TestCase,
	#category : #'WebCopper-HttpServer-Tests'
}

{ #category : #private }
WCHttpConnectionsTest >> httpGet: anUrl [
	^ ZnClient new
		beOneShot;
		timeout:5;
		url: anUrl;
		get;
		response.
]

{ #category : #private }
WCHttpConnectionsTest >> httpPost: anUrl jsonData: anObject [
	^ ZnClient new
		beOneShot;
		url: anUrl;
		entity:  (ZnEntity 
			with: (NeoJSONWriter toString: anObject) 
			type: ZnMimeType applicationJson);
		post;
		response.
]
