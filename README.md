[![Build Status](https://travis-ci.org/neilcam4/acebook-offtherails.svg?branch=master)](https://travis-ci.org/neilcam4/acebook-offtherails)

# AceBook

## Project Description

Welcome to Acebook!  A social media extravaganza of amazing features including:

Posts, comments, profile pictures, users who can log in and out and some other stuff!

All created with the help of Ruby on Rails, Heroku, Travic CI, Capybara, Rspec, Rubocop and Simplecov.

## How to install and run

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

## How to run tests

From within the project directory run 'rspec' from the command line.

Travis CI is also available via the icon in the top left of this README.

## How to contribute to this project

See [CONTRIBUTING.md](CONTRIBUTING.md)
