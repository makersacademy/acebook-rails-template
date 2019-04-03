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
As a user
So I can remove my typos
I want to update my own posts
```
```
As a user
So I can remove my dark past
I want to delete my own posts
```
-------------------------------

PATHWAY =>   
 Browser ---> Controller ----> Model (links database) ------> Controller -----> Views

---------------

Generating new table in database:

1 - bin/rails generate migration CreateSignups username:string password:string email:string

2 - bin/rails db:migrate VERSION=20190326112345

---------------
Showing it on a worldwide web page;


1 - Create Procfile

2 - put in Procfile:
    release: rake db:migrate
    web: bundle exec bin/rails server


----------------

bcrypt:

0 -> add password_digest to table columns.
0 -> unhash bcrypt in gemfile

0 -> Mainly follow this walkthrough: https://gist.github.com/thebucknerlife/10090014

bin/rails generate migration FixColumnName rename_column :signups, :password, :password_digest 
