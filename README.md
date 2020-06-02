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

## User Stories
```
As a User
So I can create my profile
I want to be able to sign up
```
```
As a User
So that I can show my face
I want to be able to display my profile picture
```
```
As a User
So I can view my profile
I want to be able to login
```
```
As a User
So that I can keep my profile secure
I want to be able to logout
```
```
As a User
So that I can look socialiable
I want to add people as friends
```
```
As a User - (functionality avaiable)
So that I can express my thoughts
I want to be able to create posts
```
```
As a User - (functionality avaiable)
So that I can express my experiences
I want to be able to post photo's & links to videos (youtube etc.)
```
```
As a User
So that I can hide my embarrasment
I want to be able to delete my posts
```
```
As a User
So that I can win arguments online
I want to be able to update my posts
```
```
As a User
So that I can agree with a post
I want to be able to 'Like' it
```
```
As a User
So that I can talk to a friend
I want to be able to comment on their posts
```
```
As a User
So that I can start a fresh
I want to be able to delete my profile
```

## Entity Relationship Diagram
### Relationships
```
User has many Posts
User has many Likes
```
```
Post has one User
Post has many Likes
```
```
Like has one User
Like has one Post
```

![ERD](https://i.ibb.co/qr3GJGh/Screenshot-2020-06-02-at-13-52-13.png)


## Workflow Diagram

![Diagram Workflow](https://github.com/cmb84scd/acebook-HoneyBunnies/blob/master/images/Untitled%20Diagram-2.png)
