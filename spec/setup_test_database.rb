require 'pg'
def setup_test_database 
  p 'Setting up test database'
  connection = PG.connect(dbname: 'pgapp_test')
  connection.exec('TRUNCATE users, likes, dislikes, albums;')
end