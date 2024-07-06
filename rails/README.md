# Rails 2024 README

[![](https://img.shields.io/badge/Ruby-3.1.2p20-red.svg)](https://www.ruby-lang.org/en/) [![](https://img.shields.io/badge/Rails-7.0.3.1-red.svg)](https://rubyonrails.org/)

## Local Development

Outside **Docker**:

1. Run this once: `gem update && gem install bundler`.
   * One may need to update: `/c/Users/<MY_USER>/AppData/Local/Microsoft/WindowsApps/bundle` per [these](../README.md) instructions.
   * Also the many dependencies [here](./web/Dockerfile).
2. Execute this command without reinstalling `bundler` on subsequent runs (if needed): `bundle install`.

Using Docker:

1. Log into **Docker Destop** > **Exec**.
2. Run the relevant commands below.

## Rake and Database

> From within the [Ruby/Web](_ruby/web) directory.

Initialize and launch:

```ZSH
rails db:create
rails db:migrate
rake db:seed
rails server --binding=127.0.0.1
```

> By default, the Ruby on Rails server will server from: http://localhost:3000/

Migrations (only):

```ZSH
bin/rails generate migration ExampleMigration
rails db:migrate
# rake db:migrate
```

To reset the DB locally:
```ZSH
# run migration and seeding
rails db:setup 
# rails db:create
# rails db:migrate
# rake db:seed

rails db:reset
```

Test:
```ZSH
rails db:environment:set RAILS_ENV=test
rake test 
```

## Helpful Commands

Create Model and Table:

```ZSH
rails g model Example name:text
rails g model SubExample name:text
```

Create Controller:

```ZSH
rails g controller Examples
```

## Endpoints

1. http://localhost:3000/rails/info/routes
2. http://localhost:3000/examples

## Helpful Resources

1. https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-macos
2. https://bobbyhadz.com/blog/react-router-not-found-page
3. https://www.tutorialspoint.com/ruby-on-rails/rails-migrations.htm
4. https://apidock.com/rails/ActiveRecord/Base/create/class
5. https://ninjadevel.com/seeding-database-ruby-on-rails/
6. https://www.digitalocean.com/community/tutorials/build-a-restful-json-api-with-rails-5-part-one#api-endpoints
7. https://www.tutorialspoint.com/ruby-on-rails/rails-routes.htm
8. https://dev.to/caicindy87/rendering-json-in-a-rails-api-25fd
9. https://guides.rubyonrails.org/association_basics.html
10. https://fullstackheroes.com/tutorials/rails/column-types/
11. https://www.stackhawk.com/blog/rails-cors-guide/