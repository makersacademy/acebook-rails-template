# AceBook


<a href="https://travis-ci.org/julesnuggy/acebook-byte-3">
  <img src="https://travis-ci.org/julesnuggy/acebook-byte-3.svg?branch=master"/>
</a>


<a href="https://codeclimate.com/github/julesnuggy/acebook-byte-3/maintainability">
  <img src="https://api.codeclimate.com/v1/badges/3cb11f09ea68cad7b523/maintainability" />
</a>

<a href="https://codeclimate.com/github/julesnuggy/acebook-byte-3/test_coverage">
  <img src="https://api.codeclimate.com/v1/badges/3cb11f09ea68cad7b523/test_coverage" />
</a>

## Description
This is the Engineering Project challenge for weeks 8-9 at Makers Academy.

The Splendaberg team consists of Alfie Darko (@AlfieDarko), Charlene Bastians (@CharSV5), Julian Ng (@julesnuggy), and Tom Betts (@T-Betts).

The app is hosted live using Heroku at: https://splendaberg-acebook.herokuapp.com

## Local Set Up
1. Clone repo: `git clone git@github.com:julesnuggy/acebook-byte-3.git`
2. Install Bundler: `gem install bundler`
3. Install app gems: `bundle install`
4. Build local databases: `rails db:migrate`

## Testing
1. Run `rspec` in bash from the project root directory
2. To view test coverage, open the _index.html_ file found in the **coverage** folder


## Core Resources:
1. Posts - responsible for managing the posts by a user
2. Likes - responsible for managing likes by a user on posts in the app
3. Comments - responsible for managing comments by a user on posts in the app
4. Users - responsible for managing the app's users

## How to Use
ROUGH ESTIMATION
1. From the index page, click Sign Up to create an account
2. Enter your username and password
3. Click on Log In and enter your credentials
4.

## MVP User Stories
```
As a user,
So that I can validate my self-worth,
I want to be able to post a message on Acebook.
```

```
As a user,
So that I can be a nosey git,
I want to see everyone's posts in a news feed.
```

```
As a user,
So that I can put other people down,
I want to be able to comment on other people's posts.
```

```As a user,
So that I can show my support,
I want to be able to like a post.
```

```As a user,
So that I can see how popular (or unpopular) I am,
I want to be able to see the number of likes of a post.
```

```
As a user,
So that I can partake in Acebook,
I want to be able to sign up.
```

```
As a user,
So that I can control my account security,
I want to be able to sign in and out.
```

### Nice-to-Haves User Stories
```
TBC
```

## Card Wall
The project Card Wall is where the team's To Do list and specification are located. This is a "working document" which changes as we complete tasks and implement features.
https://trello.com/b/3DGCTw4g/acebook-byte-3

## Deployment and Database
The app is hosted on Heroku and uses its built-in cloud database. For this project, we used Tom's Heroku account. You will need to be a Collaborator to be able to run / modify the Heroku app.

To run the app in the deployed Heroku environment:
* In your browser, visit https://splendaberg-acebook.herokuapp.com
* Or, in your bash, run: `heroku open -a splendaberg-acebook

To access the psql database hosted on Heroku, in your bash, navigate to the
project directory and run:
```bash
heroku pg:psql # Access the psql REPL
SELECT * FROM <table_name> # Display all table contents
```
