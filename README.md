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
- You can use a cloud PostreSQL database. We recommand using AWS as had troubles to connect our application with ElephantSQL. You will need to change `config/databases.yml` with your own credentials or even better use a `.env` file!  

```
<<: *default
database: <%= ENV['RDS_DB_NAME'] %>
username: <%= ENV['RDS_USERNAME'] %>  
password: <%= ENV['RDS_PASSWORD'] %>  
host: <%= ENV['RDS_HOSTNAME'] %>  
port: <%= ENV['RDS_PORT'] %>
```  
- You can have a local database but you'll need to change `congif/databases.yml` file as it is currently configured for a cloud dabatase.

```
<<: *default
database: pgapp
``` 

In a test environment:  
- `congif/databases.yml` is currently configured for a local database (faster to run the tests).  

First, let's create the databases by running `bin/rails db:create` and finally run `bin/rails db:migrate` to create the tables.  
In case these commands do not create the databases in the an environment or another, you may need to specify the environment by adding `RAILS_ENV=development`or `RAILS_ENV=test`.

Once the databases and tables are ready:

```
$ rspec # To run the tests
$ bin/rails server # To start the server at localhost:3000
```

## Useful links

- [Team card wall](https://waffle.io/ChocolatineMathou/acebook-PushMePullYou)
- [Team learning documentation](https://hackmd.io/s/HkefB7V8Ym#)

## Resources

- [Commit message style](https://seesparkbox.com/foundry/semantic_commit_messages)
- [Documentation](./docs)
