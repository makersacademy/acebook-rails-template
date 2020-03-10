# AceBook 🐱🚪

[![Build Status](https://travis-ci.org/Kefuri/acebook-catflap.svg?branch=master)](https://travis-ci.org/Kefuri/acebook-catflap)

#### Technologies: Ruby, Ruby on Rails, Heroku App, JavaScript, ActiveRecord, Postgresql, HTML, CSS, Rubocop, ESLint, TravisCI

[Task](#Task) | [Collaborators](#Collaborators) | [Installation Instructions](#Installation) | [Headline Specifications](#Headline_Specifications) |

## <a name="Task">The Task</a>

This proejct involves working in teams to produce a social media platform - 'acebook'.

## <a name="Collaborators">Collaborators</a>

Team Catflap is made up of these crazy cats:
- [Haydon](https://github.com/Kefuri)
- [Emily](https://github.com/EWright212)
- [Ellie](https://github.com/EllieRichardsonJones)
- [Jason](https://github.com/jasylwong) 

## <a name="Installation">Installation Instructions</a>

1. Fork this repository, clone to your local machine and change into the directory:
```
$ git clone git@github.com:kefuri/acebook-catflap.git
$ cd acebook-catflap
```

## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

## <a name="Headline_Specifications">Headline Specifications</a>

* Users can sign up.
* Users can sign in.
* Users can update and delete their own posts.
* Posts show the date they were posted, and who posted.
* Posts appear with newest post first.
* Posts can have line breaks in them.
