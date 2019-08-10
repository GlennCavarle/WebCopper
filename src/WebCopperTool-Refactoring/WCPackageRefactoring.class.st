Class {
	#name : #WCPackageRefactoring,
	#superclass : #Object,
	#category : #'WebCopperTool-Refactoring'
}

{ #category : #'as yet unclassified' }
WCPackageRefactoring class >> findPackagesByRegex: aPackageRegex [
	^ RPackageOrganizer default packages select: [ :each | aPackageRegex asRegex matches: each name ]
]

{ #category : #'as yet unclassified' }
WCPackageRefactoring class >> fullRenamePackagePrefix: pOldPrefix to: pNewPrefix andClassPrefix: classOldPrefix to: classNewPrefix [
	|pRegex|
	pRegex := pNewPrefix,'.*'.
	self renamePrefix: pOldPrefix to: pNewPrefix.
	
	WCClassRefactoring  renamePrefix: classOldPrefix to: classNewPrefix inPackagesNamed: pRegex.
	WCClassRefactoring  renamePrefix: ('T',classOldPrefix) to: ('T',classNewPrefix) inPackagesNamed: pRegex.
	
	WCMethodRefactoring renamePrefix: ('as',classOldPrefix) to: ('as',classNewPrefix) inPackagesNamed: pRegex.
	WCMethodRefactoring renamePrefix: ('is',classOldPrefix) to: ('is',classNewPrefix) inPackagesNamed: pRegex.
]

{ #category : #'as yet unclassified' }
WCPackageRefactoring class >> renamePrefix: oldPrefix to: newPrefix [
	| packages |
	packages := RPackageOrganizer default packages
		select: [ :each | each name beginsWith: oldPrefix ]
		thenDo: [ :each | 
			| newPackageName |
			newPackageName := (newPrefix , (each name allButFirst: oldPrefix size)) asSymbol.
			Transcript crShow: '[' , self name , '] ' , 'rename package ' , each name , ' to ' , newPackageName.
			each renameTo: newPackageName ]
]
