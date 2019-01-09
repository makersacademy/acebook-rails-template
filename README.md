# AceBook   
[![Build Status](https://travis-ci.org/tomasdoh/acebook-floppy-disk.svg?branch=master)](https://travis-ci.org/tomasdoh/acebook-floppy-disk)    [![Coverage Status](https://coveralls.io/repos/github/tomasdoh/acebook-floppy-disk/badge.svg?branch=master&service=github)](https://coveralls.io/github/tomasdoh/acebook-floppy-disk?branch=master&service=github)

[Building a Facebook clone using Rails](https://aqueous-wave-77193.herokuapp.com/posts).

## Team members

* [Luisa Theodoro Paoliello](https://github.com/luisatheodoro)
* [Chris Gilbert](https://github.com/chrisjgilbert)
* [Cristopher Palacios](https://github.com/criszelaya24)
* [Kirill Zabrodin](https://github.com/kirillzabrodin)
* [Tomas Doherty](http://github.com/tomasdoh)

## User Stories

#### Authentication
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
#### Posts
```
As a user
So that I can see what my amigos are saying
I want to be able to view all the posts on Acebook
```
```
As a user
So that I can share my thoughts
I want to be able to create a post
```
```
As a user
So that I can change or remove anything I regret saying
I want to be able to update or delete my posts
```
```
As a user
So that I can see the latest updates from my amigos
The newest posts should appear first in my feed
```
```
As a user
So that I can express myself as much as I need to
I want to write long posts across multiple lines
```
#### Engagement
```
As a user
So that I can express my love/outrage over my friends' views
I want to be able to like and dislike posts
```
#### Profile
```
As a user
So that I can read all of my posts in one place
I want my own profile page
```

## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> rails s # Start the server at localhost:3000
```

To clean local database use

```
> bin/rails db:drop
> bin/rails db:create
> bin/rails db:migrate
```
## Registration

You can sign up to use Acebook on the [homepage](https://aqueous-wave-77193.herokuapp.com). To change your avatar, register your email address at [Gravatar](https://en.gravatar.com) and follow the instructions to upload your chosen image.

## Testing

#### Rubocop

`bundle` if not installed    
`rubocop` to run    

#### Test Coverage with Simplecov

Coverage reports are generated every time RSpec tests are run. To view results:  
`bundle` if not installed    
`cd coverage`     
`open index.html`    

#### Wiki

We have documented our entire journey on the Wiki of this repo. All page names are written in a format of 'MeetingType 00:00 01/01/2000'. Posts were made by individual members without agreement on a formal format. Each post summarizes the conversations had during the meeting.

## Deployment

#### Creation

Use
```
heroku create
git push heroku master
```
to deploy. Alternatively allow travis to use your repo and deploy when you push to master, with a working build it will attempt to push to heroku, you will need to generate your own API key and encrypt it for travis. This is done by running
```travis encrypt $(heroku auth:token) --add deploy.api_key --org```
for travis-ci.org or
```travis encrypt $(heroku auth:token) --add deploy.api_key --pro```
for travis.ci.com.

#### Database Cleaning

You can truncate the database by running
```
heroku pg:reset DATABASE --confirm { name-of-your-app-here }
heroku run rails db:migrate
```
This will clear and reset the database to working condition. You must have the required rights on the heroku project in order to do this.

## How to contribute   

If you would like to contribute to this project please begin by forking our repo. Once finished, open a PR describing what you have done.

Note: please make sure that your code adheres to our linting and code coverage (95%+) requirements. Travis will check to see if these requirements are met and will automatically fail the PR if they are not met.

If you notice any bugs please open an issue and we'll get address it!
