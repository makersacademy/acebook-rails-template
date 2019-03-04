[![Build Status](https://travis-ci.com/thielsen/acebook-rails-template.svg?branch=staging)](https://travis-ci.com/thielsen/acebook-rails-template) [![Maintainability](https://api.codeclimate.com/v1/badges/ba1feb2713e2722cfb3c/maintainability)](https://codeclimate.com/github/thielsen/acebook-rails-template/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/ba1feb2713e2722cfb3c/test_coverage)](https://codeclimate.com/github/thielsen/acebook-rails-template/test_coverage)

## AceBook

Acebook is a clone of Facebook functionality developed as a group project in weeks 8 and 9 at Makers Academy.

## Technologies

- Ruby on Rails (Web framework)
- RSpec, Capybara (testing)
- Devise (User authentication and routing)
- Travis (Continuous Integration)
- Code Climate (Code / test coverage)
- Heroku (Deployment)

## Project aims

- High maintainability
- Quality, easily-changeable code
- High test coverage (95%+)
- Effective Agile working methods with 2-day sprints
- Strict best-practice Git use (branching, pull request reviewing)
- Documentation of process and learnings in an associated wiki (above) and the linked collaborative learnings Google doc.

## Links

The production application is deployed to https://acebook-template-staging.herokuapp.com/
Trello card wall for the project management is here: https://trello.com/b/k60sWUQo/team-rails-template

## Installing

To install a development instance locally clone this repository. Then:

```bash
> bundle install
> brew install imagemagick (assuming you are on a Mac)
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Confirm all green
> bin/rails server
```
You can then connect to http://localhost:3000
