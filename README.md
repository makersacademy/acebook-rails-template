# AceBook

A social media clone.

The card wall is here: https://waffle.io/andrewwood2/acebook-gazelle


## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

## Technologies used:

* This is a Ruby on Rails app.
* Testing done by RSpec and Capybara.
* ORM is ActiveRecord and the database is PostgreSQL.
* Travis CI is used for continuous integration.
* Linting by rubocop.

## Goals

Primary goal:
Develop good team-working processes.

Secondary goals:
Be able to build and explain what's happening in a rails app.
Good enough repo for a cv.
Understanding and implementing deployment on AWS.
Understanding databases and ORMs.
Staging environment understanding, middle stage.

Strategies:
Code quality over features.
Equal contribution.
Making sure every issue has it's own branch.
Clear commit messages and pull requests.
Rotate leading stand-ups.
Popcorn size tickets.
Regular pair rotation.

## Wireframes

Sign up and Log in:

![Alt text](/wireframes/Signup-login.png)

Timeline:

![Alt text](/wireframes/Timeline.png)

Profile:

![Alt text](/wireframes/Profile.png)

Create post:

![Alt text](/wireframes/Write-post.png)
