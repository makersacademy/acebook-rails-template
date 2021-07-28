# AceBook
## [Makers Academy](http://www.makersacademy.com) - Week 9 Group Project
Team members:
* [Merryn Hurley-Rawlins](https://github.com/merrynhr)
* [Zsuzsanna Ver](https://github.com/MrsVer)
* [Cynthia Fu](https://github.com/YinnyF)
* [Fabio Fodrihuez](https://github.com/frodri13)
* [Masako Gray](https://github.com/1ugia)
* [Sean Phillips](https://github.com/SeanEmmers)
<br><br>
--------
## Project info:
A full-stack web app inspired by the functionality of Facebook.

### Function created:
- Sign up
- Sign in 
- Sign out
- Create a post
- Posts appear with the newest post first
- View the new post on main home page
- Like a post
- Post images
- CRUD on posts
- Add comments
- Nav bar and footer
- Abouts page
- Using Facebook Color Palette on CSS: `#3b5998 , #8b9dc3, #dfe3ee, #f7f7f7, 	#ffffff`

### Technologies used:
* Languages - Ruby on Rails, Ruby, HTML, CSS, JavaScript, 
* Applications - Bulma, Rails, PostgreSQL, 
* Testing - RSpec, Capybara, Rubocop
* Hosting - [Heroku](https://soda-acebook.herokuapp.com/)

--------
REQUIRED INSTRUCTIONS:

1. Fork this repository to `acebook-teamname` and customize
   the below\*\*

[You can find the engineering project outline here.](https://github.com/makersacademy/course/tree/master/engineering_projects/rails)

2. The card wall is here:

[You can find the Trello board here](https://trello.com/b/Sj8Qlv4L/team-soda)

## How to contribute to this project

See [CONTRIBUTING.md](CONTRIBUTING.md)

## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate
# > bin/rails db:migrate RAILS_ENV=test

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

## Troubleshooting

If you don't have Node.js installed yet, you might run into this error when running rspec:

```
ExecJS::RuntimeUnavailable:
  Could not find a JavaScript runtime. See https://github.com/rails/execjs for a list of available runtimes.
```

That is because Rails will use a Javascript runtime (such as Node) under the hood. The easiest way is to install Node by running `brew install node` -
and then run `bundle exec rspec` again

