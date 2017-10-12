# Skeleton::Platform

This is a skeleton pattern for a platform application written in Ruby.

The purpose of this repository is to house business logic for a particular domain, that might be used across a variety of services & applications. Logic in this service generally shouldn't be built with the sole purpose of supporting an individual use-case: it should instead be written for the purpose of reusability for many use cases. (That's what makes it a platform.)

##### For example...

An "Orders" platform application, which manages the lifecycle of orders. It would describe what an order looks like, and the rules that dictate how orders are fulfilled. It can read, or mutate the state of orders. It can also make calls to external services for data.

It would *NOT* concern itself with actually persistence of order data to a database, querying that data from database, or reading user input/serializing output in specific formats (such as JSON/HTTP.)

##### Generally speaking...

**It should contain**:

  - *Business objects*:

    Ruby classes representing objects in your domain, equivalent to Rails models, but without the ActiveRecord/database stuff.

  - *Service objects*:

    A.k.a. interactors/use cases. These are 'actions' that often require the use of different kinds of business objects. Often have an associated `Request`/`Response` objects. Used primarly to decouple business objects, or to encapsulate complex logic that doesn't belong in business objects.

    e.g. `PropertyTaxComputationService`: `Request` object is made from an `Assessment`, array of `TaxCredit`. Computes the final property tax bill, and returns a `Response` object with `total_deductions` and `total_owed`.

  - Interfaces for inputs/outputs:

    Define common interfaces for inputs/outputs from the library (but NOT implementation within those interfaces). These abstractions make it easier to design adapters and components in other gems that you can swap in to alter the behavior of the library.

    e.g. An `OrderRepository` module, that gets and retrieves orders. The interface defines (but does not implement) `def find(id)` and `def save(order)`. One could then author adapter gems that implement this interface for specific datastores, such as a PostgresSQL, Cassandra, or Redis. These adapters would be interchangeable, and allow an engineer to easily configure a new datastore, without having to alter the library.

**It should *NOT* contain**:

Anything that doesn't directly concern your business domain or business logic. Particularly implementation details.

  - Routes, controllers, or other HTTP specific paradigms (see `platform-rails`)
  - Database implementation, such as ActiveRecord/SQL (see `platform-postgresql-ruby`)
  - Logging, event, or analytics implementation (see `logging-ruby`, `events-ruby`, `analytics-ruby`)

Basically, if it's implementation for a named application, service or protocol, don't add it. Create an abstract interface for it here, then implement it in another gem which you can 'plug-in' to the library.

##### A typical control flow through the library:

```
--> Request object
  --> Service object (use case)
    --> Repository/service interfaces
      <-- Business objects
  <-- Response object
```

## Get started

##### If you just want to test-drive the gem...

This gem can be built and run in a Docker container:

1. Install dependencies:
    - [Docker Engine](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/)
    - [Docker Compose](https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-16-04)
    - `make`
1. Build the Docker image with `make build-image`

##### If you want to clone it for your own use...

1. **Create a new empty repo on GitHub**

1. **[Download the repo ZIP](https://github.com/delner-skeleton/platform-ruby/archive/master.zip), extract, and initiate the repo**

    ```bash
    $ cd APPLICATION-ruby
    $ git init
    $ git remote add origin git@github.com:ORGANIZATION/APPLICATION-ruby.git
    ```

1. **Swap out application name**

    Do the following with case-sensitive find & replace:

    - Find & replace all `PLATFORM-RUBY` with `APPLICATION-RUBY`
    - Find & replace all `PLATFORM_RUBY` with `APPLICATION_RUBY`
    - Find & replace all `Platform::Ruby` with `Application::Ruby`
    - Find & replace all `PlatformRuby` with `ApplicationRuby`
    - Find & replace all `platform_ruby` with `application_ruby`
    - Find & replace all `platform-ruby` with `application-ruby`
    - Find & replace all `platformruby` with `applicationruby`
    - Find & replace all `SKELETON-PLATFORM` with `ORGANIZATION-APPLICATION`
    - Find & replace all `SKELETON_PLATFORM` with `ORGANIZATION_APPLICATION`
    - Find & replace all `Skeleton::Platform` with `Organization::Application`
    - Find & replace all `SkeletonPlatform` with `OrganizationApplication`
    - Find & replace all `skeleton_platform` with `organization_application`
    - Find & replace all `skeleton-platform` with `organization-application`
    - Find & replace all `skeletonplatform` with `organizationapplication`
    - Rename the library:

        ```bash
        $ mv lib/skeleton/platform lib/skeleton/application
        $ mv lib/skeleton/platform.rb lib/skeleton/application.rb
        $ mv lib/skeleton lib/organization
        $ mv spec/skeleton/platform lib/skeleton/application
        $ mv spec/skeleton lib/organization
        $ mv skeleton-platform.gemspec organization-application.gemspec
        ```

1. Push up your changes to your repo

    ```bash
    $ git push -u origin master
    ```

*TODO: Add more instructions...*

## Developing

Access a shell session with `make bash`.

Access a Ruby console with `make console`.

Run linter with `make rubocop`.

*TODO: Add more instructions...*

## Testing

Run `make rspec` to run the RSpec test suite.

*TODO: Add more instructions...*

## Contributing

*TODO: Add instructions...*
