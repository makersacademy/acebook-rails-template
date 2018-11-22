# Acebook

## Code Quality

### Linting

* Run `rubocop` in the command line.


## Testing

### Test coverage
* After running tests, open `coverage/index.html` to see test coverage.

## Deploying
* To deploy on heroku please enter this url into your browser: https://maicers-acebook.herokuapp.com/


## Setting Up Enviroments
### Test Environment
1. `cd` into directory
2. `bin/rails db:setup`
3. `bin/rails db:seed RACK_ENV=test`
4. To runs tests, run `rspec`. The test files can be found with in the `spec` folder

### Development Environment
1. `cd` into directory
2. `bin/rails db:setup`
3. To launch the server, run `rails server`
4. To visit the site, got to `http://localhost:3000/` in your web browser

### Production Environment
Visit https://maicers-acebook.herokuapp.com/ in your web browser
