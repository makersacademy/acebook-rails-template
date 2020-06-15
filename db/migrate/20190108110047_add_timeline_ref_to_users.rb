class AddTimelineRefToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :timeline, foreign_key: true
  end
end
