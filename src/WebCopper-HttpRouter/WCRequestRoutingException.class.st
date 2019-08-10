Class {
	#name : #WCRequestRoutingException,
	#superclass : #WCRoutingException,
	#instVars : [
		'request'
	],
	#category : #'WebCopper-HttpRouter-Exception'
}

{ #category : #accessing }
WCRequestRoutingException >> request [
	^ request
]

{ #category : #accessing }
WCRequestRoutingException >> request: anObject [
	request := anObject
]
