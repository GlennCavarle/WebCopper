Class {
	#name : #AKHttpConnectionsTest,
	#superclass : #TestCase,
	#category : #'Alkalin-HttpServer-Tests'
}

{ #category : #private }
AKHttpConnectionsTest >> httpGet: anUrl [
	^ ZnClient new
		beOneShot;
		timeout:5;
		url: anUrl;
		get;
		response.
]

{ #category : #private }
AKHttpConnectionsTest >> httpPost: anUrl jsonData: anObject [
	^ ZnClient new
		beOneShot;
		url: anUrl;
		entity:  (ZnEntity 
			with: (NeoJSONWriter toString: anObject) 
			type: ZnMimeType applicationJson);
		post;
		response.
]
