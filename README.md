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
rails generate scaffold Antibiogram
rails generate model Bacterium name:string
rails generate model Drug name:string
rails generate model Isolate antibiogram:references bacterium:references value:integer
rails generate model Susceptibility isolate:references drug:references value:integer
```



