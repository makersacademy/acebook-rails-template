# frozen_string_literal: true

def setup_test_db
  puts 'Setting up test database...'

  User.delete_all
end
