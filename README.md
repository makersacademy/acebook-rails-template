
[![Maintainability](https://api.codeclimate.com/v1/badges/a99a88d28ad37a79dbf6/maintainability)](https://codeclimate.com/github/codeclimate/codeclimate/maintainability)

# AceBook

## Overview

Makers Academy Engineering Group Project to make a Facebook Clone (Acebook)

### Team

Alicia Merlino
Emily Spencer
Nicolas Raffray
Shaun Low

### Application Overview

- Ruby on rails server
- PSQL database accessed through 'pg' gem

### How to Install

- git clone this repo
- run `gem install bundle`
- run `bundle`
- run `gem install rake`
- run `rails server` to start server on localhost port 3000

## Customer Requirements

### User stories

#### Post

```
As a user
So that I know I'm not signed in
I will be redirected to the sign up/login page
```

```
As a registered user
So I can tell people what I'm thinking
I can make a post and see it on the page
```

```
As a registered user
So I know when the post was made
I can see the time that I posted it
```

```
As a registered user
So I can fix a typo
I can update my post within 10 minutes
```

```
As a registered user
So I can't change another person's post
I receive a helpful error message
```

```
As a registered user
So I can I delete my own posts
I want to see a delete button next to my post
```

```
As a registered user
So I can fix an error
I can delete my posts
```

```
As a registered user
So I can't accidentally delete someone else's post
I receive a helpful error message if I try to do so
```

### Sign up

```
As a non-registered user
So that I can't view others' accounts
I am redirected to the index page if I try to go to another URL
```

```
As a non-registered user
So that I can use Acebook
I can see a sign up page which prompts me to enter my email address and password
```

```
As a non-registered user
So that I can't enter an invalid email
I can see helpful information that indicates why my email is not valid
```

```
As a non-registered user
So that I enter a valid password of between 6 - 10 characters
I receive helpful information that indicates why my password isn't valid
```

```
As a newly registered user
So that I know that I successfully signed up
I want to be redirected to my post page and see a message that tells me I was successful in signing up
```

#### Sign in

```
As a registered user who hasn't logged in
So I know I'm not logged in
I will be redirected to the index page to log in
```

```
As a registered user who hasn't logged in
So I know that I'm not logged in
I can see a link to a sign in page which prompts me to enter my email address and password
```

```
As a registered user who hasn't logged in,
So that I can't log in with an invalid email,
I see an error message which tells me that my email is invalid
```

```
As a registered user, when I submit my details to log in,
So I can make a post,
I am logged in and redirected to my posts page
```

#### Low priority

```
As a user
So that I know the context of a post
I can see the date and time that a post was made, as well as who created it
```

```
As a user
So I can see the latest posts first
Posts appear in reverse chronological order on the page
```

```
As a user
So I can style my posts
I want line breaks to be accepted
```

REQUIRED INSTRUCTIONS:

1. Fork this repository to `acebook-teamname` and customize
   the below\*\*

[You can find the engineering project outline here.](https://github.com/makersacademy/course/tree/master/engineering_projects/rails)

2. The card wall is here:  https://trello.com/b/JUaLZHFH/insane

3. Link to deployed app: https://acebook-insane.herokuapp.com/

## Learning Documents 

Please see Learning Documents column on Trello board: https://trello.com/b/JUaLZHFH/insane

## How to contribute to this project

See [CONTRIBUTING.md](CONTRIBUTING.md)

## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server
```
Start the server at localhost:3000
