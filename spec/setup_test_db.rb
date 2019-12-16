require 'pg'

def setup_test_db
  p "Setting up test database..."

  connection = PG.connect(dbname: 'pgapp_test')

  connection.exec('TRUNCATE users;')
end