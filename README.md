# AceBook

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
# See AceBook In Action:
![AceBook on Heroku](https://acebook-team-life-savers.herokuapp.com/)

# Planning
## User Stories

**AceBook User Stories:**
**Essentials/MVP**
```
As a user,
So that I can see what people are up to,
I would like to see posts in reverse chronological order

As a user,
So that I can personalize my experience with AceBook,
I would like to be able to sign up with my email address, name, and password.

As a user,
So that I can use my AceBook account,
I would like to be able to log in.

As a user,
So that no one else can post as me,
I would like to be able to log out.

As a user,
So that I can tell people what I’m up to,
I would like to be able to publish a post.

As a user,
So that I can see when a post was written,
I would like to be able to see the day and time it was published.

As a user,
So that I can interact with the AceBook community,
I would like to be able to like a post.

As a user,
So that my opinions can be heard,
I would like to be able to comment on a post.
```
**Great to have:**
-------
```
As a user,
So that I can fix typos,
I would like to be able edit my own post.

As a user,
So that I can erase embarassing mistakes,
I would like to be able to delete any of my own posts.

As a user,
So that I can keep track of my friends’ lives,
I would like to be able to add friends.

As a user,
So that I can choose my friends,
I would like to be able to send a friend request.

As a user,
So that I don’t have to be friends with people I don’t know or like,
I would like to be able to refuse a friend request.

As a user,
So that I can be added by my friends,
I would like to be able to accept a friend request.

As a user,
So that I can see who wants to be my friend,
I would like to be able to see ‘pending friend requests’ that are waiting on my acceptance/refusal.

As a user,
So that I can have control over my ‘feed’,
I would like to only see my friends’ posts.
```
**Not Necessary, but nice:**
-------
```
As a user,
So that I can send a public message to my friend that they and their friends can see,
I would like to be able to write on their ‘wall’/profile.

As a user,
So that I can send a personal message,
I would like to be able to private message any user.
```

## Database commands

rails db:create
rails db:migrate
rails db:create RAILS_ENV=test
rails db:migrate RAILS_ENV=test

rails db:drop