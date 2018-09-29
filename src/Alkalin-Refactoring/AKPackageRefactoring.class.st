Class {
	#name : #AKPackageRefactoring,
	#superclass : #Object,
	#category : #'Alkalin-Refactoring'
}

{ #category : #'as yet unclassified' }
AKPackageRefactoring class >> findPackagesByRegex: aPackageRegex [
	^ RPackageOrganizer default packages select: [ :each | aPackageRegex asRegex matches: each name ]
]

{ #category : #'as yet unclassified' }
AKPackageRefactoring class >> fullRenamePackagePrefix: pOldPrefix to: pNewPrefix andClassPrefix: classOldPrefix to: classNewPrefix [
	|pRegex|
	pRegex := pNewPrefix,'.*'.
	self renamePrefix: pOldPrefix to: pNewPrefix.
	
	AKClassRefactoring  renamePrefix: classOldPrefix to: classNewPrefix inPackagesNamed: pRegex.
	AKClassRefactoring  renamePrefix: ('T',classOldPrefix) to: ('T',classNewPrefix) inPackagesNamed: pRegex.
	
	AKMethodRefactoring renamePrefix: ('as',classOldPrefix) to: ('as',classNewPrefix) inPackagesNamed: pRegex.
	AKMethodRefactoring renamePrefix: ('is',classOldPrefix) to: ('is',classNewPrefix) inPackagesNamed: pRegex.
]

{ #category : #'as yet unclassified' }
AKPackageRefactoring class >> renamePrefix: oldPrefix to: newPrefix [
	| packages |
	packages := RPackageOrganizer default packages
		select: [ :each | each name beginsWith: oldPrefix ]
		thenDo: [ :each | 
			| newPackageName |
			newPackageName := (newPrefix , (each name allButFirst: oldPrefix size)) asSymbol.
			Transcript crShow: '[' , self name , '] ' , 'rename package ' , each name , ' to ' , newPackageName.
			each renameTo: newPackageName ]
]
