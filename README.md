[![Build Status](https://travis-ci.org/darciew/acebook-rails-template.svg?branch=master)](https://travis-ci.org/darciew/acebook-rails-template)  [![Maintainability](https://api.codeclimate.com/v1/badges/52d0d8cc4088fa6dd174/maintainability)](https://codeclimate.com/github/darciew/acebook-rails-template/maintainability)  [![Test Coverage](https://api.codeclimate.com/v1/badges/52d0d8cc4088fa6dd174/test_coverage)](https://codeclimate.com/github/darciew/acebook-rails-template/test_coverage)

# AceBook by Team COAD
[Darcie Walsh](https://github.com/darciew) [Cristina María Ocaña Manzano](https://github.com/cristinaocanamanzano) [Andres Faraone-Pirie](https://github.com/afaraone/) [Oliver Baum](https://github.com/olliebaum)

## Task
This is a collaborative 2-week project to make a social media app. It is an opportunity for us to apply our knowledge of Rails, Continuous Integration, Deployment via Heroku and Agile Development.

[Card Wall](https://trello.com/b/csmJFvWt/acebook)

## Features
- [x] Automatic deployment with CI testing
- [x] Authorisation for registration and signing up
- [x] Users can create posts
- [x] Users can edit and remove posts
- [x] Users can like posts
- [x] Users can post comments
- [x] RESTful Routes
- [ ] Users can comment on posts
- [ ] Users can post images
- [ ] Users can join groups
- [ ] Website has a navigation menu
- [ ] Dynamic and Responsive layout

## Instructions
Clone this repo:
```
$ git clone git@github.com:darciew/acebook-rails-template.git
$ cd acebook-rails-template
```

Install gems:
```
$ bundle install
```

Create database and run migration:
```
$ bin/rails db:create
$ bin/rails db:migrate
```

Run the test suite:
```
$ bundle exec rspec
```

Run server and visit https://localhost:3000
```
$ bin/rails server
```
## Heroku
[View on Heroku here](https://acebook-coad.herokuapp.com)

## Built with
[Rails](https://rubyonrails.org/)
[Devise](https://github.com/plataformatec/devise)
[PostgreSQL](https://www.postgresql.org/)
[RSpec](http://rspec.info/)
[Capybara](https://github.com/teamcapybara/capybara)
[JQuery](https://jquery.com/)

## How to contribute to this project
Contributions are welcome. Feel free to fork and make pull requests!
See [CONTRIBUTING.md](CONTRIBUTING.md)

## Check out the team's blog!
We documented our learning on Medium [here](https://medium.com/makers-team-coad)
