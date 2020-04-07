def database_connection
    if ENV['RAILS_ENV'] == 'test'
        return PG.connect(dbname: "pgapp_test")
    else
        return PG.connect(dbname: "pgapp_development")
    end
end