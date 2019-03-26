PATHWAY =>   
 Browser ---> Controller ----> Model (links database) ------> Controller -----> Views

Generating new table in database:

1 - bin/rails generate migration CreateSignups username:string password:string email:string

2 - bin/rails db:migrate VERSION=20190326112345
