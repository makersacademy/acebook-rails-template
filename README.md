### [Makers Academy](http://www.makersacademy.com) - Week 8 group project

Contibutors: [Josh Blumberg](https://github.com/jlblumberg) | [Chris Eadie](https://github.com/saidbyced) | [Richard Pattinson](https://github.com/richardpattinson)
__________________________________________________________________________________________________________________

[Outline](#Outline) | [Specifications](#Specifications) | [User Stories](#User_Stories) | [Installation Instructions](#Installation_Instructions) | [Tech stack](#Tech_stack) | [Examples](#Examples) | [Future work](#Future_work)

## <a name="Outline">Outline</a>

Work in a team of six to build a functional clone of Facebook.

## Specifications

Specifications and original wireframe mockup [here](https://github.com/makersacademy/course/blob/master/makersbnb/specification_and_mockups.md "Makersbnb specifications").

## User Stories

We derived the following user stories from the specifications and test drove them into creation. 

```
As a user,
so I can list a space,
I want to sign up with an email and a password.

As a signed-up user, 
so I can list a space or book a space,
I want to be able to sign in.

As a signed-in user,
so I can appeal to my customers,
I want to list a space.

As a user with a listed space,
so I can have a portfolio,
I want to be able to list multiple spaces.

As a user with a listed space,
so I can make my listings more specific,
I want to be able to add a short description and price per night.

As a user, 
so I can choose where I want to stay,
I want to see a list of all available spaces.

As a user,
so I can see more details on a space,
I want to see a spaces’ details.

As a user, 
so I can manage my spaces,
I want to see a list of all my spaces.

As a user, 
so that I can log out, 
I want to have a log-out button that will do so.

As a user, 
so that I can’t do illegal things, 
I want to only be able to visit the site's pages if i'm logged in.

As a user who wants to book,
so that I can have a fantastic night away,
I want to be able to book a space for one day.

As a user who wants to book,
so I can’t book a space which is unavailable,
I want to only be able to book spaces for dates which are not already booked.

As a user with a listing,
so that I don’t try to fit too many people on my property,
I want only allow people to book specified days.

As a user looking to book, 
so that I can proceed with the booking, 
I want to be able to submit a booking request.

As a user who has made a booking, 
so that I can keep track of what I’ve done, 
I want to see what bookings I’ve requested. 

```

## <a name="Installation_Instructions">Installation Instructions</a>

### Prerequisite setup:
- Clone this repo to your local machine and cd into it
- Run the command `gem install bundle` (if you don't have bundle already)
- Run the command `brew install postgresql` (if you don't have homebrew installed, do that first. [Instructions here](https://github.com/Homebrew/install))
- When these installations are complete, run `bundle`

### Database setup:
[See original database plan here](https://user-images.githubusercontent.com/41115973/75557670-5a6d4380-5a38-11ea-920f-5700b61a3624.jpg)

To set up the databases with some seed data, run the following commands:

```
rake build_db
RACK_ENV='test' rake build_db
RACK_ENV='production' rake build_db
```

### Running the site
- Run the server with command `rackup`
- Visit `localhost:9292` to use the site

### Testing
- Tests can be run using Rspec. Run the command `rspec`

## <a name="Tech_stack">Tech stack</a>

Front-end:
- HTML & CSS

Back-end:
- Ruby
- Sinatra
- PostgreSQL
- ActiveRecord

Testing:
- RSpec
- Capybara
- SimpleCov

## <a name="Examples">Examples</a>

Once you have signed up you can then log in:

![Sign-up](https://i.imgur.com/iVKlJYH.png)

Logging in takes you to a list of the places available for booking:

![Spaces](https://i.imgur.com/zJayKPp.png)

You can click on more details to view all the details of a space and to submit a booking request:

![More-details](https://i.imgur.com/1j3vdbM.png)

It will only let you book if the space is available: 

![Warning](https://i.imgur.com/J0Gw0WM.png)

Once you have booked you can see a list of your booking requests and their current status:

![My-bookings](https://i.imgur.com/sMepFzm.png)

## <a name="Future_work">Future work</a>

On a revisit of the project, we would build a system to allow for booking requests to be approved by the space's owner. Unfortunately we didn't have time to finish this feature, but we did build the tests for it. You can see the commented out tests in 'spec/features/approve_request_spec.rb' and 'spec/features/displaying_booking_requests_spec.rb'.