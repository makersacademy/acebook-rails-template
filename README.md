# AceBook

REQUIRED INSTRUCTIONS:

1. Fork this repository to `acebook-teamname` and customize
the below**

[You can find the engineering project outline here.](https://github.com/makersacademy/course/tree/master/engineering_projects/rails)

2. The card wall is [here](https://trello.com/b/aN3xtXXl/acebook-rails-template).

## How to contribute to this project
See [CONTRIBUTING.md](CONTRIBUTING.md)

## Quickstart

First, clone this repository. Then:

```
bash
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

---

# MakersBNB Challenge

This repository supports [Makers](https://makers.tech/) Week 5 group challenge 'makersbnb'.

1. **Installation:**
   1. It is recommended that prior to installation, you ensure your development environment is updated. In particular, we recommend you run commands `softwareupdate --install -a` and `rvm get stable` to ensure your computer and rvm installations are current.
   2. This project requires Ruby 3.0.0. If you're unsure as to whether you have 3.0.0 installed, run `rvm list` and ensure that 3.0.0 is listed. If it is not, install it with `rvm install 3.0.0`.
   3. Clone or fork this repository.
   4. To install the necessary Gems, run command `bundle`.
       - Some users experience an error during the `bundle`ing process owing to difficulties installing dependencies of `thin`.
       - To correct this error, run command `gem install thin -v '1.6.4' -- --with-cflags="-Wno-error=implicit-function-declaration"` to install version 1.6.4.
       - Then run command `gem install thin` to install the current version of `thin`.
       - Then run command `gem uninstall thin`, and uninstall version 1.6.4 with command `1`.
       - Repeat step 4 to resume the `bundle` process.
   5. To create the databases, run command `rake db:create`.
   6. To refresh the databases, which is **recommended only after structural changes have been made to a database**, run command `rake db:schema:load`.

2. **Licensing:** This project is licensed under the [GNU GPL v.3.0](https://www.gnu.org/licenses/gpl-3.0.en.html).

3. **Authors:** This repository is a joint project between its collaborators; @HamishArro, @RTurney, @JoshSinyor, and @mscwilson.

---

## Table of Contents

#### 1. Parsing User Stories
- [ ] User Story 01

#### 2. Database Domain Modelling
- [ ]

#### 3. MVP Planning

#### 4. Feature & Unit Testing

---

## Parsing User Stories

### Headline Specifications

Actions are *italic*. Nouns are **bold**. Attributes of nouns are **_bold italics_**.

##### User Story 01

&nbsp;&nbsp;&nbsp;As a user,<br>
&nbsp;&nbsp;&nbsp;<br>
&nbsp;&nbsp;&nbsp;

---

### 'Nice to Have' Specifications

---

## Database Domain Modelling

The above user stories parse into several classes. As per [Class Responsibility Collaborator](http://agilemodeling.com/artifacts/crcModel.htm) modelling, there are two obvious classes - **User** and **Space**.

Class: **Space**

Responsibility | Collaborators
--- | ---
Knows owner | User
Knows own name |
Knows own description |
Knows own price |
Knows own availability |
Knows own bookings |

Class: **User**

Responsibility | Collaborators
--- | ---
Knows own name |
Knows own username |
Knows own e-mail |
Knows own password |
~Knows own telephone number~ |
Knows own spaces | Space

Each class needs its own table, each with columns corresponding to the responsibilities of each class.

Table: **Users**

id PK | user_name | user_email | password_digest
--- | --- | --- | ---

Table: **Spaces**

id PK | space_name | description | price | user_id FK | start_date | end_date
--- | --- | --- | --- | --- | --- | ---

Table: **Bookings**

id PK | start_date | space_id FK | user_id FK | accepted
--- | --- | --- | --- | ---

---

## MVP Planning

- [ ] Create a listing from form

---

## Feature & Unit Testing

Taking for example User Story 01 (`I’d like to be able to create a listing of a space.`), this presupposes the existence of a user, a space, and the ability to list it.

Creating these follows the TDD process:
1. Composition of pseudocode.
2. Composition of feature tests.
3. Composition of unit tests.
4. Composition of code.
5. Running of feature and unit tests.
6. Refactoring, and if necessary correction of code.
