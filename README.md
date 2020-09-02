# AceBook

A social networking application built using ruby on rails

## To run project on heroku

http://acebook-team-2.herokuapp.com

## To run project locally

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate 

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```
## User Stories

### Sign-up

```
As a new User
So that I can see that I am not signed in
I would like to be redirected to the homepage by default

As a non-signed up user
So that I am encouraged to sign-up
I should be redirected to the homepage when I visit any other url -->

As a new User
So that I can sign up
I would like to provide a email and password 

As a new user
So I can enter my email accurately
I would only like valid email addresses to be accepted

As a new User
So that I can enter a secure password
I would like to see an error message if my password is not valid - Password validation restrictions included on trello

As a newly signed up user
So I can confirm my sign-up
I would like to receive a successful sign-up message
```

### Login

```
As an existing user
So that I can see my feed
I would like to be redirected to my posts page upon login

As an existing user
So that I can login
I would like to be able to enter my login details

As a existing user
So I can enter my email accurately
I would like incorrect email addresses to show me a useful error

As an existing user
So I can have a secure account
I would like an incorrect password to throw an error

As a developer
So I don't have to enter my acebook details
I would like to be able to login via github
```

### Posts

```
As a User
So that I can share updates with other users
I would like to be able to make posts

As a user
In case I change my mind about a post
I would like to be able to delete my own posts

As a user
In case I need to edit my posts
I would like to be able to update my posts

As a user
So that I can be sure I'm deleting the right post
I would like to see an error message if I try to delete someone else's post

As a user
So that I can be sure I'm editing the right post
I would like to see an error message if I try to edit someone else's post

As a user
So that I can have context for a post
I want to be able to see the date and time a post was made

As a user
So that I can see what other people are up to
I want to be able to see who made the post

As a user
So that I can stay up to the minute
I would like posts to be ordered in reverse chronological order

As a user
So that I can make my posts easier to read
I want my posts appear to as I type them (line breaks should be preserved)
```

### Comments

```
As a user
So I can communicate with other users
I would like to comment on any post

As a user
So that I know my comment has been added
I want to see a confirmation message

As a user
In case I want to amend my comment
I want to be able to edit my comments

As a user
So that I know my comment has been edited
I want to see a confirmation message

As a user
In case I change my mind about a comment
I want to be able to delete my comments

As a user
So that I know my comment has been deleted
I want to see a confirmation message
```

### Database schema

<img src="db_schema.png" />
