# AceBook

REQUIRED INSTRUCTIONS:

1. Fork this repository to `acebook-teamname` and customize
the below**

[You can find the engineering project outline here.](https://github.com/makersacademy/course/tree/master/engineering_projects/rails)

2. The card wall is here: <please update>

## How to contribute to this project
See [CONTRIBUTING.md](CONTRIBUTING.md)

## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

# Database:

## Create database (example):
- Creates the migrate files locally:
> bin/rails g model User email:string password:string first_name:string last_name:string ` 
- creates local database:
> bin/rails db:setup
- Populate local database (add "RAILS_ENV=test", for example, afterwards if one DB has not updated):
> bin/rails db:migrate 

- Then Deploy/push latest changes to Heroku:
> git add/commit/push

> rake run rake db:migrate

## Overview tips:
https://riptutorial.com/ruby-on-rails/example/6137/change-an-existing-column-s-type
> - rake db:migrate:status
> - rake db:migrate VERSION=20080906120000

## Remove depracy warnings

- rvm install 2.5.0
- rvm use 2.5.0
- bundle install (update bundler if needed)
- run rspec to test