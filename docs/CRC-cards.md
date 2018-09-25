## CRC cards

As part of our initial domain modelling session, we have outlined a set of CRC cards to use as a guide to setting up our class objects, with thoughts on collaborator relationships and some behavioural structure. These will also be used to map out out database tables and their interactions with each other.

```

### User:

| Responsibility  |  Collaborator  |
|-----------------|----------------|
| Email           |                |
| ID              |                |
| Name - First    |                |
| Name - Last     |                |
| Password        |                |
| Create Post     |                |


### POST:

| Responsibility  |  Collaborator  |
|-----------------|----------------|
| ID              | User           |
| Text            |                |
| Knows poster    |                |
| Add comments    |                |
| Add like        |                |
| Update text     |                |
| Delete self     |                |


### Comments:

| Responsibility  | Collaborator   |
|-----------------|----------------|
| ID              | Post           |
| Link to user id | User           |
| Link to a post  |                |


### Likes:

| Responsibility  | Collaborator   |
|-----------------|----------------|
| ID              | Post           |
| Link to user id | User           |
| Link to a post  |                |




```
