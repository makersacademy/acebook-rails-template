[![Build Status](https://travis-ci.com/Will-Helliwell/acebook-on-the-rails.svg?branch=master)](https://github.com/Will-Helliwell/acebook-on-the-rails)

# AceBook

[Click here for Trello Board](https://trello.com/b/XiB46v42/acebook-on-the-rails)

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

### Getting Heroku Running
Do the following after every commit on the master branch.
```
git push heroku master
heroku run rails db:migrate
```
