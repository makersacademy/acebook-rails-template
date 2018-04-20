# AceBook


<a href="https://travis-ci.org/julesnuggy/acebook-byte-3">
  <img src="https://travis-ci.org/julesnuggy/acebook-byte-3.svg?branch=master"/>
</a>


<a href="https://codeclimate.com/github/julesnuggy/acebook-byte-3/maintainability">
  <img src="https://api.codeclimate.com/v1/badges/3cb11f09ea68cad7b523/maintainability" />
</a>

<a href="https://codeclimate.com/github/julesnuggy/acebook-byte-3/test_coverage">
  <img src="https://api.codeclimate.com/v1/badges/3cb11f09ea68cad7b523/test_coverage" />
</a>

## Description
This is the Engineering Project challenge for weeks 8-9 at Makers Academy.

The Splendaberg team consists of Alfie Darko (@AlfieDarko), Charlene Bastians (@CharSV5), Julian Ng (@julesnuggy), and Tom Betts (@T-Betts).

The app is hosted live using Heroku at: https://splendaberg-acebook.herokuapp.com

We used the Heroku Pipeline integrated with Travis CI for continuous integration and deployment of the app. Only when all tests in Travis were passing (including RSpec, Rubocop and Code Climate) would the Git master branch be deployed to the Heroku Staging Environment. This acted as a live-environment test-bed for the team, who could then manually deploy the app to Production.

## Tech Stack
* Client Side: HTML, CSS, JavaScript, jQuery
* Server Side: Rails, Heroku, AWS S3
* Database: PSQL
* Tools: Travis CI, Code Climate, RSpec, Rubocop, PSequel

## Team & Project Approach
* Project managed by Julian throughout (SPOC)
* Daily Stand Ups in the morning
* Daily Retros in the afternoon
* Outputs of both stored in project Wiki
* Regular informal communications via Slack
* Wiki also used for Knowledge Sharing
* Took a mixed approach of solo, pair and mob work depending on daily priorities, individual learning objectives/desires, and team member experience
* Trello for task management

## Local Set Up
1. Clone repo: `git clone git@github.com:julesnuggy/acebook-byte-3.git`
2. Install Bundler: `gem install bundler`
3. Install app gems: `bundle install`
4. Create local databases: `rails db:create`
5. Migrate database tables: `rails db:migrate`

## Testing & Code Quality
1. Run `rspec` in bash from the project root directory to check feature tests
2. Run `rubocop` to check code quality
3. Check Code Climate images above for additional code quality checks
4. As long as Travis is passing, all these tests/checks are passing

## MVP User Stories
Click [here](Userstories.md) for User Stories

## Card Wall
The project Card Wall is where the team's To Do list and specification are located. This is a "working document" which changes as we complete tasks and implement features.
https://trello.com/b/3DGCTw4g/acebook-byte-3

## Deployment and Database
The app is hosted on Heroku and uses its built-in cloud database (based on PostgreSQL). For this project, we used Tom's Heroku account. You will need to be a Collaborator to be able to run / modify the Heroku app.

To open the app in the deployed Heroku environment:
* Production: https://splendaberg-acebook.herokuapp.com
* Staging: https://splendaberg-acebook-staging.herokuapp.com

To access the psql database hosted on Heroku, in your bash, navigate to the
project directory and run:
```bash
heroku pg:psql # Access the psql REPL
SELECT * FROM <table_name> # Display all table contents
```

## Known Issues
* With the Chat function, there is no way to test the pop-up box function due to non-compatibility between Selenium WebDriver and Turbolinks. This is a known problem by the Shopify team.
Selenium doesn't pick up the pop-up element.
* Didn't have time to test Avatar upload function.
* Didn't test the new line funciton in Posts.
* Issue with JavaScript / jQuery where the click event is not picking up the first time, thus preventing no-refresh update of Likes counter.
