[Trello Unicorns](https://trello.com/b/iUkteEhD/acebook-unicorns)

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

## Database Setup - (developing phase)

To build database from schema
```
rake db:migrate
```

To reset the database and reload the current schema 
(warning: database will be reset, all data will be lost)
```
rake db:drop db:create db:migrate
```

Table ```users```:  
id - PRIMARY KEY   
username - String, Non Nullable   
email - String, Non Nullable, Unique  
password - String, Non Nullable   
