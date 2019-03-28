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

---------------
