# Acebook - Dream Journal/Learnings

[Link to Trello Board](https://trello.com/b/IbAlAAMg/acebook)
[Link to Heroku App](https://mighty-woodland-36916.herokuapp.com/users/sign_in)

## Day 1

#### Objectives

- Set up all dependencies and make sure CI/WebServer were set up	
- Start TDD-ing the first of the features, sign up

#### Learnings

- Travis can be a bit fiddly, but very worthwhile	
- Syntax of rails RSpec is fairly limited, so need to explore ways to feature test	
- Learnt how to integrate environment (Heroku) into git repo	
- Learnt how the ActionController can be used in Rails to save LOADS of time

#### Plan For Tomorrow

- TDD sign up page (Dan & Karlo)	
- TDD login authentication and how you'd store user session (sessions?)	
- If we have time, start to TDD some of the post features - (posts appearing in reverse chronological order, for example)

## Day 2

#### Objectives

- Get sign up page up and running
- Follow TDD process for implementing features
- Figure out rails routing
- Get Travis CI happy

#### Learnings

- Getting the sign up page working was quite troublesome using rails, and the authentication/login persistence was a big challenge. In the end we decided to use devise, which meant scrapping a day or so of work. This did, however, give us a cleaner rails file structure to work with. It was also useful understanding how you can route one controller through another, making posts, for instance, belong to users.
- Active record is powerful!
- Rails seems like just patching things together, figuring out how they work under the hood, breaking things, then finally understanding them once they're broken, so version control is SO important.
- Travis is really useful, and great for code continuity. We set up github so that branches can only be merged on review and with CI checks passing.

#### Plan For Tomorrow

- Use Active Storage to implement profile pictures for each user.
- Edit/Delete posts

## Day 3

#### Objectives

- Get profile pictures implemented
- Replace the entire structure with the devises structure

#### Learnings

- Lots of work blocked whilst replacing existing structure with devises structure.
- Implementing active storage heavily dependent on versions of gems
- Edit/Delete can be done by devises, but useful to understand rotues in Rails by manually adding update/delete routes to the posts controller


#### Plan For Tomorrow

- Start exploring implementing more complex features - adding friends/adding pictures to posts/commenting on posts etc.

## Day 4

#### Objectives

- Implement at least one new feature
- Have LOADS of fun
- Plan heavily in the morning

#### Learnings

- We came up against some Heroku quirks, where active storage/minimagick dependencies weren't being loaded into Heroku, and also Heroku didn't know where to store uploaded profile pictures. We got around this by disabling eager-load in config, and then making sure that the config/environments/production.rb file told Heroku where to store files (:local, in this case.)
- Image manipulation in-situ is DIFFICULT when retrieving from Active Storage. We decided to use Mini-Magick to give the option in views to resize/manipulate images with a bunch of different options.

#### Plan For Tomorrow

- Implement chat feature
- Smooth out bugs for image processes

## Day 5

#### Objectives

- Implement chat feature
- Smooth out bugs for image processes
- Look to implement further features - friends etc.

#### Learnings

- Use ActionCable gem to generate chatbox/messenger
- Use JSON to update page and refresh when a new message is posted

#### Plan For Tomorrow

- Implement Friends feature

## Day 6

#### Objectives

- Users have many friends
- Have reciprocal friend relationship

#### Learnings

- Using a fairly simple model to create reciprocal friends when you #create a friend means that a relationship applies to both users.
- The syntax is a bit fiddly, finding friends that aren't your friends already, but also aren't you, from within the user database. Naming is important!!!

#### Plan For Tomorrow

- Implement friend requests!

## Day 7

#### Objectives

- Be able to see users who are not your friends
- Be able to invite those users to be your friend
- That user to be able to confirm/reject request

#### Learnings

- Can just use patch/delete routes to confirm/reject, much easier than creating a custom route!
- You can just set a 'confirmed' column in your friendship migration to false by default. When the user accepts, you set it to true, when they reject you, delete the record.

#### Plan For Tomorrow

- Implement comments on posts
- Improve front-end

## Day 8

#### Objectives

- Comments on posts
- Update front end so buttons aren't buggy, and cards aren't all over the place

#### Learnings

- Comments are very similar to posts, in that they have a many to many relationship, and you can use a simple rails CRUD framework to implement. We actually decided to use JQuery to update the page for both comments and posts, so that the page reloads using JQuery. We had to set up controller/migrations/model for comments.

#### Plan For Tomorrow

- Likes! (y)

## Day 9

#### Objectives

- Implement likes on posts

#### Learnings

- We came up with a really cool way of customising the update (patch) route in rails, by creating private methods. Each like was made user-specific, and toggled as create/delete, depending on whether the user-post-like association already existed in the database we created. Example [here](https://github.com/DanGyi23/acebook-rails-template-railz-rude-boiz/blob/master/app/controllers/likes_controller.rb).

#### Plan For Tomorrow

- Test deployment on Heroku and update readme/tidy up some front end elements

## Day 10

#### Objectives

- Make sure Heroku S3 file storage for active storage is working.
- If we have time, implement a feature that creates a notification on new chat messages

#### Learnings

- Implementing codeclimate was a pleasant surprise, we had good coverage and maintainability!
- For a 2 week project we managed to get a bunch of features implemented fairly quickly with rails, but without a lot of the action modules, we'd have spent a load of time configuring the functionality. We also found that devise had its limitations with regards to customisation, as did active storage.
- For quickly creating apps, rails is cool, but limited.
