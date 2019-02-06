## Learning log Team Justice Moo

Monday 28th of January
------------------------
Planning day (morning)

Afternoon Stand-Up

** What were we trying to achieve?
* Basic understanding of rails
* Deploy our app on Heroku
* Automatically deploy after CI tests
* Set up Travis CI to check our merge and master status

** What did we learn?
_Heroku_
* We learned that Heroku is a hosting provider service
* We were able to figure out how to set up automatic deployment by connecting Heroku to the github repository
* We were able to set up deployment only if tests pass CI
* We learned basic Heroku commands and how to use it from the command line
* We learned that we can deploy not only from the master branch but from any branch we choose
* We learned that we cannot deploy pure Javascript app/without node

_Travis CI_
* Reinforced basic understanding of Continuous Integration functionality
* Found out that the Travis .yml file is so sensitive to indendation that it won't run properly without the correct number of spaces in the indents
* Also found out importance of having the 'bundle install --jobs=3 --retry=3' command at the top of the 'script:' section of the .yml file
* We can get Travis set up so that it will pass latest iteration to Heroku automatically, as long as it passes the tests

--------------------------------------------
Tuesday 29th of January
----------------------
Retro day (afternoon)

Morning Stand-Up

** What we were trying to achieve ?
* Explain how to set Travis to the all Team CI
* Check on the team mood of the day
* Goals for the Monday

** What did we learn ?
* How to set up Travis CI
* Possible error when setting it up

** Goals of the day ?
* Pair decided per tickets
* Retro at the end of the day


Afternoon Stand-Up

** ** What are we trying to achieve ?
* Understand how to build a sign in / sign up route from scratch in rails
* Make simplecov branch passing Travis tests

** Goals for the rest of the day ?
* For both sign in and sign up pairs:<br/>
Write and pass infrastructure feature test.<br/>
Creating new index page and populate with content
* Joao is taking alone the ticket of debugging Travis / Simplecov-console

--------------------------------------------
Wednesday 30th of January
-------------------------
Planning day (morning)

* We decide to not do any stand Up on this day, because we did a long Planning session in the morning to decided of the complexity of the tickets and allocated them.
* During the planning session we also diagram and mock-up the project

--------------------------------------------
Thursday 31th of January
------------------------
Retro day (afternoon)

Morning Stand-Up

** What we were trying to achieve ?
* sign-in / sign-up tickets => be able  redirect  user to the profile page when click on sign up/sign in

** What did we learn ?
* Partials can be use in rails, really useful because it helps to dry code
* Rails generate cmd. Rails new default settings, possibility to pass params to have or not have what is wanted or unwanted
* How to create and use a form in rails.
* Difference between button (post request) and link (get request)
* Awareness of a lot of steps between DB and views
* Routes syntax not a */* but *something#pathname*
* Need to  create user table

** Goals of the day ?
* Pair changed for tickets
* Retro at the end of the day

Afternoon Stand-Up

** ** What are we trying to achieve ?
* same as morning

** Goals for the rest of the day ?
* restart from scratch as a mob instead of pairs as we were feeling that split the sign up/sign in ticket was a bit confusing and to linked to be done separately.

--------------------------------------------
Friday 1st of February
------------------------
Planning day (morning)

Morning Stand-Up

* We decide to not do any stand Up on the morning, because we did a long Planning session.

** Goals of the day ?
* Work on ticket all together for better understanding of rails flow

Afternoon Stand-Up

** What are we trying to achieve ?
* sign in / sign up manually all together

** Goals for the rest of the day ?
* Carry on with mobbing

--------------------------------------------
Monday 4th of February
----------------------
Retro day (afternoon)

Morning Stand-Up

** What we were trying to achieve ?
* sign-in / sign-up tickets
* Readme - diagram

** What did we learn ? (based on the weekend challenge)
* Full Rails workflow
* Power of Devise
* How to upload images (Paperclip + ImageMagick || Active Storage)
* Active Record functionalities

** Goals of the day ?
* Use devise gem for sign-in/sign-up tickets
* Write readme and make diagrams on draw.io
* Retro at the end of the day

Afternoon Stand-Up

** ** What are we trying to achieve ?
* same as morning

** Goals for the rest of the day ?
* Same as morning

--------------------------------------------
Tuesday 5th of February
----------------------
Planning day (afternoon)

Morning Stand-Up

** What we were trying to achieve ?
* User can edit / delete any posts
* Being able to visit profile page from the user id

** What did we learn ?
* Sticking to TDD / write tests
* When in doubt use database cleaner
* Migration files
* Walk through is amazing for everything

** Goals of the day ?
* Carry on on our ticket
* Ticket of user being able to edit/update posts


Afternoon Stand-Up

** What are we trying to achieve ?
* same as morning

** Goals for the rest of the day ?
* Same as morning

--------------------------------------------
Wednesday 6th of February
-------------------------
Retro day (afternoon)

Morning Stand-Up

** What we were trying to achieve ?
* User can edit / delete any posts + fix the create new post we broke the day before
* Being able to visit profile page from the user id

** What did we learn ?
* Unpacking devise
* Routes
* Relation between routes and controller
* Use of pry also possible with rails

** Goals of the day ?
* Carry on on our ticket / fix what we broke
* We keep the same pairs as yesterday for today
* Ticket of user being able to edit/update only their own posts
* Retro at the end of the day

Afternoon Stand-Up

* No afternoon stand up as 2 person were in a meeting and because of retro at the end of the day
