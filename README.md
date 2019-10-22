# AceBook

[![Build Status](https://travis-ci.com/etelish/acebook-Team-Meme.svg?branch=master)](https://travis-ci.com/etelish/acebook-Team-Meme)
[![Test Coverage](https://api.codeclimate.com/v1/badges/a59816c38f3b0ddeee33/test_coverage)](https://codeclimate.com/github/etelish/acebook-Team-Meme/test_coverage)


## Team MEME (Mark, Eithel, Mike, Elsie)

Our team workflow process is administered using this Trello card wall:
https://trello.com/b/LngJ2uHN/acebook-team-meme


See detailed project updates on our [wiki](https://github.com/etelish/acebook-Team-Meme/wiki).

<br>

## How to install and run this project


1. Clone this repository and navigate to the root folder.

2. In config/environments/development.rb, change this line

```
config.active_storage.service = :amazon
```
to read as follows:
```
config.active_storage.service = :local
```

3. Repeat the above step in config/environments/production.rb.

4. Download and install Image Magic from here: https://imagemagick.org/script/download.php

5. In your command line, run the following commands:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```
<br>

## Technologies used in this project


| **Technology** | **Role** |
| -------------- |: ------: |
| Ruby 2.5.0 | Backend programming language |
| Rails | Model-View-Controller web application framework |
| Postgresql | Database for Active Record |
| Active Record | ORM |
| Acts as votable gem | Voting on models (implementing 'likes'/'unlikes') |
| HTML | Front end markup language |
| CSS | Styling |
| Bootstrap | CSS framework (styling) |
| AWS SDK S3 | File storage (for photos) |
| Clearance gem | Authentication with email and password |
| Figaro | Managing environment variables (enabling storage of AWS key) |
| JQuery-Rails | Ajax requests (implementing 'likes'/'unlikes') |
| Mini Magick | Image manipulation (resizing) |
| Capybara | Testing framework |
| RSpec-Rails | Testing framework |
| Simplecov | Test coverage |
| Travis | CI (build and test prior to merging on Github)|
| Code Climate | CI (test coverage)|
| Git | Version control |
| Github | Git hosting and collaborative tools |
| Puma | Web server for local deployment |
| Heroku | Cloud deployment |
