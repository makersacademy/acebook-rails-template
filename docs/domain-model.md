## Domain model - Acebook - PushMePullMe


Framework: Ruby on Rails

Database: PostgreSQL interacts with the controller via Active record ORM

Hosting platform: Heroku

Feature testing: Capybara (to be decided) / Travis CI

Unit testing: RSpec, Ruby on Rails native testing framework




```


|------------------|
|  Client/Browser  |  The web user interacts with the browser to send HTTP requests to the web Server.
|                  |
|------------------|
        |
        |
        |
        |
|------------------|
|   Server         |   To be hosted on Heroku.
|                  |
|------------------|
        |
        |
        |    App built on the Ruby on rails framework
        |
|------------------|                                       |-----------------------|
|                  |-------------------------------------->|                       |
|   Controller     |                                       |  Model                |
|                  |<--------------------------------------|                       |
|------------------|                                       |-----------------------|
     |       |                                                    |         |
     |       |                                                    |         |
     |       |                                             |-----------------------|
|------------------|                                       |                       |
|                  |                                       |   Active record ORM   |
|   Views (erb)    |                                       |                       |
|                  |                                       |-----------------------|
|------------------|                                              |         |
                                                                  |         |
                                                           |-------------------------|
                                                           |                         |
                                                           |  Database (PostgreSQL)  |
                                                           |                         |
                                                           |-------------------------|



```
