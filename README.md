#	Rails README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



#	antibiogram app


##	creation

```BASH
rails generate model Susceptibility antibiogram:references species:references drug:references isolate:integer value:integer
rails generate model Species name:string
rails generate model Drug name:string
rails generate scaffold Antibiogram
```



