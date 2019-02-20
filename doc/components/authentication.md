# Authentication

The Authentication component is based on several concepts allowing the definition of custom authentication systems:

* **UserProvider**: how to retrieve a user from a token
* **UserProviderManager**: how to manage multiple User Providers
* **Authenticator**: how to craft a token from input request
* **AuthenticatorMap**: how to map urls to authenticators
* **Token**: how to represent credentials
* **AuthenticationService**: how to check user rights


## Standalone usage

```smalltalk
userProvider := AKInMemoryUserProvider new
	addUser: (AKUser username: 'John' password: 'password');
	addUser: (AKUser username: 'Brenda' password: 'password').
		
basicAuth := AKBasicAuthenticator new
    userProviderManager:
        (AKUserProviderManager withProviders: {userProvider});
    yourself.
	
map := AKAuthenticatorMap new
    map: (AKUrlMatcher fromRegex: '^/admin.*') to: basicAuth;
    yourself.

aRequest := AKHttpRequest get: '/admin'.
aRequest setBasicAuthenticationUsername: 'John' password: 'password'.

result := map authenticateRequest: aRequest.

```
