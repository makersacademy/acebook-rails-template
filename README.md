# AceBook

### To run tests

In CLI create the databases: 
`bin/rails db:create` or `rails db:create`
To migrate tables for test environment:
`bin/rails db:migrate RAILS_ENV=test` or `rails db:migrate RAILS_ENV=test`

## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```
User stories for sign-up
```
A
As a new User
So that I can see that I am not signed in
I would like to be redirected to the homepage by default
1

B
<!-- As a non-signed up user
So that I am encouraged to sign-up
I should be redirected to the homepage when I visit any other url -->
2 - after implementation of other stories

C
As a new User
So that I can sign up
I would like to provide a email and password - What additional information do we want to take from the user?
5

D
As a new user
So I can enter my email accurately
I would only like valid email addresses to be accepted
13

E
As a new User
So that I can enter a secure password
I would like to see an error message if my password is not valid - Password validation restrictions included on trello
1

F
As a newly signed up user
So I can confirm my sign-up
I would like to receive a successful sign-up message
1
```
User stories for login
```
G
As an existing user
So that I can see my feed
I would like to be redirected to my posts page upon login
1

H
As an existing user
So that I can login
I would like to be able to enter my login details
3

I
As a existing user
So I can enter my email accurately
I would like incorrect email addresses to show me a useful error
3

J
As an existing user
So I can have a secure account
I would like an incorrect password to throw an error
3

K
<!-- As a developer
So I don't have to enter my acebook details
I would like to be able to login via github -->
13
```
User stories for posts
```
L
As a User
So that I can share updates with other users
I would like to be able to make posts
3

M
As a user
In case I change my mind about a post
I would like to be able to delete my own posts
8

N
As a user
In case I need to edit my posts
I would like to be able to update my posts
8

O
<!-- When a user makes a post they should not be able to edit posts after ten minutes of making it -->
8

P
As a user
So that I can be sure I'm deleting the right post
I would like to see an error message if I try to delete someone else's post
5

Q
As a user
So that I can be sure I'm editing the right post
I would like to see an error message if I try to edit someone else's post
5

R
As a user
So that I can have context for a post
I want to be able to see the date and time a post was made
2

S
As a user
So that I can see what other people are up to
I want to be able to see who made the post
3

T
As a user
So that I can stay up to the minute
I would like posts to be ordered in reverse chronological order
5

U
As a user
So that I can make my posts easier to read
I want my posts appear to as I type them (line breaks should be preserved)
13
```
