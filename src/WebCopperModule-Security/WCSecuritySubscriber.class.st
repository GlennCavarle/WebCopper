Class {
	#name : #WCSecuritySubscriber,
	#superclass : #WCEventSubscriber,
	#instVars : [
		'authenticatorMap'
	],
	#category : #'WebCopperModule-Security-EventListener'
}

{ #category : #'as yet unclassified' }
WCSecuritySubscriber class >> withAuthenticatorMap: anAuthenticatorMap [
	^ self new
		authenticatorMap: anAuthenticatorMap;
		yourself
]

{ #category : #accessing }
WCSecuritySubscriber >> authenticatorMap [
	^ authenticatorMap
]

{ #category : #accessing }
WCSecuritySubscriber >> authenticatorMap: anObject [
	authenticatorMap := anObject
]

{ #category : #'event handling' }
WCSecuritySubscriber >> onRequest: aRequestEvent [
	| authResult |
	(self authenticatorMap needsAuthentication: aRequestEvent request) ifFalse:[^ self].
	authResult := self authenticatorMap authenticateRequest: aRequestEvent request.
	authResult response ifNotNil: [ :anHttpResponse | aRequestEvent response: anHttpResponse ]
]

{ #category : #accessing }
WCSecuritySubscriber >> subscriptions [
	^ {(WCEventSubscription eventClass: WCKernelRequestEvent selector: #onRequest: priority: 100)}
]
