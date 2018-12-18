# AceBook
Building a Facebook clone using Rails.
[![Build Status](https://travis-ci.org/tomasdoh/acebook-floppy-disk.svg?branch=master)](https://travis-ci.org/tomasdoh/acebook-floppy-disk)

## Team members

* [Luisa Theodoro Paoliello](https://github.com/luisatheodoro)
* [Chris Gilbert](https://github.com/chrisjgilbert)
* [Cristopher Palacios](https://github.com/criszelaya24)
* [Kirill Zabrodin](https://github.com/kirillzabrodin)
* [Tomas Doherty](http://github.com/tomasdoh)

## User Stories

#### Authentication and posts
```
As a user
So that I can connect with amigos
I want to sign up for Acebook
```
```
As a user
So that I can communicate with amigos
I want to log in to Acebook
```
```
As a user
So that I can see what my amigos are saying
I want to be able to see all posts
```
```
As a user
So that I can share my thoughts
I want to be able to create a post
```

## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

## Rubocop
`bundle` if not installed    
`rubocop` to run    

## View Test Coverage with Simplecov  
Coverage reports are generated every time RSpec tests are run. To view results:  
`bundle` if not installed    
`cd coverage`     
`open index.html`    
