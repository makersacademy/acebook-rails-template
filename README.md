# AceBook 

## Heroku
- In order for Heroku to keep up to date with the database, any changes should be migrated by running the following in the terminal.
```bash
$ heroku run rake db:migrate        
```
- then 
```bash
$ git add 
```
- then
```bash
$ git push heroku master
```
REQUIRED INSTRUCTIONS:

1. Fork this repository to `acebook-teamname` and customize
the below**

[You can find the engineering project outline here.](https://github.com/makersacademy/course/tree/master/engineering_projects/rails)

2. The card wall is here: https://trello.com/b/1NSTnYaN/fantastic-four-acebook

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
