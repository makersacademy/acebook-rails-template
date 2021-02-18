class AddRatingToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :rating, :integer, default: 0
  end
end
