Spike - Code coverage and implementing it 

https://github.com/simplecov-ruby/simplecov/tree/main

SimpleCov is a code coverage analysis tool for Ruby programming language. It helps developers understand how much of their codebase is being exercised by automated tests. It measures which lines of code are executed during the execution of a test suite and provides a report showing the percentage of code coverage.

It can be integrated with testing frameworks such as RSpec. When you run your tests with SimpleCov enabled, it tracks which lines of code are executed and generates a report that shows which parts of your code are covered by your tests and which are not.

This information is valuable for identifying areas of your codebase that may lack test coverage, helping you write more comprehensive test suites and improve the overall quality of your software.

To use SimpleCov, you need to add it as a dependency to your Ruby project, configure it to work with your testing framework, and then run your test suite with coverage analysis enabled. The resulting coverage report can be viewed in various formats, such as HTML, JSON, or text, to help you visualise and analyse the code coverage of your project.

Steps to set up in your environment:

1. Add this to the Gemfile 
    
    ```ruby
    gem 'simplecov', require: false, group: :test
    ```

2. run 
    ```ruby
    bundle install
    ```
    

3. In your `spec/spec_helper.rb` and `rails_helper.rb` add:

    ```ruby
    require 'simplecov'
    SimpleCov.start

    # Previous content of test helper now starts here
    ```

4. Add this to your bin/rails file. Below the 'shebang' line which is `(#! /usr/bin/env ruby)` and the `require_relative '../config/boot'`

     ```ruby
    if ENV['RAILS_ENV'] == 'test'
      require 'simplecov'
      SimpleCov.start 'rails'
      puts "required simplecov"
    end
    ```

5. After running rspec you should see this output in terminal:

    `Coverage report generated for RSpec to /Users/path_to_application_directory/acebook-Acedit/coverage. 88 / 88 LOC (100.0%) covered.`

6. To see the full report in html format run the following from root of your application directory:

    ```ruby
    open coverage/index.html
    ```
    
7. Add the following to your `.gitignore` file to ensure that coverage results are not tracked by Git. 

    Run this in terminal:

    ```ruby
    echo coverage >> .gitignore
    ```


    Or add `'coverage'` to `.gitignore`

