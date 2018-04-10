# AceBook

## Description
This is the Engineering Project challenge for weeks 8-9 at Makers Academy.

Team Byte-3 consisted of Alfie Darko (@AlfieDarko), Charlene Bastians (@CharSV5), Julian Ng (@julesnuggy), and Tom Betts (@T-Betts).

The app is hosted live using Heroku at: https://fierce-headland-12326.herokuapp.com/posts

## Set Up
1. Clone repo: `git clone git@github.com:julesnuggy/acebook-byte-3.git`
2. Install Bundler: `gem install bundler`
3. Install app gems: `bundle install`

## Testing

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
The app is hosted on Heroku and uses its built-in cloud database.

To run the app in the deployed Heroku environment:
* In your browser, visit https://fierce-headland-12326.herokuapp.com/posts
* Or, in your bash, run: `heroku open -a fierce-headland-12326 /posts`

To access the psql database hosted on Heroku, in your bash, navigate to the
project directory and run:
```bash
heroku pg:psql # Access the psql REPL
SELECT * FROM posts # Display all table contents
```

--------------
--------------
Fork this repository to `acebook-teamname` and customize
the below**

[You can find the engineering project outline here.](https://github.com/makersacademy/course/tree/master/engineering_projects/rails)

The card wall is here: <please update>

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
