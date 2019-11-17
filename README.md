# AceBook

[![Build Status](https://travis-ci.com/etelish/acebook-Team-Meme.svg?branch=master)](https://travis-ci.com/etelish/acebook-Team-Meme)
[![Test Coverage](https://api.codeclimate.com/v1/badges/a59816c38f3b0ddeee33/test_coverage)](https://codeclimate.com/github/etelish/acebook-Team-Meme/test_coverage)


## Team MEME (Mark, Eithel, Mike, Elsie)

<img src="https://github.com/etelish/acebook-Team-Meme/blob/master/docs/wall.png" width=60%>

<br>
Hosted here on Heroku: https://serene-oasis-58904.herokuapp.com/
<br>

## How to install and run

1. Clone this repository and navigate to the root folder.

2. Image storage is configured to use Amazon S3. For testing, we recommend changing to use local storage instead: 

In config/environments/development.rb, change this line

```
config.active_storage.service = :amazon
```
to read:
```
config.active_storage.service = :local
```
...then repeat for config/environments/production.rb.

3. Download and install Image Magic from here: https://imagemagick.org/script/download.php

4. In the command line, run:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```
<br>


## Technologies used 

| **Technology** | **Role** |
| -- | -- |
| Ruby 2.5.0 | Backend programming language |
| Rails | Model-View-Controller web application framework |
| Active Record | ORM |
| HTML | Front end markup language |
| Bootstrap | CSS framework (styling) |
| Postgresql | Database |
| Acts as votable gem | Voting on models (implementing 'likes'/'unlikes') 
| Clearance gem | Authentication with email and password |
| JQuery-Rails | Ajax requests (implementing 'likes'/'unlikes') |
| Mini Magick | Image manipulation (resizing) |
| Capybara | Testing framework |
| RSpec-Rails | Testing framework |
| Simplecov | Test coverage |
| Travis | CI |
| Code Climate | CI (test coverage)|
| Git | Version control |
| Puma | Web server for local deployment |
| AWS S3 | File storage (for photos) |
| Figaro gem | Managing environment variables (for AWS) |
| Heroku | Cloud deployment |

## Our approach

<em>See detailed project notes in this repo's Wiki!</em>

- We worked in 2-day sprints, with daily morning stand-ups
- We paired on the major part of the code, with some individual workload depending on requirements for the day
- We managed tickets using a Trello card wall
- We focused on Capybara feature tests to drive design 
- The majority of pull requests were peer reviewed, meaning any merge conflicts were relatively straightforward to resolve

<em>Trello card wall</em>

<img src="https://github.com/etelish/acebook-Team-Meme/blob/master/docs/trello.png" width=25%>

