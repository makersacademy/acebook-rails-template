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

# Migrade Database:

> Create database:
bin/rails g model User email:string password:string first_name:string last_name:string 
bin/rails db:setup (unless database already there)
bin/rails db:migrate

then heroku run rake db:migrate? To push to Heroku?


# Database Overview:
https://riptutorial.com/ruby-on-rails/example/6137/change-an-existing-column-s-type
> rake db:migrate:status
> rake db:migrate VERSION=20080906120000
