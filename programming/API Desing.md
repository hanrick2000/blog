
### API Paradigms
#### Request–Response APIs
#### Rest(Representational State Transfer)
- resource-oriented, CRUD
- URL only decides the location. Headers (Accept and Content-Type, etc.) decide the representation. HTTP methods(GET/POST/PUT/DELETE) decide the state transfer.
- Use PUT for replacing a resource and PATCH for partial updates for existing resources.
- Use POST for creating new resources.
- non-crud operations
  - part of body, like subresource: xx//lock
- HATEOAS (HTML interface for HTTP)
  - not really work

##### Pros
- widely used, easy to develop and pass firewall
- easier to use, as it uses the standard and limited http verb
- 
- good for experimentation and debugging
- 
##### Cron
- 

#### RPC
- focused on actions and exposing behaviors
- [programmer writes essentially the same code whether the subroutine is local to the executing program, or remote, without the programmer explicitly coding the details for this remote interaction](https://puncsky.com/hacking-the-software-engineer-interview)
- used for performance reasons with internal communications
- multiple actions, action-based API methods
- generated client libraries
- works great for APIs that are more complex than simple CRUD and expose a variety of actions
- Cron
  - hard to debug
#### Implementation
- Thrift, grpc
- IDL for managing this interface
  - strict interface definitions, reject at client side

#### [GraphQL](https://piotrminkowski.wordpress.com/2018/08/16/graphql-the-future-of-microservices/)
- A query language for APIs: clients define the structure of the response
- Improved performance: reduced payload size and less round trips 
- typed, standard batch apis

### Event-Driven APIs
#### [WebHooks](https://brandur.org/webhooks)
- a URL where API providers send a POST request when something happens
- Disadvantages:
  - No ordering guarantees
  - Version upgrades
  - Security
    - client has to make another call to get the message's full content
  - Easy yo be abused
#### [GraphQL subscriptions](https://graphql.org/blog/subscriptions-in-graphql-and-relay/)

#### WebSockets
- Two-way streaming connection over TCP
- File Descriptor Limits
- Ephemeral Port Limits
  - ports don't become available straight away after they've been used
#### HTTP Streaming
- Long-lived connection over HTTP

- Protocol Buffers
  - static type
  - easy to upgrade schema
    - change field name
    - deprecate a field
  - support hierarchical data, sub class.
  * [Protocol Buffers over Rest](https://piotrminkowski.wordpress.com/2017/06/05/exposing-microservices-over-rest-protocol-buffers/)
  
- Bulk Endpoints
- Reduce Size of response
  - pagination
    - Offset-based, Cursor-Based
  - filter
  - different way to sort
  - 

#### Error Code


### Security
#### OAuth

- versioning
- 
#### API Design Principles
- intuitively consistent
  - users are able to guess without checking the doc
- Troubleshooting friendly
  - meaningful errors
- Monitoring


#### How to Scale
- Monitor, Metrics, test, profile in dev env, load testing
- Analyze your API usage and patterns
- Indexes
- Caching
  - edge caching, POP, DNS
- Asynchronously
- Rate-Limiting


