Deployed app on Heroku [here](https://street-cred-acebook.herokuapp.com/)

[![Waffle.io - Columns and their card count](https://badge.waffle.io/david-mears/acebook-team-street-cred.svg?columns=all)](https://waffle.io/david-mears/acebook-team-street-cred)
(Click through for card wall)

[![Maintainability](https://api.codeclimate.com/v1/badges/fcd1062011a5037d214d/maintainability)](https://codeclimate.com/github/david-mears/acebook-team-street-cred/maintainability)

[![Test Coverage](https://api.codeclimate.com/v1/badges/fcd1062011a5037d214d/test_coverage)](https://codeclimate.com/github/david-mears/acebook-team-street-cred/test_coverage)

# AceBook

[You can find the engineering project outline here.](https://github.com/makersacademy/course/tree/master/engineering_projects/rails)

## Installation instructions for local development

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate
> bin/rails db:seed # If you want there to be any posts and users already
> bin/rails server # Start the server at localhost:3000
```

## Running tests

```bash
> bin/rails db:create RAILS_ENV=test
> bin/rails db:migrate RAILS_ENV=test
> bin/rails db:seed RAILS_ENV=test
> bundle exec rspec # Run the tests to ensure it works
```

## How to contribute to this project

Check out the wiki for our development process right [here](https://github.com/david-mears/acebook-team-street-cred/wiki/Workflow)

Git process:
```bash
> git checkout dev
> git fetch
> git pull
> git checkout -b [your new branch]
> git push -u origin [your new branch]
```
(Work on your branch)
```bash
> bundle exec rspec
[all pass]
> bundle exec rubocop
[all pass]
> git push
```
Pull request to **dev**.
dev --> staging --> master

## How to deploy

Once you have linked Heroku and clicked deploy, set up the app database:
```bash
heroku run rake db:migrate -a [name of heroku app]
heroku run rake db:seed -a [name of heroku app]
```
