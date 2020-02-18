http://inch-ci.org/github/basselalsayed/acebook-derailed.svg?branch=master

# AceBook Derailed
The anti-social network

# Created by
Bassel Al-Sayed,
Ben Auld,
Ilias Grigoropoulos,
Vish Mayer,

### Learning documentation

## Database Setup
To set up a migration:
* `rails generate migration [NameOfMigrationInCamelCase]`
* `rails db:reset`
* `rails db:migrate`
* add validations as necessary to the models
  * for example: `validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX`

## Travis integration with heroku
* set up online accounts with heroku and travis
* install CLI interfaces
* set up continuous deployment (if CI passes) via heroku pipeline/settings page online
* `travis encrypt $(heroku auth:token) --add deploy.api_key`
* 
## Controller Set up
* `rails g controller [name] [route]`
* `rails g controller post index create show destroy`

## Model set up
* `rails g controller [name] [attribute:type]`
* `rails g model post message:text` 
  
## Rails scaffold to create MVC all in one
* `rails g scaffold [name] [model attribute:type]`
* `rails g scaffold post message:text`

## User authentication 
* In the future, devise gem can be used to set up authentication quickly
* In our project, a sessions controller was manually generated using the above methods, it uses a session variable (cookie) to redirect to the relevant page dependent on whether a user is logged in or not

## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```
## Useful links

http://acebookderailed.herokuapp.com/
https://trello.com/b/scpE1rNZ/acebook-project
https://github.com/basselalsayed/acebook-derailed



