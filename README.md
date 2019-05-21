# AceBook

  This project uses Ruby Rails, Capybara, RSpec and databases to create the foundations of a social media app.


  [This is the engineering project outline.](https://github.com/makersacademy/course/tree/master/engineering_projects/rails)


## How to View and Use App

1. Clone this repository.
2. Run `bundle install` in your command line to install all gems in the Gemfile.
3. Run `bin/rails db:create` in your command line to create the required databases.
4. Run `bin/rails db:migrate` in your command line to create the required tables in the databases.
5. Start the server by running `bin/rails server` in the command line.
6. -WIP-

### How to Run Tests

`bundle exec rspec` in the command line will run the RSpec / Capybara tests.

## Model View Controller
![alt text](https://github.com/Hannah-Frost/acebook-Isambard/MVC.png)


## User Stories
```
USER SIGN-UP

As a user,
so that I don't forget to sign up,
I am redirected to a sign up page unless already signed up.

As a user,
so that I know which details are required when signing up,
I am prompted to enter a email and password.

As a user,
so that I know if my email is valid,
I see a helpful message explaining if my email is not valid.

As a user,
so that I know if my password is valid,
I see a helpful message highlighting the required length.

As a user,
so that I know I have signed up successfully,
I want to be redirected to a page confirming my sign up.
```

```
USER SIGN-IN

As a user,
so that I don't forget to sign in,
I am redirected to the index page unless already signed in.

As a user,
so that I can sign in,
I can see a link redirecting to a page where I am prompted to enter a email and password.

As a user,
so that I know I have entered my email correctly,
I should receive an error message if my email is misspelt.

As a user,
so that I know I have signed in successfully,
I want to be redirected to my post page.
```
