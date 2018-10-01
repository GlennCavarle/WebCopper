"
I am an Event Subscriber.
I subscribe to FilterActionEvent.

If the Action receiver refers to a service, i replace it by the concrete instance retrieved from the ServiceContainer
"
Class {
	#name : #AKActionResolverSubscriber,
	#superclass : #AKEventSubscriber,
	#instVars : [
		'serviceContainer'
	],
	#category : #'Alkalin-HttpKernel-EventListener'
}

{ #category : #accessing }
AKActionResolverSubscriber class >> serviceContainer: aAKServiceContainer [
	^ self new
		serviceContainer: aAKServiceContainer;
		yourself
]

{ #category : #'event handling' }
AKActionResolverSubscriber >> onFilterAction: aAKMvcFilterActionEvent [
	"try resolve action receiver"

	| action receiverInstance |
	action := aAKMvcFilterActionEvent action.
	(action isAKCallAction and: [ action receiver isAKRef ]) ifFalse: [ ^ self ].
	receiverInstance :=  action receiver resolveUsing: self serviceContainer.
	aAKMvcFilterActionEvent action receiver: receiverInstance
]

{ #category : #accessing }
AKActionResolverSubscriber >> serviceContainer [
	^ serviceContainer
]

{ #category : #accessing }
AKActionResolverSubscriber >> serviceContainer: anObject [
	serviceContainer := anObject
]

{ #category : #accessing }
AKActionResolverSubscriber >> subscriptions [
	^ {(AKEventSubscription eventClass: AKKernelFilterActionEvent selector: #onFilterAction:)}
]
