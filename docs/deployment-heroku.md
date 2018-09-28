# Deployment on Heroku

At a certain point, we decided to deploy our MVP on Heroku to get an idea on how to do it as a new skill but also to make sure our app was actually working.

## Procfile

On Heroku's website, it is advised to create a [Procfile](https://devcenter.heroku.com/articles/procfile) in the app's root directory to declare a varity of process types executed by the app's [dynos](https://devcenter.heroku.com/articles/dynos). Ours includes:

```
web: bin/rails server -p $PORT -e $RAILS_ENV
heroku: run rake db:migrate
worker: bundle exec rake jobs:works
```
The first process will start up a web server while the second will run db:migrate to create our tables and the third one

## Deploy

## Heroku on CLI