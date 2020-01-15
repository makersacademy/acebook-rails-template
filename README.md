# AceBook

Building and deploying a Facebook clone in Rails. Working as an Agile team and practising Scrum.

To visit the web app as a real world user, visit https://hidden-cliffs-27554.herokuapp.com/.

## Table of contents
- [Required Instructions](#required-instructions)
- [How to contribute to this project](#how-to-contribute-to-this-project)
- [Quickstart](#quickstart)
- [Versioning](#versioning)  
- [User stories](#user-stories)
- [Domain modelling](#domain-modelling)
- [Database structure](#database-structure)
- [Features](#features)
- [Code style](#code-style)
- [Tech used](#tech-used)
- [Database setup](#database-setup)
- [Test database setup](#test-database-setup)
- [Running the tests](#running-the-tests)
- [Test coverage](#test-coverage)
  - [Feature tests](#feature-tests)
  - [Unit tests](#unit-tests)
- [Credits](#credits)

## REQUIRED INSTRUCTIONS:

1. Fork this repository to `acebook-teamname` and customize
the below**

[You can find the engineering project outline here.](https://github.com/makersacademy/course/tree/master/engineering_projects/rails)

2. The card wall is here: https://trello.com/b/UbWgvieQ/acebook-true-grit

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

## Versioning

Acebook uses ruby version 2.5.0. To change ruby versions run ```rvm install ruby-2.5.0``` in terminal.

## User stories


```
As a user   
So that I can let friends know what I'm doing   
I want to post a message to Acebook.
```
```
As a user   
So that I can see what others are saying   
I want to see their messages in reverse chronological order.     
```

```
As a user   
So that I can better appreciate the context of a post   
I want to see the time at which it was made.    
```

```
As a user   
So that I can post messages on Acebook as me   
I want to sign up to Acebook.   
```

```
As a user   
So that I can post messages on Acebook as me   
I want to log in to Acebook.   
```
```
As a user   
So that I can avoid other posting messages on Acebook as me   
I want to log out of Acebook.   
```


## Domain modelling

| User class | Post class |
| ---- | --- |
| ```variable``` | ```variable``` |
| ------------- | ------------- |
| ```method``` | ```method``` |

## Database structure

**Table: users**

user_id | user_name | user_handle | email | password | created_at |
| ----- | --------- | ----------- | ----- | -------- | ---------- |

**Table: posts**   

| id | content | created_at | user_id |
| -- | ------- | ---------- | ------- |

## Features


## Code style
- OOD
- TDD
- BDD

## Tech used

- Rails
- Rspec  
- BCrypt
- ActiveRecord
- PostgreSQL
- Capybara
- GitHub
- HTML
- CSS
- Rubocop
- SimpleCov
- Heroku

## Database setup

- Connect to ```psql```
- Create the database using the ```psql``` command ```CREATE DATABASE name-of-database;```  
- Connect to the database using the ```pqsl``` command ```\c name-of-database;```  
- Run all the queries we have saved in the folder ```db\migrations\```  

## Test database setup

- Connect to ```psql```
- Create the database using the ```psql``` command ```CREATE DATABASE name-of-test-database;```  
- Connect to the database using the ```pqsl``` command ```\c name-of-test-database;```  
- Run all the queries we have saved in the folder ```db\migrations\```  

## Running the tests  

You can run tests by running ```rspec``` in the terminal in the root directory.

### Test coverage  
#### Feature tests

#### Unit tests


## Credits
