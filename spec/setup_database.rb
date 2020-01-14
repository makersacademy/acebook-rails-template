def setup_database
  @connection = PG.connect(dbname: 'pgapp_test')
  @connection.exec("TRUNCATE TABLE posts")
end
