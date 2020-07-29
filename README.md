# AceBook

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

## How to create new pages

Run this in your terminal:

```
rails generate controller [NAME OF PAGE] [ACTION(e.g. class name)]
```

This will create the files in views, test units, helpers, stylesheet and adds the page to the routes.rb file.


## Connecting to database

Log on to Heroku

access floating-plateau-14779

click 'resources'

Select the postgres database

Select 'Settings', then 'view credentials'

Grab the URI

Go to TablePlus

Create a new connection using the URL

Paste the URI and connect!




## DANGER

We have put this line into config/initializers/application.rb

`Warning[:deprecated] = false`


## Email and Password validation (Input field)

Email:

We were able do this but it became clear that you can't validate past the '@'.
This article explains more at the line: "TL;DR: The only 100%"
https://stackoverflow.com/questions/19605773/html5-email-validation

Password:

This was created using the min/max length fields on the password.