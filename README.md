# AceBook - 409ers

## Contributing to the Project
### Setting Up Local Environment

First, clone the repository. 

Install Gems:

```bash
bundle install
```

Set up databases:

```bash
bin/rails db:create
bin/rails db:migrate
```

Run tests to ensure setup succeeded:

```bash
bundle exec rspec
```

Start the server at localhost:3000 to confirm:

```bash
bin/rails server
```

### How to Run Tests

To run all tests once manually: 

```bash
bundle exec rspec
```

To run tests using guard on watch mode:

```bash
bundle exec guard --clear
```

This will start guard, which will run tests automatically as changes are made to code.
