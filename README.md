# Petbook group project (Facebook clone!)
==================

 ![Alt text](https://media.giphy.com/media/14cilFdQzr8hG0/giphy-downsized.gif)

 This project is our 8-9th week team challenge. 5 of us (Jen, Angus, Josh, Chris and Rob) were tasked with creating a clone of Facebook. It was our first experience with the Rails framework and our second group project.

 Heroku link: http://petbook-acebook.herokuapp.com/users/sign_in

 ## Instructions:  

 ```
 For this project you will be working in teams to produce a
 social media platform.

 Each team will start with the same project seed and virtual
 card-wall with some initial tickets to get you started.
 ```

 ## Getting started

 * Fork this repo and clone to your local machine

 ```
 > bundle install
 > bin/rails db:create
 > bin/rails db:migrate
 > brew install imagemagick

 > rake # Run the tests to ensure it works
 > bin/rails server # Start the server at localhost:3000
 ```

 ## Running tests

 Run
 ``` rake ```
 from the root directory

## MVP

### Original MVP diagram

<img src="/app/assets/images/original_mvp.png" width="750px" />

### MVP User Stories

```
As a pet,
I can see a welcome message,
so that I know I'm logged in.
(small)

```
```
As a pet,
I can see my name next to my post,
so that everyone knows it's me
(small)
```
```
As a pet,
I can post text to the newsfeed,
so that I can share my drivel
(small)
```
```
As a pet,
I can see the timestamp of my post,
so people know what's most recent
(small)
```
```
As a pet,
I need to login to Petbook,
so I can post as myself
(medium)
```
```
As a pet,
I can see posts in reverse chronological order,
so that other pets see the most recent posts first
(small)
```

## Tech/Framework used

* __Ruby__
* __Rails__ framework (5.1.1)
* __Heroku__
* __CarrierWave__ gem for uploading images
* __Devise__ gem for login, registration and authentication
* __Postgresql__
* __Rspec-rails__ (3.5) / Capybara (2.13) for testing
* __Bootstrap / CSS__

* __Trello__ (for kanban style workflow)
* __Balsamiq__ (for wireframing mockups)

## Development workflow and methodologies

* 2 day sprint where we reflected on current progress, estimated new features (using small/medium/large complexity sizing), assessed blockages and assigned work.
* Retro at end of sprints where we discussed what we thought was going well and what could be improved.
* Daily morning standup where we announced previous days work, any blockages and what we planned to achieve that day.

Trello board at start of project:<br>
<img src="/app/assets/images/start_trello.png" width="750px" />

Trello board at end of project:<br>
<img src="/app/assets/images/end_trello.png" width="750px" />

## Learning objectives

We agreed on the following learning objectives before starting the project:

<img src="/app/assets/images/learning_objectives.png" width="750px" />
