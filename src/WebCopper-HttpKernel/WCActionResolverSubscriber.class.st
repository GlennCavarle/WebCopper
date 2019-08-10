"
I am an Event Subscriber.
I subscribe to FilterActionEvent.

If the Action receiver refers to a service, i replace it by the concrete instance retrieved from the ServiceContainer
"
Class {
	#name : #WCActionResolverSubscriber,
	#superclass : #WCEventSubscriber,
	#instVars : [
		'serviceContainer'
	],
	#category : #'WebCopper-HttpKernel-EventListener'
}

{ #category : #accessing }
WCActionResolverSubscriber class >> serviceContainer: aAKServiceContainer [
	^ self new
		serviceContainer: aAKServiceContainer;
		yourself
]

{ #category : #'event handling' }
WCActionResolverSubscriber >> onFilterAction: aAKMvcFilterActionEvent [
	"try resolve action receiver"

	| action receiverInstance |
	action := aAKMvcFilterActionEvent action.
	(action isWCCallAction and: [ action receiver isWCRef ]) ifFalse: [ ^ self ].
	receiverInstance :=  action receiver resolveUsing: self serviceContainer.
	aAKMvcFilterActionEvent action receiver: receiverInstance
]

{ #category : #accessing }
WCActionResolverSubscriber >> serviceContainer [
	^ serviceContainer
]

{ #category : #accessing }
WCActionResolverSubscriber >> serviceContainer: anObject [
	serviceContainer := anObject
]

{ #category : #accessing }
WCActionResolverSubscriber >> subscriptions [
	^ {(WCEventSubscription eventClass: WCKernelFilterActionEvent selector: #onFilterAction:)}
]
