# DreamBook
A clone of Facebook. 


**Contributors**
----
[Katie Jones](https://github.com/katieljones)
[Joanne Chen](https://github.com/Joanne0330)
[Dhara Patel](https://github.com/Dhara-95)
[Sam Landman](https://github.com/samlandman)
[Rabee Mghrabi](https://github.com/Rabee93)


**User Stories**
----
```
As a User,
So that I can have a DreamBook account,
I would like to be able to Sign Up.
```
```
As a User,
So that I can login to my DreamBook account,
I would like to be able to Login.
```
```
As a User,
So that I can see everyone's posts,
I would like to see all posts on one page.
```
```
As a User,
So that I can write a post to the feed,
I would like to be able to enter a message.
```
```
As a User,
So that I can see the most recent posts,
I would like to see the newest posts first.
```
```
As a User,
So that I can amend my post within the 10 minute window,
I would like a button that will allow me to edit my post.
```
```
As a User,
So that I can remove my post I no longer want,
I would like to delete my post.
```
```
As a User,
So that I can see who has written a post,
I would like to see their email next to their post.
```
```
As a User,
So that I can see when a post was written,
I would like to see a timestamp next to all posts.
```
```
As a Developer,
So there are no security breaches,
I would like all passwords to be encrypted in the database.
```
```
As a Developer,
So that no one can access the feed,
I would like non logged in users to be redirected to the welcome page.
```
```
As a Developer,
So that only account holders can access the feed,
I want all users to create an account before logging in.
```
```
As a Developer,
So that users have hard-to-hack accounts,
I would like all passwords to be between 6 and 10 characters.
```


**MVC Model**
----
https://app.diagrams.net/#G1b3gUNbSsjjSLvQobQ23b0YSEH9jeiFjR 


**Trello Board**
----
Dreambook card wall: https://trello.com/b/qs8H5nRk/acebook-dreambook


**Set-up Instructions**
----
Run the following commands in your terminal to install the project on to your local computer: 

```
$ git clone https://github.com/katieljones/acebook-dreambook-2020.git
$ cd acebook-dreambook-2020
& bundle install
$ bin/rails db:create
$ bin/rails db:migrate
```


**Testing**

Run the following command in your terminal to run the tests:
```
$ rspec
```


**Using Dreambook**

* Our app is hosted on Heroku and can be used by navigating to this web address in your browser:
https://sheltered-sands-59716.herokuapp.com/

* To use the web app using the 'localhost' server run the following command in your terminal and then navigate to http://localhost:3000/ in your browser: 

```
$ rails server
```


**Additional Functionality**
----
 Allow comments on posts
 Improve CSS
 User Profiles with Avatars 
 Allow posts to have upload file function