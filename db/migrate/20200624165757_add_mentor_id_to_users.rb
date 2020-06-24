class AddMentorIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :user, foreign_key: true
  end
end
