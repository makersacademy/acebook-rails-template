class AmendLikesForPostsAndComments < ActiveRecord::Migration[5.1]
  def change
    rename_column :likes, :post_id, :likeable_id
    add_column :likes, :likeable_type, :string, polymorphic: true
    change_column :likes, :likeable_id, :integer, polymorphic: true
  end
end

