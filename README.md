# MakersBnB
BnB listing and booking app built with Ruby, Sinatra, PostgreSQL
## MVP User Stories to complete

`````
As a lonely person
In order to start connecting with people
I want to sign up to AceBook
`````

`````
As an AceBooker
In order to use AceBook whenever I want
I want to sign in
`````

`````
As an AceBooker
So that I can update my friends with what's going on
I want to be able to make a post
`````

`````
As an AceBooker
So that I can correct embarrassing spelling mistakes
I want to be able to edit my posts
`````

`````
As an AceBooker
So I can clear negativity from my profile
I want to be able to delete my posts
`````

`````
As an AceBooker
To reminisce about past events
I want to read through previous posts
`````

`````
As an AceBooker
So that I can see the most relevant posts first
I want to see posts in reverse chronological order
`````

## Domain Model
![domain model](./public/images/diagram2.png)

## How to use

### To set up the project

Clone this repository and then run:

```
$ bundle
```

### To set up the database

Run the Rakefile:

```
$ rake setup
```

### To run the AceBook app:

```
$ ruby app.rb
```

To view the app in a browser, navigate to `localhost` followed by the port (default is `4567`), e.g. `localhost:4567`.

### To run tests:

```
rspec
```

### To run linting:

```
rubocop
```

## Future updates

1. ...
