<h1 align="center">🦎 LizardBook</h1>

<p align="center">
  <a href="#user-content-card-wall">Card Wall</a> •
  <a href="#user-content-team-blog">Team Blog</a> •
  <a href="#user-content-quickstart">Quickstart</a> •
  <a href="#user-content-authors">Authors</a> •
  <a href="#user-content-user-stoies">User Stories</a> •
  <a href="#user-content-database-tables">Database Tables</a> •
  <a href="#user-content-technologies-used">Technologies Used</a>
</p>

A team based project, working to a client's brief, to create a social media platform.  
<a href="https://lizardbook.herokuapp.com">Click here to view the app online!</a>

![Screenshot](https://github.com/Mezela/acebook--LizardBook-/blob/master/Screenshot%202019-11-11%20at%2015.22.31.png?raw=true)
------------
## Card Wall:
https://trello.com/b/ODg1c9f4/lizardbook-by-team-lizard

## Team Blog:
https://medium.com/team-lizard

## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate
    bin/rails db:migrate RAILS_ENV=development
    bin/rails db:migrate RAILS_ENV=test

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```
------
## Authors
- Heli Sivunen: https://github.com/PacificRebel
- Josh Davies: https://github.com/JoshDavies
- James Clark: https://github.com/jmhc22
- Pamela Mezue: https://github.com/Mezela
- Jess Lonsdale: https://github.com/jlonsdale
- Duncan Skinner: https://github.com/Duncan9099
--------
## User Stories

✅ Users can sign up with an encrypted password and unique username.  
✅ Users get errors for incorrect sign ins.    
✅ Users can log in with a username and log out.  
✅ Users can view profile pages.  
✅ Users can make posts. (with timestamp)  
✅ Users can view posts and see who made them. (newest first)  
✅ Users can only delete their own posts.  
✅ Users can make, edit & delete comments on any post.  
✅ Users can only edit their own comments or posts, up-to 10 minutes after posting.  
✅ Users can post to another users profile OR to the main newsfeed.  
✅ Users can customise their own profile font & background colour.  
✅ Users can 'like' a post or comment.  
✅ Users can undo a 'like' on a post or comment.  
✅ Custom (404) This user does not exist

----------
## Database Tables

User Table  
ID | username | password | email | full_name | lizard_species | birthday | profile_picture | created_at | updated_at | font_family | background_colour |  

Post Table  
ID | content | created_at | updated_at | user_id | receiver_id |

Comment Table  
ID | text | created_at | updated_at | user_id | post_id |

Likes Table  
ID | user_id | post_id |

Comment_Likes Table  
ID | user_id | post_id |

### Domain Relationships
- | User |------≡| Posts |
- | User |------≡| Comments |
- | User |------≡| Likes |
- | User |------≡| Comment_Likes |

- | Post |------≡| Comments |
- | Post |------≡| Likes |

- | Comment |------≡| Comment_Likes |
----------------
### Technologies used:
- Ruby
- Rails
- Bcrypt
- RSpec
- Capybara
