[Trello Unicorns](https://trello.com/b/iUkteEhD/acebook-unicorns)

[acebook-unicorns](https://acebook-unicorns.herokuapp.com/)

![Build Status](https://travis-ci.com/lucafrancesc/acebook-unicorns.svg?branch=master)

[![Test Coverage](https://api.codeclimate.com/v1/badges/9260433c796a0dcfa5d7/test_coverage)](https://codeclimate.com/github/lucafrancesc/acebook-unicorns/test_coverage)

# AceBook
Facebook clone created using Ruby on Rails and various tools to practice developer workflow and working in a group environment.

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

## Heroku

-Sign up on Heroku
-Create new app

In your terminal:
```bash
> heroku run rake db:migrate
> heroku restart
```
If you have any issues with the online DB or you find in a situation where you have to add a column to your schema
go on 'https://dashboard.heroku.com/apps/your-app/settings' and click on reveal config vars.
You can find the DATABASE_URL. Open it in your browser and it will open TablePlus.
You can write the sql commands there in order to alter your tables!
