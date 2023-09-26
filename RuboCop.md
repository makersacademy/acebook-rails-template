RuboCop

https://github.com/rubocop/rubocop

RuboCop is an open-source static code analysis tool for the Ruby programming language. It is designed to help developers write clean, consistent, and maintainable Ruby code by enforcing a set of coding style rules and best practices. RuboCop examines your Ruby code and identifies violations of these rules, providing suggestions and feedback on how to improve your code's quality.

Key features of RuboCop:

1. Coding Style Enforcement: RuboCop enforces a wide range of coding style guidelines, such as indentation, naming conventions, whitespace usage, and more. It helps ensure that your code follows a consistent and readable style, making it easier for developers to collaborate on projects.

2. Configurability: RuboCop is highly configurable, allowing you to customize its behavior to match your team's coding standards and preferences. You can adjust the rules and severity levels to fit your project's specific requirements.

3. Auto-Correction: RuboCop can automatically correct many style violations, saving developers time and effort in manually fixing issues.

4. Extensibility: RuboCop is extensible through the use of plugins and custom rules. This means you can tailor it to address domain-specific coding guidelines or additional checks beyond the default set.

5. Integration: RuboCop can be integrated into various development workflows and tools, including text editors, IDEs, continuous integration (CI) pipelines, and code review processes. Popular editors like Visual Studio Code and popular CI/CD platforms like Jenkins often support RuboCop integrations.


There are two ways to install RuboCop:

standard installation in terminal:

```sh
$ gem install rubocop
```

Through bundler, for this add this line to your Gemfile:

```rb
gem 'rubocop', require: false
```
then run 

```rb
bundle install
```

To get it running, Just type `rubocop` in a Ruby project's folder, for example:

```
$ cd acebook-Acedit/spec/features
$ rubocop
```

The result should be of the following:



Here you can see that RuboCop is reccomending to use single quotes rather than double quotes unless you are using string interpolation or special symbols. 