class AddTargetUserToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :target_user, :string
  end
end
