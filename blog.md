Team Umberto Jack Asia Katie David - U-Jakd!


# Monday 10th February 2020 (David)

Today we were randomly assigned into the U-Jakd team! We first discussed when we would have stand-ups, retro's and then laid out a plan as to what we would hope to achieve by the time Wednesday mornings Sprint Demo takes place. We first mobbed - creating the github repo, slack channel and trello board. We then installed rails, discussed adding the necessary gems we would likely need, and added the continous integration (settling on using Travis!) Travis intergration proved tricky, we intally linked this to our repo, but then had some continued troubles with adding our herokou credentials. After much googling we found the answer, and have fully set up our CI and testing suite, the app is up and running on Herokou, and user stories were created and split up into individual tasks which the sub teams will tackle tomorrow.


# Tuesday 11th February 2020 (Asia)

Today was the second day of the project and time to start Rails. We started the day learning about Rails and how to use it, attending the Rails surgery and then spending the rest of the morning working independently. We then separated into a pair and a three and divided the tasks between the us. Umberto and Jack worked on getting the user sign up and login working whilst the rest of us connected the posting to the users. Connecting the two databases proved harder than we thought, but once we generated the foreign key it all worked smoothly. 


# Wednesday 12th February 2020 (Jack)


# Thursday 13th February 2020 (Katie)

Today was an extremely productive day with both exisiting code being refactored and improved but also lots of new features implemented. We acheived this through both pairing and mobbing when required. Because our group is working so well, we has to pace ourselves a little and really explore our code and revisit it to ensure that we did not run out of things to do! Highlights of the day include; clicking the home button shows all posts from all users, email links to individual pages/posts and a lot of functional refactoring.

# Friday 14th February 2020 (Umberto)

We are fairly confident going in, we met all our goals and are able to present an MVP.
The meetings go smoothly, our client is happy, and nothing has to be changed to achieve the user stories.
This leaves us with time to implement optional functionality as the GitHub login.
On the technical side, everything was linear, there's a ton of rails documentation and that made our journey really easy.
There's nothing else to do, other than wait for more user stories from our new client Sophie.



# Monday 17th February 2020 (Katie)

Today we had the pleasure of meeting our new product manager/ client. She looked over the project and had a few suggestions on changes to make. We started to implement a few, such as making it so that posts on users walls did not duplicate on the homepage. We also started working on allowing users to comment on posts. We went for a team lunch where we (tried) to not discuss the project which was great for team bonding. We had a fair few moments of feeling completly stuck however we combatted this by mobbing. Mobbing helped on several occasions as it enabled a fresh pair of eyes to look at a problem- which once had been a minor typo!

# Tuesday 18th February 2020 (Umberto)

The day started on a good note, we were able to resolve all the problems that blocked us the day before.
User comments were quickly sorted out introducing a many to one user relationship through post, this was the missing key piece of information from yesterday.
We then improved our test coverage and introduced a custom 404 page for user not found.
Comments edit and delete were tackled by the team and almost finished.
On a branch we now display the username of the user in the url, implementing this with the minimum amount of change to the code has been a challenging feat.
We ended up overwriting one of the ActiveRecords method to accept different kind of input while returning the same results.
Once comments are deployed we will integrate this change to the master.

# Wednesday 19th February 2020 (Asia)

The day started with half of us implementing the chat feature and the others working on an update username. It all went smoothly and we had both these features working by lunchtime. After a quick game of team Table Tennis we started the afternoon, switching up the pairs and starting on adding friends and adding likes to comments. Both groups hit some bumps but were able to overcome these through a bit of mobbing and googling and the adding friends feature was added. After a few attempts at adding the likes to comments we decided to call it a day and have a look at it with fresh eyes in the morning.

# Thursday 20th February 2020 (Jack)


# Friday 21st February 2020 (David)

Today was the final day of the project. I spent the morning with Asia making the last changes to the likes feature avaliable for comments this time (instead of posts). We initally tried to use the Like controller as an extension to the comments, but this quickly became complicated and we realised that the likes would increment on comments and posts together. We generated a new model that would only be associated with comments and would therefore be independant. We then spent the rest of the morning tidying up some tests and DRY-ing out some code, and then spending some time preparing some final styling points ahead of the presentation.