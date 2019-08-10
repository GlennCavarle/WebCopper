"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestAlkalinHttpRouter,
	#superclass : #PackageManifest,
	#category : #'WebCopper-HttpRouter-Manifest'
}

{ #category : #'code-critics' }
ManifestAlkalinHttpRouter class >> ruleRBIfTrueReturnsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#WCRouteCollection #matchRequest: #false)) #'2018-12-04T14:44:21.347254+01:00') )
]
