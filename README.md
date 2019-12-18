"Acebook - Runtime TError

1. Updated README with team name, project link and card wall links.


** User Stories **

```
As a User
So that I can login and view my account
I would like to have a login page.
```
User can view the login page at:
https://desolate-atoll-44314.herokuapp.com/users/sign_in

Functionality included:
  email & password with Login button that 'solidifies' as mouse passes over it;
    redirects to: https://desolate-atoll-44314.herokuapp.com/users/ideas
  'Remember Me' tick-box; to store login details;
  'Sign Up' hyperlink;
    redirects to: https://desolate-atoll-44314.herokuapp.com/users/sign_up
  'Forgot your Password?' hyperlink;
    redirects to: https://desolate-atoll-44314.herokuapp.com/users/password/new


```
As a User
So that I can see all my information
I would like to have a profile page.
```
Profile page has password change option, and other edit options at:
https://desolate-atoll-44314.herokuapp.com/users/edit

```
As a User
So that I can see posts
I would like to have a homepage.
```
Homepage is launched after login here:
https://desolate-atoll-44314.herokuapp.com/users/ideas

Functionality included:
  List of 'Comments' to-date;
  'New Comments' hyperlink;
    redirects to: https://desolate-atoll-44314.herokuapp.com/ideas/new
  'Back' hyperlink.

# AceBook

REQUIRED INSTRUCTIONS:

1. Fork this repository to `acebook-teamname` and customize
the below**

[You can find the engineering project outline here.](https://github.com/Riz1702/acebook-rails-template.git)

2. The card wall is here: <https://trello.com/b/kBaMHz4x/acebook>

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

<!-- ------------------ User Stories ------------------------ -->

As a User
So that I can login and view my account
I would like to have a login page.

As a User
So that I can see all my information
I would like to have a profile page.

As a User
So that I can see posts
I would like to have a homepage.

As a User
So that I can let my feelings known
I would like to post my thoughts.

As a User
So that I see all my pictures in one place
I would like to have a gallery.
