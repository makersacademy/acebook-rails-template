require 'pg'
def setup_test_database 
  p 'Setting up test database'
  connection = PG.connect(dbname: 'pgapp_test')
  connection.exec('TRUNCATE users, likes, dislikes, albums, images, active_storage_attachments, active_storage_blobs, relationships;')
end