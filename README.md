# AceBook
[![Maintainability](https://api.codeclimate.com/v1/badges/394792d5ea375ab45585/maintainability)](https://codeclimate.com/github/jgumoes/acebook-loungin-lizards/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/394792d5ea375ab45585/test_coverage)](https://codeclimate.com/github/jgumoes/acebook-loungin-lizards/test_coverage)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)

## Beta Version

Checkout the beta version of AceBook - deployed here via Heroku and Circle CI:

[AceBook](https://aqueous-thicket-94433.herokuapp.com/)
-------------------------------------------------------

## Getting Started

Clone the repository

```shell
git clone https://github.com/jgumoes/acebook-loungin-lizards
```

Install dependencies

```shell
cd acebook-loungin-lizards
bundle install
```

Running test suite

## Ruby Version

`2.7.2`

## Development Dependencies

**Gems:**

```
byebug
capybara (~> 2.13)
devise (~> 4.7)
dotenv
jbuilder (~> 2.5)
jquery-rails (~> 4.4)
listen (>= 3.0.5, < 3.2)
mimemagic (~> 0.3.8)
pg
puma (~> 3.12.6)
rails (~> 6.0.0)
rspec-rails (~> 4.0)
rspec_junit_formatter
rubocop
rubocop-rails
sass-rails (~> 5.1.0)
selenium-webdriver
simplecov
therubyracer
tzinfo-data
uglifier (>= 1.3.0)
web-console (>= 3.3.0)
```

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

## Troubleshooting

If you don't have Node.js installed yet, you might run into this error when running rspec:
```
ExecJS::RuntimeUnavailable:
  Could not find a JavaScript runtime. See https://github.com/rails/execjs for a list of available runtimes.
 ```
That is because Rails will use a Javascript runtime (such as Node) under the hood. The easiest way is to install Node by running `brew install node` -
and then run `bundle exec rspec` again
