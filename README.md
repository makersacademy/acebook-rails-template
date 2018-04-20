# AceBook-Underdogs

<a href="https://codeclimate.com/github/Gia1987/acebook-Underdogs/maintainability"><img src="https://api.codeclimate.com/v1/badges/d0289f6df637236dccd1/maintainability" /></a>

<a href="https://codeclimate.com/github/Gia1987/acebook-Underdogs/test_coverage"><img src="https://api.codeclimate.com/v1/badges/d0289f6df637236dccd1/test_coverage" /></a>

## Description
This is the Engineering Project challenge for weeks 8-9 at Makers Academy.

The Underdogs team consists of Giacomo Ninniri (@Giacomo Ninniri), Somayeh Alimohammadi (@Somayeh), Paola Schiaffino (@Paola), and Noelle Legrain (@MissAmerica).

The app is hosted live using Heroku at: https://arcane-woodland-75224.herokuapp.com/

## Local Set Up
1. Clone repo: `git clone git@github.com:Gia1987/acebook-Underdogs.git`
2. Install Bundler: `gem install bundler`
3. Install app gems: `bundle install`
4. Build local databases: `rails db:migrate`

## Testing
1. Run `rspec` in bash from the project root directory
2. To view test coverage, open the _index.html_ file found in the **coverage** folder

## Core Resources:
1. Posts - responsible for managing the posts by a user
2. Likes - responsible for managing likes by a user on posts
3. Comments - responsible for managing comments by a user on posts
4. Users - responsible for managing the app's users

## How to Use
1. From the index page, click Sign Up to create an account
2. Enter your username and password
3. Click on Log In and enter your credentials
4. Click 'New Post' to post
5. Click 'Show' to see the post
6. Click 'Like' to like a post
7. Click 'Unlike' to unlike a post

## MVP User Stories
```
As a user,
So that I share posts with friends,
I want to be able to post a message on Acebook.
```

```
As a user,
So that I can share my thoughts,
I want to be able to comment on other people's posts.
```

```As a user,
So that I can show my support,
I want to be able to like a post.
```

```As a user,
So that I can see how popular a post is,
I want to be able to see the number of likes of a post.
```

```
As a user,
So that I can be a member of the Acebook community,
I want to be able to sign up.
```

```
As a user,
So that I can control my account security,
I want to be able to sign in and out.
```

## Card Wall
The project card wall has the team's To Do list. This is a working document which changes as we complete tasks and implement features.

[Trello board URL ](https://trello.com/b/Jju01whu/acebook-underdogs)

## Deployment and Database
The app is hosted on Heroku. We used Giacomo's Heroku account. You need to be a Collaborator to be able to modify the Heroku app.

To run the app in the deployed Heroku environment:
* In your browser, visit https://arcane-woodland-75224.herokuapp.com/
* Or, in your bash, run: `heroku open -a acebook-underdogs
