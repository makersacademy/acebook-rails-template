# AceBook - Team CATS

```
                 ________________
                |    Acebook     |_____    __
                |   Team CATS    |     |__|  |_________
                |________________|     |::|  |        /
   /\**/\       |                \.____|::|__|      <
  ( o_o  )_     |                      \::/  \._______\
   (u--u   \_)  |
    (||___   )==\
  ,dP"/b/=( /P"/b\
  |8 || 8\=== || 8
  `b,  ,P  `b,  ,P
    """`     """`

```

[![Build Status](https://travis-ci.org/learningtocode101/acebook-team-cats.svg?branch=master)](https://travis-ci.org/learningtocode101/acebook-team-cats) 
[![Maintainability](https://api.codeclimate.com/v1/badges/3cb7048acedcfa3b76f1/maintainability)](https://codeclimate.com/github/learningtocode101/acebook-team-cats/maintainability)

## Description

Acebook is Team CATS Facebook clone equivalent that currently supports the following features:
* Users can sign up and sign in with a secure validation process. They can then sign-out when finished.
* Users have their own unique wall which shows their own posts
* Users can edit and delete their own posts, but not other user's posts
* Users can visit `/posts` to see all of the posts made on Acebook from any user
* Users can visit other user's walls and see their posts by typing their email or user ID into the url-bar
* Users can post on other people's walls. They can edit/delete their posts on other people's walls

## Approach
Trello card: https://trello.com/b/N4PRpCHf/acebook-cats  
Team blog: https://medium.com/catspedia 

## Tech Stack
Ruby on Rails  
Travis CI  
CodeClimate  
Heroku  
Rspec  
Capybara

## Quickstart

```bash
$ git clone https://github.com/learningtocode101/acebook-team-cats
$ cd acebook-team-cats
$ bundle install
$ bin/rails db:create
$ bin/rails db:migrate

$ bundle exec rspec # Run the tests to ensure it works
$ bin/rails server # Start the server at localhost:3000
```
To run the tests, navigate to the acebook directory (`$ cd acebook-team-cats`) and run `$ rspec`.

Deployed version of app available at: https://acebook-cats.herokuapp.com/ 

## How to Use

If you don't want to install and deploy your own version of Acebook you can visit a deployed version at: https://acebook-cats.herokuapp.com/ 

From the homepage you can sign up for an account by entering your details in the relevant fields and hitting submit.

You will automatically be redirected to your personal wall (which if you just signed up will be empty for now!). To create a new post, click the `New Post` link, enter your post in the text box and hit submit. It will automatically take you back to your wall and display the new post.

You can then click on the message to edit or delete it respectively.

To visit another user's wall, enter `https://acebook-cats.herokuapp.com/users/[their email address]` into your URL bar. It will then display all their posts. You can post on their wall by clicking on the `new post` link as you do on your own wall.

Whenever you're finished just click `Sign Out`

## User Stories
```
As a User of Acebook 
I can sign up with an email address etc
I can only sign in after an account has been created  
I can sign out when finished 
I can create, edit and delete posts 

As a Developer of Acebook
A user cannot access any post until they are signed in
A user can only edit/delete posts they have created  
```

## Contributors
[Chris Hassan](https://github.com/CKKH)  
[Adam Lodowski](https://github.com/rednblack99)  
[Tom Lawrence](https://github.com/matharotheelf)  
[Shaneil Clarke](https://github.com/learningtocode101/acebook-team-cats)  

## How to Contribute

If you want to improve Acebook and see your name added to the above list of contributors, simply branch this repo, do your thing, and make a pull request back to this repo explaining the contributions you made (although I can't guarantee we will still be monitoring this repo in a few month's time!).
