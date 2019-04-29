# AceBook by BusinessLogi&copy;


[![Build Status](https://travis-ci.org/Hives/acebook-business-logic.svg?branch=master)](https://travis-ci.org/Hives/acebook-business-logic) 
[![Maintainability](https://api.codeclimate.com/v1/badges/9e037f53027bc17b54fb/maintainability)](https://codeclimate.com/github/Hives/acebook-business-logic/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/9e037f53027bc17b54fb/test_coverage)](https://codeclimate.com/github/Hives/acebook-business-logic/test_coverage)

#### Checkout [AceBook BusinessLogi&copy; Live Site](https://acebook-business-logic.herokuapp.com)
----
## Description
This is a team proejct clone of Facebook built using Ruby on Rails, a challenge set by Makers Academy. The original repo can be found [here](https://github.com/makersacademy/course/tree/master/engineering_projects/rails)

## Getting Started
```bash
> git clone https://github.com/Hives/acebook-business-logic
> bundle install
> bin/rails db:create
> bin/rails db:migrate
```
## Running Tests
> rspec

## Usage

```bash
> bin/rails server # Start the server at localhost:3000
```

## Product Roadmap

### Card Wall
See our awesome card wall [here](https://trello.com/b/6XSi28FM/acebook-by-business-logic)


## User stories
### Signing up
```
As a guest user
I want to be able to sign up for the site
So that I can access further content
```
```
As a guest user
I want to be redirected to index when trying to access the rest of the site
So that I can create an account
```
```
As a guest user
I want to be able to navigate back to sign up page from log in page
So that I can create an account
```
```
As a guest user
I want to see an error message if my entered email is not unique 
So that I can create a new account 
```
```
As a guest user
I want to see an error message if my entered email is not valid 
So that I can create a new account 
```
```
As a guest user
I want to see an error message if my chosen password is not valid
So that I can choose another password to create an account
```
```
As a user
I want to see a success message 
So that I know my account has been created
```
```
As a user
I want to be redirected to the posts page after signing up
So that I can start viewing content
```

### Logging in
```
As a user
I want to be able to visit the login page and login
So that I can access the rest of the service
```
```
As a user
I want to be able to enter my email and password
So that I can log in and access my account
```
```
As a user
I want to be shown an error message if I get my email address wrong
So that I can correct my credentials
```
```
As a user
I want to be shown an error message if I get my password wrong
So that I can correct my credentials
```
```
As a user
I want to see a success message
So that I know I have logged into my account
```
```
As a user
I want to be redirected to the posts page after signing in
So that I can start viewing content
```

### Notifications
```
As a user
I want to stop seeing notifications after a few seconds
So that I can continue using the service undistracted
```

### Viewing Posts

```
As a user
I want to be able to see posts
So that I can find out about my network
```
```
As a user
I want to see the newest post first
So that I can easily stay up to date with my network
```
```
As a user
I want to see when a post was posted
So that I can understand the context of the post
```


### Managing Posts
```
As a user 
I want to be able to create posts
So that I can broadcast to my network
```
```
As a user
I want to be able to type posts over multiple lines
So that I can format my posts beautifully
```
```
As a user
I want to see a link to edit on the posts I have written
So that I can maintain content I have published
```
```
As a user
I want to be sent to the edit posts page when clicking edit
So that I can alter start editing my selected post
```
```
As a user
I want to be able to see my original post and make changes to it
So that I can alter the content of the post I want to edit
```
```
As a user
I want to be limited to editing only my own posts
So that I retain other users content
```
```
As a user
I want to be redirected to posts page when clicking submit on an edit
So that I can continue viewing content
```
```
As a user
I want to be able to delete my posts
So that I can remove unwanted content I have published
```
```
As a user
I want to be warned that I am about to delete my post
So that I can confirm this action
```
```
As a user
I want to see a message confirming I have deleted my post
So that I can know the content has been removed
```
```
As a user
I want to be limited to deleting only my own posts
So that I retain other users content
```

### Logging out
```
As a user
I want to be shown a message confirming I have logged out
So that I know I am no longer logged in
```
```
As a user
I want to be redirected to the index page on logging out
So that I can log back in 
```
