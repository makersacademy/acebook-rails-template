# AceBook

- [The card wall](https://trello.com/b/kXFO4qi5/team-ruby)

- [Heroku app](https://ruby-acebook.herokuapp.com/)

## Technologies
- Ruby
- Rails
- PostgresSQL
- Rspec
- Capybara
- Devise
- Paperclip
- Travis CI

## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> brew bundle
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

## Minimum Viable Product
- User signup
- User signin
- User can make a post
- User can see a feed of other user's posts
- User has a basic profile
- User can make a comment on a post
- App is hosted

## Specification
- User has to sign in to use the app
- User profile
  - user can see their own profile page that includes
    - information
    - avatar
    - list of user's friends
    - list of user's post
  - user can edit and delete their own profile
  - user can see other users' profiles
- Friends
  - user can search for friends
  - user can add and remove a friend
  - friends' list appears on the profile page
- Post
  - user can make a post
  - posts appear in the feed
  - posts appear with newest post first
  - posts show the date they were posted
  - user can only see own and fiends' posts
  - user can edit and delete their own posts
- Comments
  - user can make a comment
  - user can delete their own comments
  - user can delete other user's comments on their post
- Likes
  - user can like and unlike posts and comments
  - total number of likes appears next the post/comment

  ## How to contribute to this project
  See [CONTRIBUTING.md](CONTRIBUTING.md)
