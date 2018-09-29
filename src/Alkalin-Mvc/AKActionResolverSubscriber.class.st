Class {
	#name : #AKActionResolverSubscriber,
	#superclass : #AKEventSubscriber,
	#instVars : [
		'serviceContainer'
	],
	#category : #'Alkalin-Mvc-EventListener'
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
	(action isAKCallAction and: [ action receiver isAKRef ])
		ifFalse: [ ^ self ].
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
	^ {(AKEventSubscription eventClass: AKMvcFilterActionEvent selector: #onFilterAction:)}
]
