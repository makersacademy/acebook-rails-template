[![Build Status](https://travis-ci.com/Will-Helliwell/acebook-on-the-rails.svg?branch=master)](https://github.com/Will-Helliwell/acebook-on-the-rails)

# AceBook

[Click here for Trello Board](https://trello.com/b/XiB46v42/acebook-on-the-rails)

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

## How to add the date to the posts

Check the table already created in the file db/schema.rb

```bash
create_table "posts", force: :cascade do |t|
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
```

**Add the date to the index.html.erb**

Open the file app/views/posts/index.html.erb and add  'created_at'

```bash
  <p> <%= post.created_at%> </p> 
```
**To change the format**
```bash
# config/locales/pirate.yml
pirate:
  time:
    formats:
      short: '%d.%m.%Y'

```
Update the file index.html.erb

```bash
  <p>Added at <%= l post.created_at, format: :short%> </p> 
```
**To view data in the table**

```bash
> rails db
> dt
> SELECT * FROM posts;
```

### Getting Heroku Running
Do the following after every commit on the master branch.
```
git push heroku master
heroku run rails db:migrate
```

