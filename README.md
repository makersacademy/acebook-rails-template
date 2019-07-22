# AceBook

![Build Status](https://api.travis-ci.org/bengscott2/acebook-livewire.svg?branch=master)

## Project Description

This is a group project at aimed creating Acebook using Ruby on Rails. Acebook is a full stack website that will enable users to create, edit and delete posts as well they'll be able to sign up and log in once signed up. Our development team will be using Agile methods to plan, build and deliver the product. Two day sprints will be used to organize our workflow. We have stand ups twice daily with sprint planning at the beginning and retros at the end of every sprint. We'll use pair programming and TDD to develop our source code with continuous integration being monitored by Travis CI. Our master branch will be continuously deployed to Heroku.

**You can check out our deployed product [here](http://acebook-livewire.herokuapp.com/)**


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
### Code quality tests

- Run `rubycritic` in the command line to see any code quality issues such as smells and high complexity lines. This report will open in the browser. To alternatively see the results in the console, run `rubycritic - f console` instead
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

Feature cards are assigned to pairs, and worked on via branches.  Completed features are blocked from merging to the master branch until a pull request is approved by two team members and CI tests are passing.  Approval is given when the code is understood and is good quality, deployment is automated.

### Review

Product Owner is invited to review in production.

### Retrospection

Stand-ups are held twice a day, to discuss progress and solve blockers. A retro meeting is held at the end of every sprint, to celebrate successes, demo the work, and make the next sprint better.

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
