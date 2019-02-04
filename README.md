# Justice_Moo AceBook #

# Acebook #

## project ##

We are building a web app similar to Facebook, based on the following user stories :

```
As a user
So that I can create an account
I need to be able to sign up
```
```
As a user
So I can access my account
I need to be able to sign in
```
```
As a user
So I can leave my account
I need to be able to sign out
```
```
As a user
So that I can share what I am doing
I need to be able to create a new post
```
```
As a user
So that I can my own personal wall
I want to be able to access my profile page
```
```
As a user
So I can have change my posts
I need to be able to edit my posts
```
```
As a user
So I can remove one of my post
I need to be able delete my posts
```
```
As a user
So I can look at what others users are doing
I need to be able to view all their posts
```
## Our approach ##

This project is done in a team of 5 people.<br/>
We are using these high level skills :<br/>
1. [XP values](#xp-values) to guide your behaviour<br/>
2. The full [developer workflow](#development-workflow) (Creating issues, branching, reviewing, squirrelling, merging.<br/>
3. Keeping code quality and test coverage using *Rspec*, *Capybara*, *simpleCov*, *Rubocop*, *Travis* <br/>
4. Agile processes (diagram, morning/afternoon stand up, 2 days sprint (planning days - retro days))*

We choose to build a MVC diagram for the project :

![acebook mvc diagram](https://user-images.githubusercontent.com/43742795/52224655-712a8080-28a0-11e9-9a0c-0f83bbd11477.png)


We built our CRC Model based on the user story as following.<br/>

![acebook-crc diagram tables](https://user-images.githubusercontent.com/43742795/52222701-0a0acd00-289c-11e9-967f-ae23f657de9b.png)

We decided to prioritise our Minimum Viable Product on the first week by building our MVP as following :<br/>

1. User is able to sign_up
2. User is able to sign_out
3. User is able to sign_in
4. User is redirected on the posts page where they can see all the posts from all the users, and create a new post.
5. User can see on their profile page the list of their posts, and can choose to edit or delete their posts.<br/>

The MVP has been built from this mock-up:

![acebook-mockup](https://user-images.githubusercontent.com/43742795/52222653-ea73a480-289b-11e9-9f3a-b8ec15b4699a.png)

### Tech stack ###

* Ruby on rails
* Rspec/Capybara
* Html
* Css

### Code quality ###

* Rubocop - linter
* simpleCov - code coverage
* Travis - CI

## How to use ##

### Set Up ###

1. clone the repo<br/>
Under the repo name click *clone or download*<br/>
Click on *use HTTPs*, copy the clone URL of the repo<br/>
In the terminal go on the working directory where you want the cloned directory to be<br/>
Use the `git clone` command and paste the clone URL then press enter :

```shell
$ git clone https://github.com/your-username/your-repositary.git
```

2. On your local machine go inside of the *acebook_Justice_Moo* directory :

```shell
$ cd acebook_Justice_Moo
```
3. You can see the different files by using the `ls` command :<br/>

```shell
$ ls
```

4. You can open any files that you want to read and change the code in your text editor or using `vim` :

```shell
$ vim wanted_file.rb
```
Or you can just read the contains of it from the command line with `cat` :

```shell
$ cat wanted_file.html.erb
```
5. To install all the *gems* contained in the *Gemfile*, install and run *Bundle* :
Install :

```shell
$ install bundle
```
Run:

```shell
$ bundle
```
6. You can see the different directories, with the `ls` command.

### Database ###

1. If you do not have it already, install *psql* on your local machine.

2. On the command line fronm the root directory run the `rake` command followed by the `db:migrate` command. This will create your databases and tables in your development DB.<br/>

```shell
$ rake db:migrate
```

3. From the command line run the `rake` command followed by the `db:migrate RACK_RAILS=test` command. This will create your tables in your test DB.<br/>

```shell
$ rake db:migrate RAILS_ENV=test
```

4. Connect to psql and connect to your database using the `\c databasename;` command.<br/>
Once you are connected to the database you've chosen, you can list the tables using the `\dt` command.<br/>

```shell
$ psql
admin= \c pgapp_development;
pgapp_development= \dt
```
5. You can connect to a specific table by using the `SELECT * FROM tablename;` command.<br/>

```shell
pgapp_development= SELECT * FROM tablename;
```
### Run the tests ###

1. Check that the codes are passing the test. From the root *acebook_Justice_Moo* directory, run the *spec*.<br/>
You can check all the files in one go:

```shell
$ cd acebook_Justice_Moo
$ rspec
```
To check only one file at a time :

```shell
$ cd acebook_Justice_Moo
$ rspec spec/file_name_spec.rb
```

2. Check that the code respects the quality of the *Rubocop* guideline, by running `rubocop` from the *acebook_Justice_Moo* directory :

```shell
$ cd acebook
$ rubocop
```

## Run the app ##

1. On your command line, from your root directory, use the `rails s` command to run the server :

```shell
$ rails s
```

or you can access it via *Heroku* where we deployed our app :

https://polar-scrubland-14593.herokuapp.com/

2. Open your browser and got to the *localhost:3000* <br/>
The page will be displayed on your browser.

3. Enjoy playing around with our app as much as you want :smile:


## Authors ##

Our 5 fabulous *Justice_Mooeesss* team members who collaborate to build this app :<br/>
@MichaelNguyen974 <br/>
@joaoag (João Abbott-Gribben)<br/>
@subomionanuga
@tomlovesgithub
@CelineKaslin
