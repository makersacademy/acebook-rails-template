# AceBook
by JAANIS

1. [You can find the engineering project outline here.](https://github.com/makersacademy/course/tree/master/engineering_projects/rails)

Jaanis' Code Climate Link:
https://codeclimate.com/github/Aracho1/acebook-JAANIS

REQUIRED INSTRUCTIONS:

2. [The card wall is here.](https://trello.com/b/mU9Va6vg/team)

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

## 
=======
### User Stories

**User Sign Up:**
```
As a user of ACEBOOK
So I can post something in my name
I want to sign up.
```
**Planning:**

In routes.rb:
```
resources: users
```

-> button "Sign Up" on homepage which links to users/new page - index.html.erb

-> users/new will be a form containing: -
  - email address
  - username
  - password
  - Sign Me Up!

-> save user in database: id, email, username, encrypted password (encrypted password assigned to validation ticket)

-> if save didn't work, redirect back to form with error messages (assigned to validation ticket)

-> else
  - user is logged in (sessions/new)
  - redirect to user's posts page
  - receive message to say successful sign up!

| Class | User |
----|----
| Properties | username, email, password |
| Methods | < ApplicationRecord |

User Table
id | username | email | password
-|-|-|-

To create user table, we did:
```
bin/rails generate model User username:string email:string password:string
bin/rails db:migrate
```
============================

**Further Research**

Linking Users to Posts:

class User < ActiveRecord
  has many: posts
end

class Post < A....
  belongs_to: user
end

===============================

