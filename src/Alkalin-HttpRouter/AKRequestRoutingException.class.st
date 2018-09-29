Class {
	#name : #AKRequestRoutingException,
	#superclass : #AKRoutingException,
	#instVars : [
		'request'
	],
	#category : #'Alkalin-HttpRouter-Exception'
}

{ #category : #accessing }
AKRequestRoutingException >> request [
	^ request
]

{ #category : #accessing }
AKRequestRoutingException >> request: anObject [
	request := anObject
]
