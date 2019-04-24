Feature: Posts show the date they were posted
=============================================

[Link to trello card](https://trello.com/c/vSf6LfWB/10-posts-show-the-date-they-were-posted-low)

Low

- Date stamp of each post submission shown in posts lists page





Feature: Users can update and delete their own posts
====================================================

[Link to trello card](https://trello.com/c/zGdTbcSV/17-users-can-update-and-delete-their-own-posts-high)

## Pre-requisites

Blocked until https://trello.com/c/XTCQDWMN/7-users-can-sign-up-medium is complete. You can move to "To do" when that's done.


## Importance

High


## Acceptance Criteria

- A non-signed-in user will be redirected to the index page.

- A signed-in user can:
  - update their own posts for a maximum of 10 mins after they're created
  - see a helpful error message if they try to update another user's post
  - delete their own posts
  - see a helpful error message if they try to delete another user's post


## Requirements

- Run a database migration to associate a user to many posts
- Investigate if any current data in any of the prod/dev databases would cause problems if tables were updated
- Add new routes and controller actions
- https://guides.rubyonrails.org/routing.html#nested-resources