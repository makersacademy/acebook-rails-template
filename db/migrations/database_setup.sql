CREATE EXTENSION pgcrypto;
CREATE TABLE users(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(), 
  email VARCHAR(45) NOT NULL UNIQUE,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  password TEXT NOT NULL
  );

  CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    message TEXT NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    user_id UUID NOT NULL REFERENCES users(id)  
  );