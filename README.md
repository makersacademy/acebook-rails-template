# Acebook Challenge: Ruff Criminals

[![Build Status](https://travis-ci.org/danieljonesdmj/acebook-ruff-criminals.svg?branch=master)](https://travis-ci.org/danieljonesdmj/acebook-ruff-criminals) [![Maintainability](https://api.codeclimate.com/v1/badges/3b9e7532791176be3436/maintainability)](https://codeclimate.com/github/danieljonesdmj/acebook-ruff-criminals/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/3b9e7532791176be3436/test_coverage)](https://codeclimate.com/github/danieljonesdmj/acebook-ruff-criminals/test_coverage)

*Do you work in the 'garbage disposal' business? Are you looking to connect to your fellow 'misunderstood souls'? Then Ruff Criminal's Acebook is the place for you. Find accomplices, plan 'adventures' and let others know you haven't forgotten about the that time they snitched on you.*

This app lets users create an account, log in, log out, write posts on a shared wall, see the posts on the wall and comment on them.

![Usage example](/lib/RuffScreen.gif)

## Getting started
Enter the following commands in your terminal:

Clone the repository and change into the directory:
`git clone https://github.com/danieljonesdmj/acebook-ruff-criminals.git && cd acebook-ruff-criminals`

Install the required gems:
`bundle install`

Set up the database:
`rails db:create && rails db:migrate`

## Usage
Enter the following commands in your terminal:

Run the server:
`rails server`

Then open your browser, head to http://localhost:3000/ and simply follow the instructions on the page.

## Running tests

This app comes with a full suite of feature and unit tests with >99% test coverage. To run all available tests enter `rspec` in your terminal.  

![Coverage report](https://i.imgur.com/ktuk63d.png)

## Built with
Ruby on Rails - as the web application framework  
Rspec, Capybara, Selenium and SimpleCov - as the testing frameworks  
Devise - as the user authentication solution  
Travis and Code Climate - as the automatic testing solutions

## Authors
The Ruff Criminals:  
[Nabil Far](https://github.com/bilfar)  
[Bibi Collins](https://github.com/bibicollins)  
[Cornelis Heuperman](https://github.com/heuperman)  
[Daniel Jones](https://github.com/danieljonesdmj)  
