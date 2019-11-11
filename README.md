# AceBook - By WinkleFace

DESCRIPTION:
AceBook is a social media platform that allows users to sign up and have a wall where they can post messages, interact with other friend's walls, as well as add comments and likes to friends posts.
Users can sign up only with a valid email and password. Once a user is signed up this can log in and log out from the platform.
Signed up users can reset their password if forgotten and an email will be send with reset password instruction.
The wall of posts is accessible only for a user that is logged in.

## Quickstart

This project is based on Ruby on Rails.
First, clone this repository. Then:

```bash
> bundle install
```

DATABASE SETUP
To set up and migrate the database:

```bash
> bin/rails db:create
> bin/rails db:migrate
> bin/rails db:migrate RAILS_ENV=test
```

START THE SERVER

```bash
> bin/rails server # Start the server at localhost:3000
```

TO RUN THE TESTS
```bash
> bundle exec rspec
```

DEPLOYMENT

- create a travis app
- Create Heroku App
- Connect app to github repo under Deploy settings
- Enable Automatic deploys and 'Wait for CI to pass before deploy'




REQUIRED INSTRUCTIONS:

1. Fork this repository to `acebook-teamname` and customize
the below**

[You can find the engineering project outline here.](https://github.com/makersacademy/course/tree/master/engineering_projects/rails)

2. The card wall is here: <please update>

## How to contribute to this project
See [CONTRIBUTING.md](CONTRIBUTING.md)
