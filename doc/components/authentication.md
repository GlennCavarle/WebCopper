# Authentication

The Authentication component is based on several concepts allowing the definition of custom authentication systems:

* **AuthProvider**: how to retrieve something (e.g the User) from a token
* **AuthProviderManager**: how to manage multiple Auth Providers
* **Authenticator**: how to craft a token from input request
* **AuthenticatorMap**: how to map urls to authenticators
* **Token**: how to represent credentials
* **AuthenticationService**: how to check user rights


## Standalone usage

```smalltalk
authProvider := WCInMemoryUserProvider new
	addUser: (WCUser username: 'John' password: 'password');
	addUser: (WCUser username: 'Brenda' password: 'password').
		
basicAuth := WCBasicAuthenticator new
    authProviderManager:
        (WCAuthProviderManager withProviders: {authProvider});
    yourself.
	
map := WCAuthenticatorMap new
    map: (WCUrlMatcher fromRegex: '^/admin.*') to: basicAuth;
    yourself.

aRequest := WCHttpRequest get: '/admin'.
aRequest setBasicAuthenticationUsername: 'John' password: 'password'.

result := map authenticateRequest: aRequest.

```
