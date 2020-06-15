class AddUserRefToTimeline < ActiveRecord::Migration[5.1]
  def change
    add_reference :timelines, :user, foreign_key: true
  end
end
