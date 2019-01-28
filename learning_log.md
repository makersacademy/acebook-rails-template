## Learning log Team Justice Moo

Monday 28th Afternoon Stand-Up
----

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

