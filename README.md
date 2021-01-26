# AceBook

Jaanis' Trello Board:
https://trello.com/b/mU9Va6vg/team

User Sign Up:
As a user of ACEBOOK
So I can post something in my name
I want to sign up.

resources: users

-> button "Sign Up" on homepage which links to users/new page - index.html.erb
-> users/new will be a form containing: - 
  - email address
  - username
  - password
  - Sign Me Up!

-> save user in database: id, email, username, encrypted password
-> if save didn't work, redirect back to form with error messages
-> else
  - user is logged in (sessions/new)
  - redirect to user's posts page
  - receive message to say successful sign up!

| Class | User |
----|----
| Properties | username, email, password |
| Methods |

class User < ActiveRecord
  has many: posts
end

class Post < A....
  belongs_to: user
end


create table:
class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end


REQUIRED INSTRUCTIONS:

1. Fork this repository to `acebook-teamname` and customize
the below**

h

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
