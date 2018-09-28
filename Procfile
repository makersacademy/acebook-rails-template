web: bin/rails server -p $PORT -e $RAILS_ENV
heroku: run rake db:migrate
worker: bundle exec rake jobs:work
