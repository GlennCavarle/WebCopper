Class {
	#name : #AKEventDispatcher,
	#superclass : #Object,
	#instVars : [
		'listeners'
	],
	#category : #'Alkalin-EventDispatcher'
}

{ #category : #'adding/removing' }
AKEventDispatcher >> addListener: aListener eventClass: anEventClass [ 
	self addListener: aListener eventClass: anEventClass priority: 0
]

{ #category : #'adding/removing' }
AKEventDispatcher >> addListener: aListener eventClass: anEventClass priority: aPriority [
	self at: anEventClass at: aPriority add: aListener
]

{ #category : #'adding/removing' }
AKEventDispatcher >> addSubscriber: aSubscriber [
	aSubscriber subscriptions do: [ :aSub | 
			aSub subscriber: aSubscriber.
			self at: aSub eventClass at: aSub priority add: aSub ]
]

{ #category : #'private accessing' }
AKEventDispatcher >> at: EventClass at: aPriority [
	| eventListeners |
	eventListeners := listeners at: EventClass ifAbsentPut: [ Dictionary new ].
	^ eventListeners at: aPriority ifAbsentPut: [ OrderedCollection new ].
	
]

{ #category : #'private accessing' }
AKEventDispatcher >> at: EventClass at: aPriority add: aListener [
	
	(self at: EventClass at: aPriority) add: aListener asAKEventListener 
]

{ #category : #'private accessing' }
AKEventDispatcher >> at: EventClass at: aPriority remove: aListener [
	
	(self at: EventClass at: aPriority) remove: aListener.
	(self at: EventClass at: aPriority) ifEmpty: [ (listeners at: EventClass) removeKey: aPriority].
	(listeners at: EventClass) ifEmpty:[listeners removeKey: EventClass].
]

{ #category : #'private accessing' }
AKEventDispatcher >> at: EventClass at: aPriority removeAllSuchThat: aBlock [
	(self at: EventClass at: aPriority) 
		select: aBlock thenDo: [ :each | self at: EventClass at: aPriority remove: each ]
]

{ #category : #dispatching }
AKEventDispatcher >> dispatch: anEvent [
	| sortedPriorities eventListeners |
	eventListeners := listeners at: anEvent class ifAbsent: [ ^ self ].
	sortedPriorities := eventListeners keysSortedSafely reversed.
	sortedPriorities do: [ :p | (eventListeners at: p) do: [ :listener | 
			anEvent canBePropagated ifTrue: [ listener handleEvent: anEvent ] ] ]
]

{ #category : #testing }
AKEventDispatcher >> hasListeners [
	^ listeners isNotEmpty
]

{ #category : #initialization }
AKEventDispatcher >> initialize [
	super initialize.
	listeners := Dictionary new
]

{ #category : #'adding/removing' }
AKEventDispatcher >> removeListener: aListener [
	|listenerToRemove|
	listenerToRemove := aListener asAKEventListener.
	
	listeners keysAndValuesDo: [:ek :eventListeners |  
		eventListeners	keysAndValuesDo: [:pk :priorEventListeners | 
			(priorEventListeners includes: listenerToRemove) ifTrue: [ 
				self at: ek at: pk remove: listenerToRemove.
				^ self
			]
		]
	]
]

{ #category : #'adding/removing' }
AKEventDispatcher >> removeListenersSuchThat: aBlock [
	
	listeners keysAndValuesDo: [:ek :eventListeners |  
		eventListeners	keysAndValuesDo: [:pk :priorEventListeners |
				priorEventListeners select: aBlock thenDo: [:listener|
					self at: ek at: pk remove: listener.
				].
		]
	]
]

{ #category : #'adding/removing' }
AKEventDispatcher >> removeSubscriber: aSubscriber [
	aSubscriber subscriptions do: [ :aSub | 
		self at: aSub eventClass at: aSub priority removeAllSuchThat: [ :each | each subscriber = aSubscriber ] ]
]
