build:
  languages:
    - ruby
run:
  rake: bundle exec
  rails: db:create
  rails: db:schema:load
  web: bundle exec rails server -p $PORT