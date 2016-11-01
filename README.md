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
cat >> config/initializers/inflections.rb <<ENDOFHEREDOC
ActiveSupport::Inflector.inflections(:en) do |inflect|
	inflect.irregular 'species', 'specieses'
end
ENDOFHEREDOC
rails generate scaffold Antibiogram
rails generate model Species name:string
rails generate model Drug name:string
rails generate model Susceptibility antibiogram:references species:references drug:references isolate:integer value:integer
```



