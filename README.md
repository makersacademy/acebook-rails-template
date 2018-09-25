# Acebook

[![Waffle.io - Columns and their card count](https://badge.waffle.io/LazySamir/Acebook-EagleWithTopHat.svg?columns=all)](https://waffle.io/LazySamir/Acebook-EagleWithTopHat)

[![Build Status](https://travis-ci.org/LazySamir/Acebook-EagleWithTopHat.svg?branch=master)](https://travis-ci.org/LazySamir/Acebook-EagleWithTopHat)

## The Mission
Create a clone of a well-known social media platform using Rails.

## Created By
- [Alastair Edmonds](https://github.com/Alastair2D)
- [Esam Al-Dabagh](https://github.com/EsamAl-Dabagh)
- [James Sutherland](https://github.com/LondonJim)
- [Samir Soormally](https://github.com/LazySamir)

## How do I run it?

##### Download the app
```
$ git clone git@github.com:LazySamir/acebook-eaglewithtophat.git
$ cd acebook-eaglewithtophat
$ bundle
```

##### Set up database
```
$ rake db:drop db:create db:migrate
```

##### Start the server
```
$ rails server
```

### How do I use it?
- go to localhost:3000/posts
- click 'New post' link
- enter message body in the text box and press submit
- see all current posts in chronological order

## User Stories
```
As a user
So I can created an account
I want to be able to signup
```

```
As a user
So I can access my account
I want to be able to login
```

```
As a user
So I can express myself
I want to be able to create posts
```

```
As a user
So I can express agreement with someone else's post
I want to be able to like posts
```

```
As a user
So I can see when someone created a post
Posts will show when they are created
```

```
As a user
So I can see latest posts
Posts will display with newest first
```

```
As a user
So I can spare my blushes
I can delete my own posts
```

```
As a user
So I can fix typos
I can update my post upto 10 mins after it's created.
```

```
As a user
So I can be sure likes haven't be gamed
Users can only like a post once.
```

```
As a user
So I can create a conversation
I want to be able to comment on posts
```

## Database Tables

```
+--------------------------------------------+
|                  Comments                  |
+--------------------------------------------+
| id | user_id | post_id | body | created_on |
+----+---------+---------+------+------------+

+--------------------------------------------+
|                    Users                   |
+--------------------------------------------+
| id | handle | full_name | email | password |
+----+--------+-----------+-------+----------+

+-----------------------------------------------+
|                     Posts                     |
+-----------------------------------------------+
| id | user_id | body | created_on | updated_on |
+----+---------+------+------------+------------+

+------------------------+
|       Liked_posts      |
+------------------------+
| id | post_id | user_id |
+----+---------+---------+
```
