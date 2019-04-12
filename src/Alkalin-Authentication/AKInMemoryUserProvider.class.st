Class {
	#name : #AKInMemoryUserProvider,
	#superclass : #AKAbstractAuthProvider,
	#instVars : [
		'users'
	],
	#category : #'Alkalin-Authentication-UserProvider'
}

{ #category : #adding }
AKInMemoryUserProvider >> addUser: aUser [
	users add: aUser
]

{ #category : #authenticating }
AKInMemoryUserProvider >> authenticateToken: aToken [
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
AKInMemoryUserProvider >> initialize [
	super initialize.
	users := OrderedCollection new
]

{ #category : #testing }
AKInMemoryUserProvider >> supportsToken: aToken [
	^ aToken isKindOf: AKUserPwdToken
]

{ #category : #adding }
AKInMemoryUserProvider >> users [
	^ users
]
