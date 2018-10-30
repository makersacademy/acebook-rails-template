# AceBook

[![Build Status](https://travis-ci.org/Kharouk/acebook-ciCADA.svg?branch=master)](https://travis-ci.org/Kharouk/acebook-ciCADA)
[![Test Coverage](https://api.codeclimate.com/v1/badges/5674a4684704c9f4c615/test_coverage)](https://codeclimate.com/github/Kharouk/acebook-ciCADA/test_coverage)
[![Maintainability](https://api.codeclimate.com/v1/badges/5674a4684704c9f4c615/maintainability)](https://codeclimate.com/github/Kharouk/acebook-ciCADA/maintainability)

This repo is a Ruby on Rails clone of FaceBook built by ciCADA. Signed up users of AceBook share text and image posts and respond to them through likes and comments.

The card wall is [here](https://trello.com/b/Jmx4wwHz/acebook-cicada).

## Installation

To run aceBook on your localhost first clone the repo and then follow these steps from the root of the repo:

```bash
$ bundle install
$ bin/rails db:create
$ bin/rails db:migrate
$ bin/rails server
```

Then, go to `http://localhost:3000` to run aceBook.

## Testing
At the time of writing (17:00, 29th of October) there are 60 tests written (7 of which are pending) with no failures. These tests cover 100% of the codebase.

To run the tests, just run `rspec` from the root of the repo.

We have set this repo up at Travis, so click on the `Build: Passing` button at the top of this README to see the build logs for the latest version of the app.

## Contributing

If you want to contribute to this project you are more than welcome to open a PR.

Please note, we've set ourselves quire rigorous linting and code coverage requirements:
 - 90% code coverage on every non-spec ruby file.
 - 95% overall coverage for the app.
 - No rubocop offenses. Our rubocop.yml can be found. [here](https://github.com/Kharouk/acebook-ciCADA/blob/master/.rubocop_todo.yml).

We would be very happy for you to contribute to our app, but we won't accept any PRs which do not meet these requirements - we've already suffered through them. When you open a PR, Travis will check to see if your PR meets these requirements.

If you notice any bugs please open an issue and we'll get onto it.

## License

This project is under the MIT license.
