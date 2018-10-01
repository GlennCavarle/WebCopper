Class {
	#name : #AKSecuritySubscriber,
	#superclass : #AKEventSubscriber,
	#instVars : [
		'authenticatorMap'
	],
	#category : #'AlkalinModule-Security-EventListener'
}

{ #category : #'as yet unclassified' }
AKSecuritySubscriber class >> withAuthenticatorMap: anAuthenticatorMap [
	^ self new
		authenticatorMap: anAuthenticatorMap;
		yourself
]

{ #category : #accessing }
AKSecuritySubscriber >> authenticatorMap [
	^ authenticatorMap
]

{ #category : #accessing }
AKSecuritySubscriber >> authenticatorMap: anObject [
	authenticatorMap := anObject
]

{ #category : #'event handling' }
AKSecuritySubscriber >> onRequest: aRequestEvent [
	| authResult |
	(self authenticatorMap needsAuthentication: aRequestEvent request) ifFalse:[^ self].
	authResult := self authenticatorMap authenticateRequest: aRequestEvent request.
	authResult response ifNotNil: [ :anHttpResponse | aRequestEvent response: anHttpResponse ]
]

{ #category : #accessing }
AKSecuritySubscriber >> subscriptions [
	^ {(AKEventSubscription eventClass: AKKernelRequestEvent selector: #onRequest: priority: 100)}
]
