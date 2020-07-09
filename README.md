# AceBook

We have been tasked with developing a Facebook clone as a two week team project using Ruby on Rails working off a feature list rather than user stories. Our wonderful team is made up of:

* Benedetta Arinci (https://github.com/BeneArinci)
* Alastair Sumner (https://github.com/Sumner1185)
* Katie McDonagh (https://github.com/Katie-McDonagh)
* Anthony Donovan (https://github.com/ad13380)

# Initial Ideas

We spent the first afternoon of the project breaking down the first list of features that were provided for us into a number of tasks on our Trello board (https://trello.com/b/WN24QLdD/acebook-bits-please) and created an initial mock-up of how we expected our Acebook site to look:

## Flow representation of our MVP

<p align="center">
<img src=/public/img/initialmodel.png width=50%>
</p><br><br>


## Views

<p align="center">
<img src=/public/img/views.png width=80%>
</p><br><br>

# User Stories

```
As a user
So that I can connect to other people during this pandemic
I would like to sign up to a new social network
```
```
As a user
So that I can start using Acebook
I would like to be able to sign in
```
```
As a user
So that I can start sharing my thoughts and feelings
I would like to be able to add a new post
```
```
As a user
If I change my mind about what I would like to share
I would like to be able to delete a post
```
```
As a user
If I make a mistake or would like to add or change what I say
I would like to be able to edit a post
```
```
As a user
So that I can see when a post was created
I would like to visualise every post with the date it was created
```
```
As a user
For security reasons, after I finished using the app
I would like to be able to sign out
```
```
As system designer
So that I can offer an improved user experience
I would like to collect user's first and last name on sign up
```
```
As system designer
So that I can offer high level of security
Users will have to provide an email address with a correct format
```
```
As system designer
So that I can ensure higher level of security for users
Users will have to provide a password of between 6 and 10 characters
```
```
As a system designer
To ensure that the service is fair and secure
Users are only able to edit and delete their own posts
```
```
As a system designer
So that a specific comment's subject matter cannot be changed after a certain time
Users are only able to edit their posts within 10 minutes from their creation
```
```
As a system designer
to ensure security and a good user experience
Any non signed in user cannot visit any page other than the home page
```

## Daily structure

* 9:45am - Stand up
*	9:45am - 10:15am: Day plan & code reviews
*	10:15am - 12:00pm: Morning pairing session
*	12:00pm - 12:30pm: Pre lunch catch up
*	2:00pm - 5:00pm: Afternoon pairing session
*	5:00pm - Retro (daily review + next day's plan)


## Sprint 1

Features to implement:

1. Ability to Log in/ sign up: 
    * Ability for user to sign up with name, email, password
    * Ability for user to log in with password and email
    * Encrypt password
    * Log in/ sign up checks (valid password/valid email address)
  
2. Ability to post a message to the board:
    * Logged in users can post a message to the board (any length, just text)
    * Message comes with a time stamp on day written
    * Message comes with date stamp if older than 1 day
    * Messages appear on screen newest first
  
3. Team work:
    * Successfully deploy to Heroku
    * Ensure Travis builds are green
    * Get Rubocop set up and working
  
Each pair will take on responsibility for a feature, developing it full stack, and will work on it for the day, if there is more than 1 days work they can continue it for another day, however we will swap pairs if the feature takes more than 2 days to complete.

Bene and Al: ability to sign in/ sign up
Ant and Katie: ability to post message to board


## Sprint 2

For the second sprint we decided to change our structure so that each team member had the chance to work on all features and not just on those initially assigned to that first pairing team.

Features to implement - aim to complete all user stories from current Trello cards

1. Create Sessions:
    * Code should create a new session when a user logs in
    * Session should be terminated when user logs out

2. Posts:
    * Assign a user_id to a post when created so that they can only be be manipulated by the creator
    
3. Edit posts:
    * When a post is created the user should have a 10 minute window to edit
    * A user can only edit and delete their own posts
    
4. Additional features:
    * Create sign out link available on all pages
    * Users cannot add a blank post
    * Posts can have line breaks
    * Anyone not logged in should not be able to visit any page other than the index page

5. Testing:
    * Rubocop
    * Simplecov

By the end of this sprint we had completed all user stories so far. The only features we were not able to implement were
   * Users cannot add a blank post
   * Posts can have line breaks
   * Simplecov
   
Day 1: Al & Katie / Ant & Bene
Day 2: Al & Ant / Bene & Katie

# Sprint 3

Last thing Friday we asked for a new feature to work on that we could break down and plan our third sprint around. The feature we were given was the ability for a user to comment on each other's posts.
  
However we were thrown a curve ball during our morning stand up that due to a shift in the product market-fit that we are trying to achieve with this application, we need to implement a new feature that was to be prioritised above all other work. This feature was to add photo albums. Users want to be able to upload photos to display as their profile picture, so that everyone can see who they are. 

1. A signed-in user can:
    * Upload photos which are stored in albums
    * Choose a photo to be their profile picture
    * Edit or delete photos (but not ones they don't own)
    * See the albums of other users

- Further Challenge
    * Use AWS to store images
    * A signed-in user can like and comment on photos

2. A signed-in user can:
    * comment on any post
    * see a helpful message that their comment was successfully posted
    * edit their own comments (for up to 10mins)
    * edit capability is not possible afterwards
    * see a helpful message that the edit was successful
    * delete their own comments
    * see a helpful message that the delete was successful
    
 3. Outstanding Tasks:
    * Comments cannot be blank
    * Posts can have line breaks
    * SimpleCov
    
Day 1: Al & Katie / Ant & Bene
Day 2: Al & Ant / Bene & Katie

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





