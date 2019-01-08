class AddTimelineRefToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :timeline, foreign_key: true
  end
end
