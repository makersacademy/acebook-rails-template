# AceBook
[![Build Status](https://travis-ci.org/Yasmineral/acebook-short-ferret-midnight.svg?branch=master)](https://travis-ci.org/Yasmineral/acebook-short-ferret-midnight)

## Project Outline
Team Short Ferret Midnight consisted of:
- [Yas Kemp](https://github.com/Yasmineral)
- [Nathan Hynes](https://github.com/NathanHynes)
- [Jess Marais](https://github.com/jessmar94)
- [Brad Phillips](https://github.com/bradjp)
- [Danielle Inkster](https://github.com/danielleinkster)
- [Jay Issuree](https://github.com/jayissuree)

The goal of the two-week project is to use high-quality processes to build a project in a team.

[You can find the engineering project outline here.](https://github.com/makersacademy/course/tree/master/engineering_projects/rails)

## Live Web App
Click [here](https://salty-peak-83707.herokuapp.com/) to visit our Acebook app.

## Trello
[Link to our Trello board](https://trello.com/b/vN4cu4v1/short-ferret-midnight)

## Documented Learning
[View our daily blog posts here](https://medium.com/@shortferretmignight)

## User Stories
As a user,
So I can be trendy and cool,
I want to sign up to Acebook with a unique email, username and password.

As a user,
So I can continue using Acebook,
I want to be able to login and logout.

As a user,
So that I can protect my privacy,
I only want other Acebook users to be able to see posts.

As a user,
So I can keep up to date with my ferret friends,
I want to view all posts made on Acebook.

As a user,
So I can share my favourite ferret jokes,
I want to be able to make a post on Acebook and the post is dated.

As a user,
So I can judge my ferret friends harshly,
I want to be able to add a comment on and like or dislike a post/comment.

As a user,
So I can remove or improve some of my terrible ferret jokes,
I want to be able to edit and delete a post or comment that I made.

As a user,
So I can compare myself with my friends,
I want to have my own wall and be able to visit other users' walls.

As a user,
So I know if the user id doesn't exist,
I want to be routed to a 404 Error page if the user doesn't exist.

## How to Install and Run
```bash
> git clone https://github.com/Yasmineral/acebook-short-ferret-midnight.git
> bundle install
> rake db:create  
> rake db:migrate

> bin/rails server # Start the server at localhost:3000
```
## How to Run Tests
```bash
> rspec # Run the tests to ensure it works
> rubocop # Check code quality
```
