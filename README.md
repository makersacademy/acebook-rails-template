# AceBook -- created by Team Derailed

## SET UP TESTING:

1. Install `factory_bot_rails` and `rails-controller-testing` by adding the following to both development and test group in Gemfile

```
>   gem 'rails-controller-testing'
>   gem 'factory_bot_rails'
```

2. Update your bundle

```bash
$ bundle
```

3. Generate feature specs for Clearance in Rails. This will also generate necessary Factories in the project to support the testing. (What is factory? -- to be updated). Run the following:

```bash
$ rails generate clearance:specs
```

4. require "clearance/rspec" in:
```
<project_directory>/spec/rails_helper.rb
```

5. Call `sign_in` helper method before your test so that the tests will not fail due to the authentication process. Example:

```ruby
RSpec.describe PostsController, type: :controller do
  # call sign_in method to pass authentication
  before(:each) { sign_in }

  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end
end
```

## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails generate clearance:install
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```
