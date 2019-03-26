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


## Link to our process documentation
See https://docs.google.com/document/d/1-bv7yLO38CKlP1r0C1-qqpVL5H6gtalqZolHUrqKgyo/edit

## Link to our trello
See https://trello.com/b/qGXi1GtK/acebook

## Tools used for this project
* SimpleCov
The simplecov and simplecov-console gems have been added to the Gemfile of this repo for checking code test coverage. It will be installed when the Command ```bundle install``` is run. It will run automatically every time the tests are run.
Test coverage can be seen on the console and also on the index.html file inside the coverage directory which is created by Simplecov when the tests are run.
The test coverage reports need not be stored in Git and hence the coverage directory has been added to the .gitignore file. The cache directory inside tmp has also been added to .gitignore.
