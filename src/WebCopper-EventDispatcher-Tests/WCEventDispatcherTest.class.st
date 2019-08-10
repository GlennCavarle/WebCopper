Class {
	#name : #WCEventDispatcherTest,
	#superclass : #TestCase,
	#category : #'WebCopper-EventDispatcher-Tests'
}

{ #category : #tests }
WCEventDispatcherTest >> testExecutionOrder [

| d evl1 evl2 evl3 counter|
counter := 0.
d := WCEventDispatcher new.

evl1 := [:evt| counter := counter+1. self assert: counter = 1].
evl2 :=  [:evt| counter := counter+1. self assert: counter = 2].
evl3 :=  [:evt|counter := counter+1. self assert: counter = 3].

d addListener: evl1 eventClass: WCEvent  priority: 10.
d addListener: evl2 eventClass: WCEvent  priority: 5.
d addListener: evl3 eventClass: WCEvent  priority: 5.

d dispatch: WCEvent new

]

{ #category : #'listener tests' }
WCEventDispatcherTest >> testListenerAddRemove [

| d evl1 evl2 evl3 counter|
counter := 0.
d := WCEventDispatcher new.

evl1 := [:evt| counter := counter+1. self assert: counter = 1].
evl2 :=  [:evt| counter := counter+1. self assert: counter = 2].
evl3 :=  [:evt|counter := counter+1. self assert: counter = 3].

d addListener: evl1 eventClass: WCEvent  priority: 10.
d addListener: evl2 eventClass: WCEvent  priority: 5.
d addListener: evl3 eventClass: WCEvent  priority: 5.

self assert: d hasListeners.

d removeListener: evl1.
d removeListener: evl2.
d removeListener: evl3.

self assert: d hasListeners not
]

{ #category : #'subscriber tests' }
WCEventDispatcherTest >> testSubscriberAddRemove [

| d sub counter|
counter := 0.
d := WCEventDispatcher new.
sub := WCTestEventSubscriber new.

sub firstBlock: [:evt| counter := counter+1. self assert: counter = 1].
sub secondBlock: [:evt| counter := counter+1. self assert: counter = 2].

d addSubscriber: sub.
self assert: d hasListeners.

d dispatch: WCEvent new.

d removeSubscriber: sub.
self assert: d hasListeners not
]
