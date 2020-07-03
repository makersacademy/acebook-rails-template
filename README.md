# Jjerbook - A Facebook Clone Project

### Developers

- [Jack Perrin](https://github.com/perrinjack)
- [Emanuele Pace](https://github.com/Emanuele-20)
- [Rich Ewin](https://github.com/joshuaabrookuk)
- [Joshua Brook](https://github.com/TimCPB)

### Technologies

- Programming Language: Ruby, HTML, CSS
- Web Framework: Ruby on Rails
- Testing Framework: Rspec, Capybara
- CI/CD: Travis
- Database: PostgreSQL, TablePlus
- Gems: Rubocop, Simplecov, BCrypt
- Cloud Platform: Heroku

### User Stories

## Project Structure

- We ran three daily standups: morning, lunchtime and evening, which provided us with strict planning throughout the project.
- We paired daily to complete allocated user stories. We switched pairs on a daily basis. At times, we used a technique called 'mobbing' to come together as a team if a pair was blocked. This worked amazingly well on every occasion!
- We recorded the ongoing status of each user story using a [Trello Borad](https://trello.com/b/vPCTtQTU/jjer-acebook-team-project). This helped when allocating work and identifying each pair's workload.
- We completed our first [MVP](LINK) on Thursday. We completed our second [MVP](LINK) on WHEN.
- We each contributed to a [workdoc](https://docs.google.com/document/d/1d5D25TKtcbWB10EwE9Y4g4MDCJh_4K9d9oV725ppsYQ/edit daily that allowed each member of the team to input ideas, basic pseudocode to attack a problem, and collaborate on project strategy.

## Domain and Process Modelling


- Our app is fully tested, adopting both unit and feature testing.

## How to run

- In your preferred browser, navigate to ```https://jjer.herokuapp.com```

To view the code:

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec
> bin/rails server # Start the server at localhost:3000
```
