# AceBook - Team Rails Virgins

![](https://i2-prod.manchestereveningnews.co.uk/incoming/article16110362.ece/ALTERNATES/s810/0_East-Coast-Main-Line.jpg)

## The Task

To make our first full stack, 2-week, group project from scratch; a Facebook clone called Acebook!

## Our Approach

- This was full stack, and none of our team had ever used Rails before so getting up to speed with that framework took a fair amount of time.
- The main objectives of this project were less product and more process.  So CI/CD, Agile and TDD were at the front of our minds, to varying degrees of success...

## Techstack

```
Back-end >> Rails
Front-end >> Javascript, Jquery, HTML, CSS
Testing >> Rspec, CapyBara, Selenium-Webdriver, Rubocop, Simplecov
CI >> Travis CI
CD >> Heroku
```

## Links for working on this project

The card wall with our to do list is here: https://trello.com/b/PFK2pnre/acebook

## How to get started with this project

First, clone this repository. Move into it on the command line, then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate
 ```
 
 To run the tests:
 
 ```
> bundle exec rspec # Run the tests to ensure it works
```
To start the server:

```
rails s
```
Then visit localhost:3000.

## How to use the website

### 1. Sign up

![Alt text](https://user-images.githubusercontent.com/40341869/63258743-a2830080-c274-11e9-9737-e40f6600e07a.png)

![Alt text](https://user-images.githubusercontent.com/40341869/63259484-6e104400-c276-11e9-8f96-790ef53154c3.png)

### 2. Sign in

![Alt text](https://user-images.githubusercontent.com/40341869/63259103-68662e80-c275-11e9-9e56-e85cbac35340.png)

### 3. Viewing all posts

![Alt text](https://user-images.githubusercontent.com/40341869/63259820-584f4e80-c277-11e9-810b-7ec5fa845e2b.png)

### 4. Adding a post

![Alt text](https://user-images.githubusercontent.com/40341869/63260249-4f12b180-c278-11e9-8586-9790fadb2868.png)

![Alt text](https://user-images.githubusercontent.com/40341869/63260384-b6c8fc80-c278-11e9-8a62-c5b69b52fc57.png)

### 5. Deleting a post

![Alt text](https://user-images.githubusercontent.com/40341869/63260653-7027d200-c279-11e9-9463-ab05953f527b.png)

### 6. Editing a post

![Alt text](https://user-images.githubusercontent.com/40341869/63260939-2d1a2e80-c27a-11e9-9cb2-1ad04a9dce8a.png)

### 7. Adding a comment

![enter-comment](https://user-images.githubusercontent.com/45185594/63522855-00238100-c4f1-11e9-8b7f-fdd7d5d23a28.png)

### 8. Editing/Deleting a comment

![Edit:Delete-Comment](https://user-images.githubusercontent.com/45185594/63522995-3f51d200-c4f1-11e9-8b36-d4168524dd35.png)
![Submit-edited-comment](https://user-images.githubusercontent.com/45185594/63522994-3f51d200-c4f1-11e9-8d2c-56a389c0bb8b.png)

### 8. Logging out

![Alt text](https://user-images.githubusercontent.com/40341869/63261107-8b471180-c27a-11e9-9f74-7fd2023c643b.png)

## Challenges

- Getting the hang of Rails definitely took up a lot of headspace.  Most of us had only used Sinatra before, so having less visibility on routing was a little tricky, and generally the structre was quite overwhelming at first.  But we feel more on top of it now.
- We ended up TDDing very little, mostly we think because we were learning a new technology, so the exploration/implementation phases were very muddled.
-This meant that our CI was more reactive rather than proactive.  Getting our heads around Travis too a while.  But eventually we got it up and running.
- Downstream again with CD we ran into the same problems.  Just remembering to follow all the processes was quite a challenge.
- Our version control and git discpline was a little slack.  Much too much work directly onto the master branch, and there's plenty of orphaned branches lost into the ether.

## Accomplishments

- Our team worked together really well!  We had regular stand-ups every morning, follow by a quick planning and allocation.  We constantly communicated throughout, and had useful retros/merge parties at the end of the day.
- We all feel a lot more confident with Rails.
- We're all pretty pleased with the Front-End/aesthetics!  Turned out pretty well.  We were tempted to turn to a more sophistocated framework like React, but we're glad we didn't in the end as we had plenty on our plates already.

## Future goals

- None of us will probably revisit this project but if we did...  There are plenty more features we'd like to add.
- Acebook is sorely lacking a like button, plus a many to many friends feature.

