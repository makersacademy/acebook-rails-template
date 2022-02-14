# AceBook

REQUIRED INSTRUCTIONS:

1. Fork this repository to `acebook-teamname` and customize
the below**

[You can find the engineering project outline here.](https://github.com/makersacademy/course/tree/master/engineering_projects/rails)

2. The card wall is here: <please update>

## How to contribute to this project
See [CONTRIBUTING.md](CONTRIBUTING.md)

## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

## Troubleshooting

If you don't have Node.js installed yet, you might run into this error when running rspec:
```
ExecJS::RuntimeUnavailable:
  Could not find a JavaScript runtime. See https://github.com/rails/execjs for a list of available runtimes.
 ```
That is because Rails will use a Javascript runtime (such as Node) under the hood. The easiest way is to install Node by running `brew install node` - 
and then run `bundle exec rspec` again




=== Adding Devise ===
gem 'devise', '~> 4.8', '>= 4.8.1' (added to gemfile)
ran: bundle install

Follow instructions here: https://github.com/heartcombo/devise

ran: $ rails generate devise:install (and follow steps in terminal)

- pasted into config/envrionments/development.rb:
   config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

- pasted into config/envrionments/production.rb:
  config.action_mailer.default_url_options = { host: 'https://acebook--chats.herokuapp.com/', port: 8080 }

- pasted into app/views/layouts/application.html.erb:
    <p class="notice"><%= notice %></p>
    <p class="alert"><%= alert %></p>
  
- ran:  rails g devise:views (added a lot of app/views files)

Setup database (user table):
ran: rails generate devise user
and migrate it, ran: rails db:migrate

ran: rails routes (to see new routes added)
      
## Mockup Design

      
![Welcome!](https://user-images.githubusercontent.com/87937468/153431859-d29a5428-1171-44a5-8850-7afec1a5cd4d.png)


