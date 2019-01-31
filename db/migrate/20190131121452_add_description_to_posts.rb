class AddDescriptionToPosts < ActiveRecord::Migration[5.1]
  def change
  	add_column :posts, :description, :text
    # add_column :posts, :created_at, :datetime
    # add_column :posts, :updated_at, :datetime
  end
end
