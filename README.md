# AceBook

REQUIRED INSTRUCTIONS:

1. Fork this repository to `acebook-teamname` and customize the below.

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

That is because Rails will use a Javascript runtime (such as Node) under the hood. The easiest way is to install Node by running `brew install node` - and then run `bundle exec rspec` again

---

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
