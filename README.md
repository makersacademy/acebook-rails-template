# AceBook

[![Build Status](https://travis-ci.com/petraartep/acebook-rails-team-squirrel.svg?branch=newmaster)](https://travis-ci.com/petraartep/acebook-rails-team-squirrel) [![Maintainability](https://api.codeclimate.com/v1/badges/7099a0f9513bc4f965f0/maintainability)](https://codeclimate.com/github/petraartep/acebook-rails-team-squirrel/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/7099a0f9513bc4f965f0/test_coverage)](https://codeclimate.com/github/petraartep/acebook-rails-team-squirrel/test_coverage) [![GitHub issues](https://img.shields.io/github/issues/petraartep/acebook-rails-team-squirrel.svg)](https://github.com/petraartep/acebook-rails-team-squirrel/issues) [![Coverage Status](https://coveralls.io/repos/github/petraartep/acebook-rails-team-squirrel/badge.svg?branch=newmaster)](https://coveralls.io/github/petraartep/acebook-rails-team-squirrel?branch=newmaster)

This is Team Squirrel's Acebook project, a Facebook style clone built using Ruby-on-Rails. A user can signup, write, update, and delete posts, and view posts from all users.


## Team

| Jake |  Joe | Leon | Monika | Papya | Petra |
| :-----: | :-------:  | :------:  | :------:  | :------:  |:-------: |
|<a href='https://github.com/binaryred01'><img src='https://user-images.githubusercontent.com/23095774/60434119-56192e00-9bfe-11e9-8156-26105b51e0d7.png' width='40'></a>|<a href='https://github.com/josephtownshend'><img src='https://user-images.githubusercontent.com/23095774/60434119-56192e00-9bfe-11e9-8156-26105b51e0d7.png' width='40'></a>|<a href='https://github.com/leonlevitate'><img src='https://user-images.githubusercontent.com/23095774/60434119-56192e00-9bfe-11e9-8156-26105b51e0d7.png' width='40'></a>|<a href='https://github.com/monikakaczan'><img src='https://user-images.githubusercontent.com/23095774/60434119-56192e00-9bfe-11e9-8156-26105b51e0d7.png' width='40'></a>|<a href='https://github.com/Paps32'><img src='https://user-images.githubusercontent.com/23095774/60434119-56192e00-9bfe-11e9-8156-26105b51e0d7.png' width='40'></a>|<a href='https://github.com/petraartep'><img src='https://user-images.githubusercontent.com/23095774/60434119-56192e00-9bfe-11e9-8156-26105b51e0d7.png' width='40'></a>|

---

## Installation instructions for local development

Fork/clone this repository using `git clone https://github.com/petraartep/acebook-rails-team-squirrel`

Run in the terminal from the root directory

```
bundle install
rails db:create
rails db:migrate
```

Run the tests

```
rspec
```


Open your browser and navigate http://localhost:3000/
```
rails server
```

## On Heroku

Visit https://immense-forest-38148.herokuapp.com/


---

## User Stories

```
As a user
So that I can use the platform
I want to be able to sign up.
```

```
As a user
So that I can log in securely
I want to see an error message if my details are invalid.
```

```
As a user
So that I know my sign up is successful
I want to see a confirmation page.
```

```
As a user
So that I can share my feelings
I want to create a post.
```

```
As a user
So that I can keep track of my life
I want to have my posts timestamped.
```

```
As a user
So that I can change my mind
I want to be able to edit my posts.
```

```
As a user
So that I can't edit other user's posts
I want to see an error when I try.
```


## Learning documentation

https://github.com/petraartep/acebook-rails-team-squirrel/wiki


## Contribution to our project

If you'd like to contribute to our project, fork the repo and create a new pull request.
