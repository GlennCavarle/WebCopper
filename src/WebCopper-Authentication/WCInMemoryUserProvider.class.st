Class {
	#name : #WCInMemoryUserProvider,
	#superclass : #WCAbstractAuthProvider,
	#instVars : [
		'users'
	],
	#category : #'WebCopper-Authentication-UserProvider'
}

{ #category : #adding }
WCInMemoryUserProvider >> addUser: aUser [
	users add: aUser
]

{ #category : #authenticating }
WCInMemoryUserProvider >> authenticateToken: aToken [
	|authUser|
	
	authUser := users detect: [ :eachUser | 
		eachUser username = aToken username 
			and: [ eachUser password = aToken password ] ].
		
	^ aToken 
		user: authUser;
		clearCredentials;
		beAuthenticated;
		yourself.
]

{ #category : #initialization }
WCInMemoryUserProvider >> initialize [
	super initialize.
	users := OrderedCollection new
]

{ #category : #testing }
WCInMemoryUserProvider >> supportsToken: aToken [
	^ aToken isKindOf: WCUserPwdToken
]

{ #category : #adding }
WCInMemoryUserProvider >> users [
	^ users
]
