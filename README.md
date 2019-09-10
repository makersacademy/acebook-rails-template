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

## Clearance
Clearance is being used to manage User registration.
This page has details on how to override some of the default behaviour (ie. redirects after signing in ).
Unfortunately it isn't that up to date.
https://github.com/thoughtbot/clearance/wiki/Usage

The [readme](https://github.com/thoughtbot/clearance) suggests to override the default clearance routes.
Thus we ran `rails generate clearance:routes` which added `config.routes = false` to the `/config/initializers/clearance.rb` file and a whole bunch of stuff to `/config/routes.rb`.

We then created `/app/controllers/users_controller.rb` which inherits the clearance Users controller and overwrites the `url_after_create` method to allow custom redirects. (We may add further overwrites to this file)

To ensure the router uses our controller we changed `/config/routes.rb`, namely
`resources :users, controller: 'clearance/users', only: [:create] do`
to
`resources :users, controller: 'users', only: [:create] do`




## Travis CI
NB: There is a difference between .org and .com

Check deployment.

https://travis-ci.com/dtrts/acebook-ConnectU


https://docs.travis-ci.com/user/tutorial/
https://docs.travis-ci.com/user/deployment/heroku/



## Heroku
```
brew install heroku
```
Once you have a heroku account you can host your own via these commands:
```
heroku create
git push heroku master
heroku rake db:migrate
heroku open /posts
```

Our app is deployyed at: acebook-connectu.herokuapp.com




## Code Climate
https://codeclimate.com/repos/5d7658b000ca3e0177007b30
Reviews quality of repo
