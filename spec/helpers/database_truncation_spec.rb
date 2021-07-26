require 'rails_helper'

def truncate_all_tables
  config = ActiveRecord::Base.configurations[::Rails.env]
  connection = ActiveRecord::Base.connection
  connection.disable_referential_integrity do
    connection.tables.each do |table_name|
      next if connection.select_value("SELECT count(*) FROM #{table_name}") == 0
      case config["adapter"]
      when "mysql", "mysql2", "postgresql"
        connection.execute("TRUNCATE #{table_name}")
      when "sqlite", "sqlite3"
        connection.execute("DELETE FROM #{table_name}")
        connection.execute("DELETE FROM sqlite_sequence where name='#{table_name}'")
      end
    end
    connection.execute("VACUUM") if config["adapter"] == "sqlite3"
  end
end