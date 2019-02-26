[![Build Status](https://travis-ci.com/thielsen/acebook-rails-template.svg?branch=staging)](https://travis-ci.com/thielsen/acebook-rails-template) [![Maintainability](https://api.codeclimate.com/v1/badges/ba1feb2713e2722cfb3c/maintainability)](https://codeclimate.com/github/thielsen/acebook-rails-template/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/ba1feb2713e2722cfb3c/test_coverage)](https://codeclimate.com/github/thielsen/acebook-rails-template/test_coverage)

## AceBook

Acebook is a clone of Facebook developed as a group project in weeks 8 and 9 at Makers Academy.

## Technologies

- Ruby on Rails
- Devise
- Travis
- Code Climate
- Heroku

## Links

The production application is deployed to https://acebook-template-staging.herokuapp.com/
Trello card wall for the project management is here: https://trello.com/b/k60sWUQo/team-rails-template

## Installing

To install a development instance locally clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Confirm all green
> bin/rails server
```
You can then connect to http://localhost:3000