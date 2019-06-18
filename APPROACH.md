## Sprints

*First Sprint*
Day one:
* Familiarise ourselves with Rails
* Set up CICD  (travis, heroic)
* Set up code quality checkers (rubocop, simplecov)
* Set up documentation
* Set up reminders on slack

Day two:
* Create user stories from spec
* Mockups of site
* Prioritise feature development
* Setup naming conventions
* Develop features

---

### Setting up local databases


*Development Environment*

We must manually create the local database for ActiveRecord:
```
CREATE DATABASE pgapp_development;
```
We must run the migrations to set up what we want:
```
bin/rails db:migrate RAILS_ENV=development
```
To serve the app:
```
rackup
```
Visit the local server:
```
http://localhost:9292
```
The page showed a confirmation that rails is working, not the app, so:
```
rake routes
```
which returned:
```
Makerss-MacBook-Pro:acebook-Spacebook student$ rake routes
   Prefix Verb   URI Pattern               Controller#Action
    posts GET    /posts(.:format)          posts#index
          POST   /posts(.:format)          posts#create
 new_post GET    /posts/new(.:format)      posts#new
edit_post GET    /posts/:id/edit(.:format) posts#edit
     post GET    /posts/:id(.:format)      posts#show
          PATCH  /posts/:id(.:format)      posts#update
          PUT    /posts/:id(.:format)      posts#update
          DELETE /posts/:id(.:format)      posts#destroy
```
which told us we need to visit:
```
http://localhost:9292/posts
```

*Test Environment*

Running rspec told us we need another database:
```
CREATE DATABASE pgapp_test;
```
This was enough, we didn't need to run migrations again because it's done while testing.

After looking into the Rake commands, we are also able to setup the database automatically by running:
```
rake -T
rake db:setup
```

*Populate the database*

In db/seeds.rb populate the database with *Post.create('message')*

e.g.,

```
i = 0

while i < 10 do
 Post.create(message: "Hello, world!")
 Post.create(message: "I'm next")
 i +=1
end
```

then run
```
rake db:seed
```