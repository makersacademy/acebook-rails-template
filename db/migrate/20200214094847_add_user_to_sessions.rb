class AddUserToSessions < ActiveRecord::Migration[5.1]
  def change
    add_reference :sessions, :user, index: true, foreign_key: true
  end
end
