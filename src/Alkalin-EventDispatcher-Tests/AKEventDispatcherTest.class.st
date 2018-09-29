Class {
	#name : #AKEventDispatcherTest,
	#superclass : #TestCase,
	#category : #'Alkalin-EventDispatcher-Tests'
}

{ #category : #tests }
AKEventDispatcherTest >> testExecutionOrder [

| d evl1 evl2 evl3 counter|
counter := 0.
d := AKEventDispatcher new.

evl1 := [:evt| counter := counter+1. self assert: counter = 1].
evl2 :=  [:evt| counter := counter+1. self assert: counter = 2].
evl3 :=  [:evt|counter := counter+1. self assert: counter = 3].

d addListener: evl1 eventClass: AKEvent  priority: 10.
d addListener: evl2 eventClass: AKEvent  priority: 5.
d addListener: evl3 eventClass: AKEvent  priority: 5.

d dispatch: AKEvent new

]

{ #category : #'listener tests' }
AKEventDispatcherTest >> testListenerAddRemove [

| d evl1 evl2 evl3 counter|
counter := 0.
d := AKEventDispatcher new.

evl1 := [:evt| counter := counter+1. self assert: counter = 1].
evl2 :=  [:evt| counter := counter+1. self assert: counter = 2].
evl3 :=  [:evt|counter := counter+1. self assert: counter = 3].

d addListener: evl1 eventClass: AKEvent  priority: 10.
d addListener: evl2 eventClass: AKEvent  priority: 5.
d addListener: evl3 eventClass: AKEvent  priority: 5.

self assert: d hasListeners.

d removeListener: evl1.
d removeListener: evl2.
d removeListener: evl3.

self assert: d hasListeners not
]

{ #category : #'subscriber tests' }
AKEventDispatcherTest >> testSubscriberAddRemove [

| d sub counter|
counter := 0.
d := AKEventDispatcher new.
sub := AKTestEventSubscriber new.

sub firstBlock: [:evt| counter := counter+1. self assert: counter = 1].
sub secondBlock: [:evt| counter := counter+1. self assert: counter = 2].

d addSubscriber: sub.
self assert: d hasListeners.

d dispatch: AKEvent new.

d removeSubscriber: sub.
self assert: d hasListeners not
]
