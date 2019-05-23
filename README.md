# AceBook


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
## Card Wall

As a group we made the decision to use Trello for our Card Wall.

URL - https://trello.com/b/1N8vcjoF/acebook-fiveguys


## Approach

Sign Up:

```
As a User,
So that I can use the website,
I'd like to be able to sign up.
```

```
As an administrator,
So that only registered Users can access Acebook,
I'd like unregistered Users to only be able to view the index page.
```

```
As an adminsitrator,
So we can validate a new user,
I'd like Users to only be able to sign up with a valid email address.
```

```
As a administrator,
So Users have guidance with the sign up process,
I'd like to indicate why the email and password was not valid.
```

```
As a User,
So I can keep my account secure,
I'd like to be able to sign up with a valid password (6-10 characters).
```

```
As a User,
So I know that I have signed up successfully,
I'd like to be redirected to a Post page with a welcome/successful message.
```
