# AceBook

Try at [Acebook](https://acebook-runtime-terrors.herokuapp.com/login)

[You can find the engineering project outline here.](https://github.com/makersacademy/course/tree/master/engineering_projects/rails)

1. The card wall is available in the projects tab of this gitrepo

## How to contribute to this project
See [CONTRIBUTING.md](CONTRIBUTING.md)

## Tech

- Ruby on Rails 
- Css/Boostrap for styling 
- Javascript (including vanilla Javascript)
- Rspec-rails for unit testing 
- Capybara for feature testing
- Posgres SQL for database for ActiveRecord 
- ActiveStorage for image storage 
- Act_as_votable for likes
- Heroku for deployment
- AWS S3 for storage in production 
- Travis for continuous integration
- Rubocop for linting 

## Quickstart

First, clone this repository. 
- You may have to type  `$ rvm use '2.7.0'` to implement the right version of ruby 

Then:

```bash
> bundle update
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```
visit localhost:3000/posts in your browser

# How to use

* Sign in to create a user account.
* Add a photo by clicking Post button.
* Comment, like or post something with or without an image
* See the other’s posts, comments, likes, profiles 
* Navigate to your profile page using the profile link provided in the nav bar and edit/update your details. 

## Troubleshooting

If you don't have Node.js installed yet, you might run into this error when running rspec:
```
ExecJS::RuntimeUnavailable:
  Could not find a JavaScript runtime. See https://github.com/rails/execjs for a list of available runtimes.
 ```
That is because Rails will use a Javascript runtime (such as Node) under the hood. The easiest way is to install Node by running `brew install node` - 
and then run `bundle exec rspec` again

## Credits

- [Rebeca Parker](https://github.com/BecaLParker?tab=repositories)
- [Dewald Viljoen (Dev)](https://github.com/Dev-ops-true)
- [Elliott H-S](https://github.com/ells101)
- [JP Ferreira](https://github.com/GoWebMe2020)
- [James McMullan](https://github.com/JamesMcMull)
- [Jenny Bell](https://github.com/jennybell)
- [StuMcardle](https://github.com/StuMcardle)

