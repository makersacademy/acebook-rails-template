# AceBook

## Description

This is our team Acebook project. We are recreating Facebook according to [these user requirements.](https://trello.com/b/fyDiPy6k/acebook-letta)

Our tech stack includes:
* Ruby
* Rails
* Capybara
* RSpec
* CircleCI
* SimpleCov

And is deployed via Heroku at https://acebook--letta.herokuapp.com/

Our team includes:
* Alex Clifford - https://github.com/clifford2910
* Christopher Barnett - https://github.com/topherb99
* Elise Aston - https://github.com/eliseaston
* Liat Moss - https://github.com/liatmoss
* Tenzin Ball - https://github.com/tenzinball

## Install Instructions

Fork and clone this repository.
Install the following in command line:
```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

## Test Instructions

* Run `rspec` in command line to see full test coverage
* Open SimpleCov coverage by typing `open coverage/index.html` in command line

## Record of learning process

* [Day 1 Blog by Liat](https://medium.com/@acebook.makers/creation-of-acebook-5345aa4ef6ab)
* [Day 2 Blog by Topher](https://medium.com/@acebook.makers/setting-up-ci-discovering-devise-103044c0415e)
* [Day 3 Blog by Ellie](https://medium.com/@acebook.makers/day-3-rail-up-for-the-magical-mystery-tour-3a377fbd683b)
* [Day 4 Blog by Alex](https://medium.com/@acebook.makers/please-keep-your-arms-and-legs-inside-the-rollercoaster-at-all-times-enjoy-the-ride-8b7948e5a807)
