# MugManual

Follow this link to our deployed app      - https://mugmanual.herokuapp.com/
Follow this link to see our GitHub page   - https://github.com/hemser1/acebook-MugManual
Follow this link to see our Trello Board  - https://trello.com/b/2i4JEjI7/mugmanual-trello

## What we do

MugManual is the modern alternative to facebook - built in Ruby on Rails 5.2, with hybrid React pages handling a general wall as a single page application. MugManual allows you to post on a general wall, or a specific users wall - including your own! You can delete your own posts, and edit them within the last 10 minutes!

## Local Quickstart in Rails

First, clone this repository. Then:

```console
cd to acebook-MugManual
bundle install
rails db:create
rails db:migrate
rails s
```
- navigate to http://localhost:3000/

## Rails with React

To run this project with a partial React interface, clone this repository. Then:

```console
cd acebook-MugManual
bundle install
rails db:create
rails db:migrate
rails s -p 3001
```
- navigate to http://localhost:3001/
- go back to the terminal, create a new tab (leave localhost 3001 running) and run:

```console
cd mugmanual-fe
npm install
npm start
```

- React will navigate you to (likely) http://localhost:3001/
- enjoy interacting with the homepage entirely in React!

## Problems with any of the above?

- Should you have any trouble running the rails local host, run:

```console
sudo lsof -i :3001
sudo kill *the PID numbers currently running*
rails s -p 3001
```
- if asked to run on a different local host when booting up the React server, simply type 'Y'


## Contribution
If you would like to contribute to this project, please submit a pull request at our github page.

## Final Thoughts
Freddie sucks.