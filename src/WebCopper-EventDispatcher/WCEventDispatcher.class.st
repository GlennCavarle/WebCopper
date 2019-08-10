Class {
	#name : #WCEventDispatcher,
	#superclass : #Object,
	#instVars : [
		'listeners'
	],
	#category : #'WebCopper-EventDispatcher'
}

{ #category : #'adding/removing' }
WCEventDispatcher >> addListener: aListener eventClass: anEventClass [ 
	self addListener: aListener eventClass: anEventClass priority: 0
]

{ #category : #'adding/removing' }
WCEventDispatcher >> addListener: aListener eventClass: anEventClass priority: aPriority [
	self at: anEventClass at: aPriority add: aListener
]

{ #category : #'adding/removing' }
WCEventDispatcher >> addSubscriber: aSubscriber [
	aSubscriber subscriptions do: [ :aSub | 
			aSub subscriber: aSubscriber.
			self at: aSub eventClass at: aSub priority add: aSub ]
]

{ #category : #'private accessing' }
WCEventDispatcher >> at: EventClass at: aPriority [
	| eventListeners |
	eventListeners := listeners at: EventClass ifAbsentPut: [ Dictionary new ].
	^ eventListeners at: aPriority ifAbsentPut: [ OrderedCollection new ].
	
]

{ #category : #'private accessing' }
WCEventDispatcher >> at: EventClass at: aPriority add: aListener [
	
	(self at: EventClass at: aPriority) add: aListener asWCEventListener 
]

{ #category : #'private accessing' }
WCEventDispatcher >> at: EventClass at: aPriority anySatisfy: aBlock [
	^ (self at: EventClass at: aPriority) anySatisfy: aBlock
]

{ #category : #'private accessing' }
WCEventDispatcher >> at: EventClass at: aPriority remove: aListener [
	
	(self at: EventClass at: aPriority) remove: aListener.
	(self at: EventClass at: aPriority) ifEmpty: [ (listeners at: EventClass) removeKey: aPriority].
	(listeners at: EventClass) ifEmpty:[listeners removeKey: EventClass].
]

{ #category : #'private accessing' }
WCEventDispatcher >> at: EventClass at: aPriority removeAllSuchThat: aBlock [
	(self at: EventClass at: aPriority) 
		select: aBlock thenDo: [ :each | self at: EventClass at: aPriority remove: each ]
]

{ #category : #dispatching }
WCEventDispatcher >> dispatch: anEvent [
	| sortedPriorities eventListeners |
	eventListeners := listeners at: anEvent class ifAbsent: [ ^ self ].
	sortedPriorities := eventListeners keysSortedSafely reversed.
	sortedPriorities do: [ :p | (eventListeners at: p) do: [ :listener | 
			anEvent canBePropagated ifTrue: [ listener handleEvent: anEvent ] ] ]
]

{ #category : #testing }
WCEventDispatcher >> hasListeners [
	^ listeners isNotEmpty
]

{ #category : #testing }
WCEventDispatcher >> hasSubscriber: aSubscriber [
	^ aSubscriber subscriptions allSatisfy: [ :aSub | 
		self at: aSub eventClass at: aSub priority anySatisfy: [ :each | each subscriber class = aSubscriber class ] ]
]

{ #category : #initialization }
WCEventDispatcher >> initialize [
	super initialize.
	listeners := Dictionary new
]

{ #category : #'adding/removing' }
WCEventDispatcher >> removeListener: aListener [
	|listenerToRemove|
	listenerToRemove := aListener asWCEventListener.
	
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
WCEventDispatcher >> removeListenersSuchThat: aBlock [
	
	listeners keysAndValuesDo: [:ek :eventListeners |  
		eventListeners	keysAndValuesDo: [:pk :priorEventListeners |
				priorEventListeners select: aBlock thenDo: [:listener|
					self at: ek at: pk remove: listener.
				].
		]
	]
]

{ #category : #'adding/removing' }
WCEventDispatcher >> removeSubscriber: aSubscriber [
	aSubscriber subscriptions do: [ :aSub | 
		self at: aSub eventClass at: aSub priority removeAllSuchThat: [ :each | each subscriber = aSubscriber ] ]
]
