# CatBook

Facebook clone by Catbook, Inc

The program allows users to sign up, log in/out, post to a timeline, and delete/update their own posts.

## Deployed App

https://acebook-catbook-inc.herokuapp.com/

## Getting Started

```
bundle install
bin/rails db:create
bin/rails db:migrate
```

## Running the program

### Start Server

```sh
$ rails server
```

### View in Browser

```
localhost:3000
```

## Running the tests

To run tests for this program, run:

```
$ bundle exec rspec
```

## Built With

* Ruby
* Rails
* Devise (for user authentication)
* Rspec & Capybara (for testing)
* Travis (for CI/CD)
* Heroku (for app deployment)
* Rubocop (for code quality)
* SimpleCov (for test coverage)

## User Stories

### User Authentication

```
As a User
So that I can post to CatBook as me
I want to sign up for CatBook

As a User
So that only I can post to CatBook as me
I want to log in to CatBook

As a User
So that I can avoid others posting on CatBook as me
I want to log out of CatBook

As the website owner
So that I can only have signed-in users access the site
I want to redirect users to the homepage unless they are signed in
```

### Posts

```

As a User
So that I can show people what I am doing  
I want to post a message on CatBook

As a User
So that I can see what others are doing  
I want to see posts from other CatBook

As a User
So that I can change my mind on what I show on Instagram
I want to be able to edit and delete my own posts

```

======

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


