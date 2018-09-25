## Domain model - Acebook - PushMePullMe


```

Framework: Ruby on Rails

Database: PostgreSQL interacts with the controller via Active record ORM

Hosting platform: Heroku

Feature testing: Capybara (to be decided) / Travis CI

Unit testing: RSpec, Ruby on Rails native testing framework

|---------------------------------------------|

| Post Controller     |

| Post Model          |
|---------------------|
| class: Post         |
| --------------------|
| Create post         |
| see Posts           |
| Update/edit posts   |
| Delete posts        |


| Post/s View         |

|-------------------------------------------------|


| User Controller     |

| User Model          |
|---------------------|
| class: User         |
| --------------------|
| Sign up             |        
| Log in              |
| Delete Account      |


|----------------------------------------------------|

| class: comment      |
| belongs_to :Post    | Set up relationship with Post via associations
|---------------------|


|-------------------------------------------------------|


| class: Like         |


|--------------------------------------------------------|


| Active Record |

| PostgreSQL    |




```
