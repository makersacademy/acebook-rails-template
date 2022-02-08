# AceBook

REQUIRED INSTRUCTIONS:

1. Fork this repository to `five-aces` and customize
the below**

[You can find the engineering project outline here.](https://github.com/ravensears/five-aces-group-project)

2. The card wall is here: <https://trello.com/b/ezLGgoKk/acebook-five-aces>

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



## CI/CD process - commands

 3335  git fetch https://github.com/ravensears/acebook-five-aces.git
 3336  git branch -a
 3339  git checkout U4_test_CI_CD
 3341  git fetch
 3343  git checkout U4_test_CI_CD 
