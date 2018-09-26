# AceBook

[![Build Status](https://travis-ci.com/ChocolatineMathou/acebook-PushMePullYou.svg?branch=test%2Fadd_travis_to_project)](https://travis-ci.com/ChocolatineMathou/acebook-PushMePullYou)

Code with :heart: by:  
- [David Lawes](https://github.com/DaveLawes)  
- [Lucien Najev](https://github.com/Lucx14)  
- [Malachy Gilchrist](https://github.com/Mallig)  
- [Mathilde Ferrand](https://github.com/ChocolatineMathou)

## Technology

This project was built with Ruby and its framework Rails.  
We are using [RSpec](https://github.com/rspec/rspec) as a testing framework paired with:  
- [Capybara](https://github.com/teamcapybara/capybara) to test the user experience  
- [Simplecov](https://github.com/colszowka/simplecov) to get the test coverage

[Rubocop](https://github.com/toshimaru/rubocop-rails_configcq) has been set up as a style checking.


## How to install

### Download the project

```
$ git clone git@github.com:ChocolatineMathou/acebook-PushMePullYou.git
$ cd acebook-PushMePullYou
$ bundle install
```
### Setting up databases

To play with this project, you'll need to set up a test and production databases.

In a development environment:  
- You can use a cloud PostreSQL database. We recommand using AWS as had troubles to connect our application with ElephantSQL. You will need to change `config/databases.yml` with your own credentials or even better use a `.env` file! (ADD EXAMPLE)  
- You can have a local database but you'll need to change `congif/databases.yml` file as it is currently configured for a cloud dabatase. (ADD AN EXAMPLE).  

In a test environment:  
- `congif/databases.yml` is currently configured for a local database (faster to run the tests).  

First, let's create the databases by running `bin/rails db:create` and finally run `bin/rails db:migrate` to create the tables.

```
> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

## Useful links

- [Team card wall](https://waffle.io/ChocolatineMathou/acebook-PushMePullYou)
- [Team learning documentation](https://hackmd.io/s/HkefB7V8Ym#)

## Resources

- [Commit message style](https://seesparkbox.com/foundry/semantic_commit_messages)
- Documentation


## Running tests

Before running tests, it might be worth running `rails db:setup`. This will ensure the test database and tables are created on your local machine and are up to date with the latest migration files.
