# AceBook

![Build Status](https://api.travis-ci.org/bengscott2/acebook-livewire.svg?branch=master)


## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

## Running the tests

### End to end tests

- Run `rspec` in the command line to see test passing and test coverage.

### Code styling tests

- Run `rubocop` in the command line to see any styling offences.

## Technology

- [Heroku](https://www.heroku.com/) - a cloud platform service
- [Rails](https://rubyonrails.org/) - a server-side web application framework
- [Rubocop](https://rubocop.readthedocs.io/en/stable/) - a static code analyzer and code formatter
- [Ruby](https://www.ruby-lang.org/en/) - a dynamic, object oriented programming language
- [RubyCritic](https://github.com/whitesmith/rubycritic) - a code quality analysis tool for Ruby
- [ScaffoLint](https://github.com/makersacademy/scaffolint) - a starting point for customising the Rubocop linter
- [SimpleCov](https://github.com/colszowka/simplecov) - a code coverage analysis tool for Ruby
- [Travis CI](https://travis-ci.org/) - a continuous integration platform and deployment manager

## Development Process

The team is working in 2 day sprints over a period of 2 weeks, using Scrum as a basis for our approach.
[You can find the engineering project outline here.](https://github.com/makersacademy/course/tree/master/engineering_projects/rails)

### Planning Sessions

At the beginning of each sprint we estimate the complexity of tickets using T-shirt sizing and order them by priority. Cards of medium or larger are split into smaller tickets, and workload for a single 2 day sprint is move to our to do list in the [Acebook Livewire Trello board](https://trello.com/b/5gfCOsG0/acebook-livewire).

### Development

Feature cards are assigned to pairs, and worked on via branches.  Completed features are blocked from merging to the master branch untill a pull request is approved by two team members and CI tests are passing.  Approval is given when the code is understood and is good quality, deployment is automated.

### Review

Product Owner is invited to review in production.

### Retrospection

Stand-ups are held twice a day, to discuss progress and solve blockers. A retro meeting is held at the end of every sprint, to celebrate sucesses, demo the work, and make the next sprint better.

## Development Team

_Livewire_
-----------

- Anna Sobolewska
- Ben Scott
- Chris Groves
- Rhys Collier
- Ruth Baker
- Syed A. Shah

## Licence

This project is licensed under the MIT License

## Acknowledgements

- Sophie Gill, _Product Owner_
