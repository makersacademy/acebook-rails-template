# ConnectU

## Introduction

ConnectU is a brief 2 week project where we intend to create a social media style web application within Ruby on Rails, given a biref specification, our task is to have an index of all posts, users having their own walls where their posts and the posts of others on their wall can be seen and additionally comments on all those posts.

## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

## Heroku
```
brew install heroku
```
Once you have a heroku account you can host your own via these commands:
```
heroku create
git push heroku master
heroku rake db:migrate
heroku open /posts
```

Our app is deployyed at: acebook-connectu.herokuapp.com

## Database Development

If you need to play with the development database in IRB you can use these commands to get stuck in with the orm.

Make sure you have a database first!
Add on any additional models if needed.

```
require 'active_record'
require 'clearance'
ActiveRecord::Base.establish_connection(adapter: 'postgresql', database:'pgapp_development')
require_relative './app/models/application_record.rb'
require_relative './app/models/user.rb'
require_relative './app/models/post.rb'
```

## Running Tests

We are using RSpec as our chosen testing framework for this projects; to run the suites, head to the main directory for the application and call the following command in your terminal;

```bash
rspec
```

You should, after a brief pause, see all of our suites, grouped by their feature followed by their descriptions and passes or fails.
