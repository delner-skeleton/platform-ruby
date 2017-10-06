# Skeleton::Platform

This is a skeleton pattern for a platform application written in Ruby.

The purpose of this repository is to house business logic for a particular domain, that might be used across a variety of services & applications. Logic in this service generally shouldn't be built with the sole purpose of supporting an individual use-case: it should instead be written for the purpose of reusability for many use cases. (That's what makes it a platform.)

###### For example...

An "Orders" platform application, which manages the lifecycle of orders. It would describe what an order looks like, and the rules that dictate how orders are fulfilled. It can read, or mutate the state of orders. It can also make calls to external services for data.

It would *NOT* concern itself with actually persistence of order data to a database, querying that data from database, or reading user input/serializing output in specific formats (such as JSON/HTTP.)

###### Generally it should...

It contains business objects, service objects, and interfaces (NOT implementation) for inputs/outputs.

It does *NOT* contain:

  - Routes, controllers, or other HTTP specific paradigms (see `platform-rails`)
  - Database implementation, such as ActiveRecord/SQL (see `platform-postgresql-ruby`)
  - Logging, event, or analytics implementation (see `logging-ruby`, `events-ruby`, `analytics-ruby`)

General flow across components in a nutshell:

```
--> Request object
  --> Service object (use case)
    --> Repository/service interfaces
      <-- Business objects
  <-- Response object
```

## Get started

*TODO: Add instructions...*

## Testing

*TODO: Add instructions...*

## Contributing

*TODO: Add instructions...*
