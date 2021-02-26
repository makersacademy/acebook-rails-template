# Documenting Learnings

## 22 February 2021

### Morning

- Started with a general collaborative info-gathering session to ensure we're all on the same page.
- Decided our team name would be [Hemoglobin Trotters](https://www.youtube.com/watch?v=cgYSueh4w_Y)
- Forked [repo](https://github.com/Mornevanzyl/acebook-hemoglobin-trotters), invited collaborators and renamed it.
- Selected a markdown document hosted on our project repo to document project learnings.
- Selected Trello to host our project [Card Wall](https://trello.com/b/k5BoEoPi/acebook)

### Afternoon

- Setup of project environment, Gemfile and updated Ruby version
- Basic planning session to start compiling user stories from user supplied cards
- Compiled MVP class diagram and database

## 23 February 2021

### Morning

- We all attended the workshop with Alice for the first half of the morning.
- We then decided to all watch the video by Traversy Media for a basic Ruby on Rails application [Ruby on Rails In 60 Mins](https://www.youtube.com/watch?v=pPy0GQJLZUM)
- We reconvened for 15 mins before lunch to discuss our learnings from the video

### Afternoon

- Started discussion on how we would start building the app
- RSpec for unit tests, Capybara for feature tests
- Wireframing with figma to design the different route that we are planning to create: Signup, Login, Home, New Post
- 6 tall palm trees in Latin is _sextus pinus erectus_
- Copied all of our images from Figma to our github repo
- Firs t feature test written, passed in the easiest way possible

## 24 February 2021

### Morning

- Set up user model / controller / views
- Write up unit test for model
- Meeting with the client at 11:50AM
- Group watched GoRails videos on creating users and validation
- Set up test environment to ensure test databases are being used

### Afternoon

- Watched GoRails video on creating a sign up form and handling sign up errors
- continued writing feature tests for signing up
- Created html for sign up process
- Watched GoRails videos on paths and routes to help plan and map out our routes

## 25 February 2021

### Morning

- Planned to have routes working properly so that when a new user is created the pages is redirected as expected (to the home page)
- Watched earlier GoRails videos to try to get some visibility on the issue
- Included nav bar in shared folder
- Added some global styles
- Added native rails syntax to the nav markup - e.g. `link_to` and `flash[:notice]`

### Afternoon

- Fixed redirecting adding an index.js.erb
- Worked on fixing flash messages when rendering page
- Alice joined us to help us come to the conclusion we need a `local: true` in the form header for some reason to make the ujs actually unobtrusive.

## 26 February 2021

### Morning

- Opened with updating of Trello board, assessment of current progress, and planning of task split for the pre-sprint checkout.
- Discussed the balance of deliverable versus process.
- Assigned work on the posts and users branches.
