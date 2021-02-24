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

2. **Licensing:** This project is licensed under the [GNU GPL v.3.0](https://www.gnu.org/licenses/gpl-3.0.en.html).

3. **Authors:** This repository is a joint project between its collaborators.

---

## Table of Contents

#### 1. Parsing User Stories
- [x] User Story 01
- [x] User Story 02
- [x] User Story 03
- [x] User Story 04
- [x] User Story 05

#### 2. Database Domain Modelling
- [x] Posts Table
- [x] Users Table

#### 3. MVP Planning

#### 4. Layout Planning

#### 5. Feature & Unit Testing

---

## Parsing User Stories

### Headline Specifications

Actions are *italic*. Nouns are **bold**. Attributes of nouns are **_bold italics_**.

##### User Story 01

&nbsp;&nbsp;&nbsp;As a user,<br>
&nbsp;&nbsp;&nbsp;So I can use AceBook<br>
&nbsp;&nbsp;&nbsp;I would like to be able to sign up to Acebook<br>

##### User Story 02

&nbsp;&nbsp;&nbsp;As a user,<br>
&nbsp;&nbsp;&nbsp;So I can access my account on AceBook<br>
&nbsp;&nbsp;&nbsp;I would like to be able to login to Acebook<br>

##### User Story 03

&nbsp;&nbsp;&nbsp;As a user,<br>
&nbsp;&nbsp;&nbsp;So I can share my annoying political opinions<br>
&nbsp;&nbsp;&nbsp;I would like to be able to make a post on Acebook<br>

##### User Story 04

&nbsp;&nbsp;&nbsp;As a user,<br>
&nbsp;&nbsp;&nbsp;So I can see what others are saying<br>
&nbsp;&nbsp;&nbsp;I would like to be able to see all posts on Acebook<br>

##### User Story 05

&nbsp;&nbsp;&nbsp;As a user,<br>
&nbsp;&nbsp;&nbsp;So I can see what my friends are saying<br>
&nbsp;&nbsp;&nbsp;I would like to be able to see who made posts on Acebook<br>

---

### 'Nice to Have' Specifications

---

## Database Domain Modelling

The above user stories parse into several classes. As per [Class Responsibility Collaborator](http://agilemodeling.com/artifacts/crcModel.htm) modelling, there are two obvious classes - **User** and **Post**.

Class: **Post**

Responsibility | Collaborators
--- | ---
Knows owner | User

Knows own content |
<!-- Knows own creation time and date | -->
<!-- Knows edit time and date | -->

Class: **User**

Responsibility | Collaborators
--- | ---
Knows own user_name |
Knows own user_email |
Knows own password |
Knows own posts | Post
<!-- Knows own profile pic url | Post -->

Each class needs its own table, each with columns corresponding to the responsibilities of each class.

Table: **Users**

user_id PK | user_name | user_email | user_password_digest
--- | --- | --- | ---

Table: **Posts**

post_id PK | user_id FK | post_content
--- | --- | ---

Additional columns in Users: user_profile_pic
Additional columns in Posts: post_time, edit_time

---

## MVP Planning

- [ ] Homepage with a list of posts
- [ ] Homepage with a signup option
- [ ] Signup form
- [ ] Homepage with a login form
- [ ] Tables to receive user data
- [ ] Homepage with post form for a new post

---

## Layout Planning

- [x] Wireframe Signup Page
- [x] Wireframe Login Page
- [x] Wireframe New Post Page
- [x] Wireframe Homepage

<img src="/app/assets/images/wireframes/signup_page_wireframe.png" width="600">

<img src="/app/assets/images/wireframes/login_page_wireframe.png" width="600">

<img src="/app/assets/images/wireframes/new_post_page_wireframe.png" width="600">

<img src="/app/assets/images/wireframes/timeline_page_wireframe.png" width="600">

---

## Feature & Unit Testing

Taking for example User Story 01 (`I would like to be able to sign up to Acebook`), this presupposes the ability to sign up to become a user.

Creating these follows the TDD process:
1. Composition of pseudocode.
2. Composition of feature tests.
3. Composition of unit tests.
4. Composition of code.
5. Running of feature and unit tests.
6. Refactoring, and if necessary correction of code.
