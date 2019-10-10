# Acebook - Dream Journal/Learnings

[Link to Trello Board](https://trello.com/b/IbAlAAMg/acebook)

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

#### Plan For Tomorrow

## Day 5

#### Objectives

#### Learnings

#### Plan For Tomorrow
