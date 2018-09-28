# Deployment on Heroku

At a certain point, we decided to deploy our MVP on Heroku to get an idea on how to do it as a new skill but also to make sure our app was actually working.

## Procfile

On Heroku's website, it is advised to create a [Procfile](https://devcenter.heroku.com/articles/procfile) in the app's root directory to declare a varity of process types executed by the app's [dynos](https://devcenter.heroku.com/articles/dynos). Ours includes:

```
web: bin/rails server -p $PORT -e $RAILS_ENV
heroku: run rake db:migrate
worker: bundle exec rake jobs:work
```

Once our app deployed on Heroku, we realised that our tables weren't created as expected. We will explain in [Heroku on CLI](https://github.com/ChocolatineMathou/acebook-PushMePullYou/blob/master/docs/deployment-heroku.md#heroku-cli) how we solved this issue.

## Deploy

Once our account set up, the easiest way to deploy the app is to use GitHub as the deployment method. You just need to select the repo you want to use and ta-da. Or almost.  
It didn't work the first because:  
- We didn't have a Procfile  
- We didn't specify our root.  

Let's assume your [Procfile](https://github.com/ChocolatineMathou/acebook-PushMePullYou/blob/master/docs/deployment-heroku.md#procfile) is set up, you have to specify your root in `./config/routes.rb`.

To make things easier, you can enable automatic deploys where every push to `master` will deploy a new version of the app.

## Heroku CLI

Basically, you can do a lot of things from your Command Line if you've installed [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli#download-and-install): create an app, deploy the application to Heroku, access the logs, open the app in your browser, etc.  
We worked from our Command Line to migrate our database running this command: `heroku run rake db:migrate`.