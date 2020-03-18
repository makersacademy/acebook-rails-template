cd /Users/student/Programming/Makers/Projects/acebook-catflap

RACK_ENV=development rails db:drop
RACK_ENV=development rails db:create
RACK_ENV=development rails db:migrate
