# The HttpRouter Component

The HttpRouter maps http requests to actions.

## Standalone usage

```smalltalk

rc := AKRouteCollection new.

rc addRoute:[:rb| rb
    path:'/route/:arg';
    method: #GET;
    action:[ :req| "do something"]].

request := AKHttpRequest get:'/route/foo'.

"check if a matching route exists"
rc matchRequest: request.

"retrieve the matching AKRoute instance"
route := rc routeForRequest: request.

"and execute the route's action"
route action executeForRequest: request.
```

## Route

### Defining routes with the RouteBuilder

A route definition is built using a RouteBuilder.  
The RouteBuilder provides 6 configuration parts :

* **name** : the name of the route
* **methods** : the allowed http methods (e.g GET, POST, ...)
* **path** : the url path route
* **constraints** : constraints for the values of the placeholders (can be defined in path directly)
* **action** : the action to be executes (e.g ClosureAction or CallAction)
* **defaults** : the default values for placeholders or any arbitrary variables


### Paths and placeholders
A route path is basically a regex checked over a request url.

```smalltalk
"static path"
'/route/foo'.
"static path with regex"
'/route/.*'.
"dynamic argument"
'/route/:arg'.
"dynamic argument with regex contraint"
'/route/:arg(\d+)'.
"dynamic argument with predefined contraint (ex: int,any,string)"
'/route/:arg(int)'.
"dynamic argument with custom class contraint"
'/route/:arg(ConstraintClass)'
```

## Actions

[todo] ClosureAction and CallAction